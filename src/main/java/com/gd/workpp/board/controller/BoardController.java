package com.gd.workpp.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gd.workpp.board.model.service.BoardService;
import com.gd.workpp.board.model.vo.Board;
import com.gd.workpp.board.model.vo.Reply;
import com.gd.workpp.board.model.vo.Report;
import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	// 게시판 목록 조회
	@RequestMapping("list.bo")
	public String selectBoardList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, int no,
			String dept, HttpSession session, Model model) {

		String depName = ((Member) session.getAttribute("loginUser")).getDepName();

		int listCount = bService.selectListCount(no, depName);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Board> list = bService.selectList(pi, no, depName);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("listCount", listCount);

		if (no == 1) { // 공지게시판

			return "board/noticeBoardList";

		} else if (no == 2) { // 부서게시판
			
			ArrayList<Board> topList = bService.selectTopList(depName);

			model.addAttribute("depName", depName);
			model.addAttribute("topList", topList);
			return "board/deptBoardList";

		} else { // 익명게시판

			return "board/anonBoardList";

		}

	}

	// 글작성폼
	@RequestMapping("enrollForm.bo")
	public String enrollForm(int no, Model model) {

		String boardType = "";
		if (no == 1) {
			boardType = "공지";
		} else if (no == 2) {
			boardType = "부서";
		} else {
			boardType = "익명";
		}
		
		int saveCount = bService.selectSaveCount();

		model.addAttribute("typeNo", no);
		model.addAttribute("boardType", boardType);
		model.addAttribute("saveCount", saveCount);

		return "board/enrollForm";

	}

	// 게시글 임시저장
	@ResponseBody
	@RequestMapping(value="save.bo", produces="application/json; charset=UTF-8")
	public String ajaxSaveBoard(Board b, MultipartFile file, HttpSession session) {
		
		/*
		 * * 임시저장 여부는 boardNo이 빈칸이면 새글, 채워져있으면 임시저장글
		 *   첨부파일은 계속 누를 때마다 삭제하고 다시 삽입
		 * 
		 * == 임시저장 ==
		 * - 새로 임시저장 : saveBoard
		 * - 임시저장 갱신 : updateSave
		 * 
		 * == 등록 ==
		 * - 새로 등록 : insertBoard
		 * - 임시저장 불러와서 등록 : insert
		 */
		
		if(b.getTopExp() == null || !b.getTopExp().equals("Y")) {
			b.setTopExp("N");
		}
		
		Attachment at = new Attachment();
		
		if(b.getBoardNo().equals("")) { // 새로 임시저장
			
			
			// 첨부파일이 있을 경우 FileUpload클래스로 파일 변환 후 Board 객체에 담기
			if(!file.getOriginalFilename().equals("")) {
				
				String saveFilePath = FileUpload.saveFile(file, session,"resources/board_upfiles/");
				  
				at.setOriginName(file.getOriginalFilename()); 
				at.setChangeName(saveFilePath);
				at.setRefType(2);
			  
			}
			
			int result = bService.saveBoard(b, at);
			String boardNo = bService.selectBoardNo();
			
			if(result > 0) { // 임시저장 성공
				
				JSONObject jObj = new JSONObject();
				jObj.put("result", result);
				jObj.put("boardNo", boardNo);
				
				return jObj.toJSONString();
				
			}else { // 임시저장 실패
				
				JSONObject jObj = new JSONObject();
				jObj.put("result", result);
				
				return jObj.toJSONString();
				
			}
			
		}else { // 임시저장 업데이트
			int boardNo = Integer.parseInt(b.getBoardNo());
			
			// 글번호로 등록된 첨부파일 삭제하기
			// 해당하는 첨부파일 조회
			Attachment att = bService.selectAttachment(boardNo);
			
			if(att != null) {
				// db에서 해당 첨부파일 삭제
				int result = bService.deleteAttachment(boardNo);
				
				if(result > 0) {
					// 서버에 저장된 파일 삭제
					new File(session.getServletContext().getRealPath(att.getChangeName())).delete();
				}
			}
			
			// 첨부파일이 있을 경우 FileUpload클래스로 파일 변환 후 Board 객체에 담기
			if(!file.getOriginalFilename().equals("")) {
			  
				String saveFilePath = FileUpload.saveFile(file, session,"resources/board_upfiles/");
				  
				at.setOriginName(file.getOriginalFilename()); 
				at.setChangeName(saveFilePath);
				at.setRefType(2);
				at.setRefNo(boardNo);
			  
			}
			
			int result = bService.updateSaveBoard(b, at);
			
			JSONObject jObj = new JSONObject();
			jObj.put("result", result);
			jObj.put("boardNo", boardNo);
			
			return jObj.toJSONString();
			
		}
		

	}
	
	// 게시글 작성
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, String delFile, String changeName, MultipartFile file, HttpSession session, Model model) {
		
		if(b.getTopExp() == null || !b.getTopExp().equals("Y")) {
			b.setTopExp("N");
		}
		
		Attachment at = new Attachment();
		
		if(b.getBoardNo().equals("")) { // 새로 등록 => insert
		
			// 첨부파일이 있을 경우 FileUpload클래스로 파일 변환 후 Board 객체에 담기
			if(!file.getOriginalFilename().equals("")) {
			  
				String saveFilePath = FileUpload.saveFile(file, session,"resources/board_upfiles/");
				  
				at.setOriginName(file.getOriginalFilename()); 
				at.setChangeName(saveFilePath);
				at.setRefType(2);
			  
			}
			  
			int result = bService.insertBoard(b, at);
			  
			if(result > 0) { // 등록 성공
			  
				session.setAttribute("toastMsg", "게시글이 등록되었습니다."); 
				return "redirect:list.bo?no=" + b.getBoardType() + "&dept=" + b.getDepName();
			  
			}else { // 등록 실패
			  
				model.addAttribute("errorMsg", "게시글 등록에 실패했습니다."); 
				return "common/errorPage";
			  
			}
		
		}else { // 임시저장 불러와서 등록 => update
			
			int boardNo = Integer.parseInt(b.getBoardNo());
			
			// 삭제할 번호가 넘어온 경우
			if(delFile != null) {
				// 글번호로 등록된 첨부파일 삭제하기
				// db에서 해당 첨부파일 삭제
				int result = bService.deleteAttachment(boardNo);
				
				if(result > 0) {
					// 서버에 저장된 파일 삭제
					new File(session.getServletContext().getRealPath(changeName)).delete();
				}
			}
			
			// 첨부파일이 있을 경우 FileUpload클래스로 파일 변환 후 Board 객체에 담기
			if(!file.getOriginalFilename().equals("")) {
			  
				// 새로운 첨부파일 업로드
				String saveFilePath = FileUpload.saveFile(file, session,"resources/board_upfiles/");
				  
				at.setOriginName(file.getOriginalFilename()); 
				at.setChangeName(saveFilePath);
				at.setRefType(2);
				at.setRefNo(boardNo);
			  
			}
			
			int result = bService.insertSaveBoard(b, at);
			
			if(result > 0) { // 등록 성공
				  
				session.setAttribute("toastMsg", "게시글이 등록되었습니다."); 
				return "redirect:list.bo?no=" + b.getBoardType() + "&dept=" + b.getDepName();
			  
			}else { // 등록 실패
			  
				model.addAttribute("errorMsg", "게시글 등록에 실패했습니다."); 
				return "common/errorPage";
			  
			}
			
		}
		

	}

	// 임시저장 리스트 조회
	@ResponseBody
	@RequestMapping(value="saveList.bo", produces="application/json; charset=UTF-8")
	public String ajaxSaveList(Board b) {
		
		ArrayList<Board> list = bService.selectSaveList(b);
		
		return new Gson().toJson(list);
		
	}
	
	// 임시저장 게시글 조회
	@ResponseBody
	@RequestMapping(value="selectSave.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectSave(int boardNo) {
		
		// 글번호에 해당하는 게시글 조회
		Board b = bService.selectSave(boardNo);
		
		// 글번호에 해당하는 첨부파일 조회
		Attachment at = bService.selectAttachment(boardNo);
		
		HashMap<String, Object> map = new HashMap<>(); 
		map.put("b", b);
		map.put("at", at);
		
		return new Gson().toJson(map);
		
	}
	
	// 부서게시판 상세페이지
	@RequestMapping("deptDetail.bo")
	public String selectDeptBoard(int boardNo, int cpage, HttpSession session, Model model) {
		
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		Board bd = new Board();
		bd.setBoardNo(String.valueOf(boardNo));
		bd.setUserNo(userNo);
		
		// 조회수 증가
		int result = bService.increaseCount(boardNo);
		
		if(result > 0) {
			
			// 게시글 조회
			Board b = bService.selectBoard(boardNo);
			int bLike = bService.selectBoardLike(bd);
			
			model.addAttribute("cpage", cpage);
			model.addAttribute("b", b);
			model.addAttribute("bLike", bLike);
			return "board/deptDetail";
			
		}else {
			
			// 에러페이지
			return "common/errorPage";
			
		}
		
	}
	
	// 댓글 조회
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int boardNo) {
		
		ArrayList<Reply> list = bService.selectReplyList(boardNo);
		
		return new Gson().toJson(list);
		
	}
	
	// 댓글 작성
	@ResponseBody
	@RequestMapping(value="reply.bo", produces="application/json; charset=UTF-8")
	public String ajaxInsertReply(Reply r) {
		
		int result = bService.insertReply(r);
		
		JSONObject jObj = new JSONObject();
		jObj.put("result", result);
		
		return jObj.toJSONString();
		
	}
	
	// 대댓글 작성
	@ResponseBody
	@RequestMapping(value="reReply.bo", produces="application/json; charset=UTF-8")
	public String ajaxInsertreReply(Reply r) {
		
		int result = bService.insertreReply(r);
		
		JSONObject jObj = new JSONObject();
		jObj.put("result", result);
		
		return jObj.toJSONString();
		
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="editReply.bo", produces="application/json; charset=UTF-8")
	public String ajaxUpdateReply(Reply r) {
		
		int result = bService.updateReply(r);
		
		JSONObject jObj = new JSONObject();
		jObj.put("result", result);
		
		return jObj.toJSONString();
		
	}
	
	// 댓글 삭제 (일단 보류)
	@ResponseBody
	@RequestMapping(value="deleteReply.bo", produces="application/json; charset=UTF-8")
	public String ajaxDeleteReply(int replyNo) {
		
		//System.out.println(replyNo);
		 
		return null;
		
	}
	
	// 게시글 좋아요
	@ResponseBody
	@RequestMapping(value="like.bo", produces="application/json; charset=UTF-8")
	public String ajaxBoardLike(Board b) {
		
		int result = bService.insertBoardLike(b);
		int count = bService.selectBoardLikeCount(b);
		
		JSONObject jObj = new JSONObject();
		jObj.put("result", result);
		jObj.put("count", count);
		
		return jObj.toJSONString();
		
	}
	
	// 게시글 좋아요 해제
	@ResponseBody
	@RequestMapping(value="unlike.bo", produces="application/json; charset=UTF-8")
	public String ajaxBoardUnlike(Board b) {
		
		int result = bService.deleteBoardLike(b);
		int count = bService.selectBoardLikeCount(b);
		
		JSONObject jObj = new JSONObject();
		jObj.put("result", result);
		jObj.put("count", count);
		
		return jObj.toJSONString();
		
	}
	
	// 공지게시판 상세페이지
	@RequestMapping("noticeDetail.bo")
	public String selectNoticeBoard(int boardNo, int cpage, Model model) {
		
		// 조회수 증가
		int result = bService.increaseCount(boardNo);
		
		if(result > 0) {
			
			// 게시글 조회
			Board b = bService.selectBoard(boardNo);
			
			model.addAttribute("cpage", cpage);
			model.addAttribute("b", b);
			return "board/noticeDetail";
			
		}else {
			
			// 에러페이지
			return "common/errorPage";
			
		}
		
	}
	
	// 익명게시판 상세페이지
	@RequestMapping("anonDetail.bo")
	public String selectAnonBoard(int boardNo, int cpage, HttpSession session, Model model) {
		
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		Board bd = new Board();
		bd.setBoardNo(String.valueOf(boardNo));
		bd.setUserNo(userNo);
		
		// 조회수 증가
		int result = bService.increaseCount(boardNo);
		
		if(result > 0) {
			
			// 게시글 조회
			Board b = bService.selectBoard(boardNo);
			int bLike = bService.selectBoardLike(bd);
			
			model.addAttribute("cpage", cpage);
			model.addAttribute("b", b);
			model.addAttribute("bLike", bLike);
			return "board/anonDetail";
			
		}else {
			
			// 에러페이지
			return "common/errorPage";
			
		}
		
	}
	
	// 신고 여부 조회
	@ResponseBody
	@RequestMapping(value="rpCheck.bo", produces="application/json; charset=UTF-8")
	public String ajaxCheckReport(Report rp) {
		
		Report rep = bService.checkReport(rp);
		
		return new Gson().toJson(rep);
		
	}
	
	// 신고
	@ResponseBody
	@RequestMapping(value="report.bo", produces="application/json; charset=UTF-8")
	public String ajaxInsertReport(Report rp) {
		
		int result = bService.insertReport(rp);
		
		JSONObject jObj = new JSONObject();
		jObj.put("result", result);
		
		return jObj.toJSONString();
		
	}
	
	// 신고 관리 페이지
	@RequestMapping("reportForm.bo")
	public String handleReport() {
		
		return "board/adminReport";
		
	}
	
	// 신고 검색
	@ResponseBody
	@RequestMapping(value="rpSearch.bo", produces="application/json; charset=UTF-8")
	public String ajaxSearchReport(String searchRp, String keyword, String rpType, String rpHandle) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("searchRp", searchRp);
		map.put("keyword", keyword);
		map.put("rpType", rpType);
		map.put("rpHandle", rpHandle);
		
		ArrayList<Report> list = bService.searchReport(map);
		
		return new Gson().toJson(list);
		
	}
	
	// 신고 관리
	//@RequestMapping("rpHandle.bo")
}
