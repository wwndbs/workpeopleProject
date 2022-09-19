package com.gd.workpp.board.controller;

import java.io.File;
import java.util.ArrayList;

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
import com.gd.workpp.common.model.vo.Attachment;
import com.gd.workpp.common.model.vo.PageInfo;
import com.gd.workpp.common.template.FileUpload;
import com.gd.workpp.common.template.Pagination;
import com.gd.workpp.member.model.vo.Member;

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

			model.addAttribute("depName", depName);
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

		model.addAttribute("typeNo", no);
		model.addAttribute("boardType", boardType);

		return "board/enrollForm";

	}

	// 게시글 작성
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile file, HttpSession session, Model model) {
		
		// 임시저장을 ajax로 처리해야 하는데 임시저장 여부를 어떤식으로 넘길지 고민
		
		// 임시저장일 경우 updateBoard 메소드를 실행시키는 걸로
		
		Attachment at = new Attachment();
		  
		// 첨부파일이 있을 경우 FileUpload클래스로 파일 변환 후 Board 객체에 담기
		if(!file.getOriginalFilename().equals("")) {
		  
			String saveFilePath = FileUpload.saveFile(file, session,"resources/board_upfiles/");
			  
			at.setOriginName(file.getOriginalFilename()); 
			at.setChangeName(saveFilePath);
			at.setRefType(2);
		  
		}
		  
		int result = bService.insertBoard(b, at);
		  
		if(result > 0) { // 등록 성공
		  
			session.setAttribute("modalMsg", "게시글이 등록되었습니다."); 
			return "redirect:list.bo?no=" + b.getBoardType() + "&dept=" + b.getDepName();
		  
		}else { // 등록 실패
		  
			model.addAttribute("errorMsg", "게시글 등록에 실패했습니다."); 
			return "common/errorPage";
		  
		}

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
		
		if(b.getBoardType() == 2) {
			if(b.getTopExp() == null || !b.getTopExp().equals("Y")) {
				b.setTopExp("N");
			}
		}
		System.out.println("ㅇㅇ");
		Attachment at = new Attachment();
		
		if(b.getBoardNo().equals("")) { // 새로 임시저장
			
			
			// 첨부파일이 있을 경우 FileUpload클래스로 파일 변환 후 Board 객체에 담기
			if(!file.getOriginalFilename().equals("")) {
			  System.out.println("첨부파일 등록");
				String saveFilePath = FileUpload.saveFile(file, session,"resources/board_upfiles/");
				  
				at.setOriginName(file.getOriginalFilename()); 
				at.setChangeName(saveFilePath);
				at.setRefType(2);
			  
			}
			
			int result = bService.saveBoard(b, at);
			String boardNo = bService.selectBoardNo();
			
			System.out.println("result : " + result);
			System.out.println("boardNo : " + boardNo);
			
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
			System.out.println("ㄴㄴ");
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

}
