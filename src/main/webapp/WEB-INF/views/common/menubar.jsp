<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="adminx-sidebar expand-hover push">
		<ul class="sidebar-nav">
			<li class="sidebar-nav-item">
				<a href="index.html" class="sidebar-nav-link active">
					<span class="sidebar-nav-icon"><i class="fas fa-home"></i></span>
					<span class="sidebar-nav-name"> 대시보드 </span> <span class="sidebar-nav-end"></span>
				</a>
			</li>
			<!--인사관리-->
			<li class="sidebar-nav-item">
				<a class="sidebar-nav-link collapsed" data-toggle="collapse" href="#example" aria-expanded="false" aria-controls="example">
					<span class="sidebar-nav-icon"> <i class="fas fa-user"></i></span>
					<span class="sidebar-nav-name"> 인사관리 </span>
					<span class="sidebar-nav-end"> <i data-feather="chevron-right" class="nav-collapse-icon"></i></span>
				</a>

				<ul class="sidebar-sub-nav collapse" id="example">
					<li class="sidebar-nav-item">
						<a href="./layouts/charts_chartjs.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Mo </span> <span class="sidebar-nav-name"> 개인정보수정 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="./layouts/charts_morris.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Ac </span> <span class="sidebar-nav-name"> 사원승인 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="./layouts/charts_morris.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Mo </span> <span class="sidebar-nav-name"> 사원정보수정 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="./layouts/charts_morris.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> De </span> <span class="sidebar-nav-name"> 사원삭제 </span>
						</a>
					</li>
				</ul>
			</li>
			<!--근태관리-->
			<li class="sidebar-nav-item">
				<a class="sidebar-nav-link collapsed" data-toggle="collapse" href="#navTables" aria-expanded="false" aria-controls="navTables">
					<span class="sidebar-nav-icon"> <i class="fas fa-user-friends"></i></span>
					<span class="sidebar-nav-name"> 근태관리 </span>
					<span class="sidebar-nav-end"> <i data-feather="chevron-right" class="nav-collapse-icon"></i></span>
				</a>

				<ul class="sidebar-sub-nav collapse" id="navTables">
					<li class="sidebar-nav-item">
						<a href="commute.at" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Vi </span> <span class="sidebar-nav-name"> 출퇴근 기록 </span>
						</a>
					</li>
					<li class="sidebar-nav-item">
						<a href="attendance.at" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Vi </span> <span class="sidebar-nav-name"> 개인 근태현황 조회 </span>
						</a>
					</li>
					<li class="sidebar-nav-item">
						<a href="holiday.at" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Vi </span> <span class="sidebar-nav-name"> 휴가관리 </span>
						</a>
					</li>
					<li class="sidebar-nav-item">
						<a href="work.at" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Vi </span> <span class="sidebar-nav-name"> 연장근무 내역조회 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="commuteMember.at" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Vi </span> <span class="sidebar-nav-name"> 사원별 출퇴근 현황 조회 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="attendanceMember.at" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Vi </span> <span class="sidebar-nav-name"> 사원별 근태 현황 조회 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="atHolidayGive.at" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Ac </span> <span class="sidebar-nav-name"> 사원 휴가관리 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="holidayMemberList.at" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Vi </span> <span class="sidebar-nav-name"> 사원 휴가내역 조회 </span>
						</a>
					</li>
				</ul>
			</li>
			<!--전자결재-->
			<li class="sidebar-nav-item">
				<a class="sidebar-nav-link collapsed" data-toggle="collapse" href="#navForms" aria-expanded="false" aria-controls="navForms">
					<span class="sidebar-nav-icon"> <i class="fas fa-edit"></i></span>
					<span class="sidebar-nav-name"> 전자결재 </span>
					<span class="sidebar-nav-end"> <i data-feather="chevron-right" class="nav-collapse-icon"></i></span>
				</a>

				<ul class="sidebar-sub-nav collapse" id="navForms">
					<li class="sidebar-nav-item">
						<a href="documentList.ap" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Wr </span> <span class="sidebar-nav-name"> 결재작성 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="approvalList.ap" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Vi </span> <span class="sidebar-nav-name"> 결재조회 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="referenceList.ap" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Re </span> <span class="sidebar-nav-name"> 참조문서 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="saveList.ap" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Sa </span> <span class="sidebar-nav-name"> 임시저장 문서 </span>
						</a>
					</li>
				</ul>
			</li>
			<!--메일-->
			<li class="sidebar-nav-item">
				<a class="sidebar-nav-link collapsed" href="inbox.ma" aria-expanded="false" aria-controls="navUI">
					<span class="sidebar-nav-icon"> <i class="fas fa-envelope"></i></span>
					<span class="sidebar-nav-name"> 메일 </span>
					<span class="sidebar-nav-end"> <i data-feather="chevron-right" class="nav-collapse-icon"></i></span>
				</a>
			</li>
			<!--쪽지-->
			<li class="sidebar-nav-item">
				<a class="sidebar-nav-link collapsed" data-toggle="collapse" href="#navExtra" aria-expanded="false" aria-controls="navExtra">
					<span class="sidebar-nav-icon"> <i class="fas fa-sticky-note"></i></span>
					<span class="sidebar-nav-name"> 쪽지 </span>
					<span class="sidebar-nav-end"> <i data-feather="chevron-right" class="nav-collapse-icon"></i></span>
				</a>

				<ul class="sidebar-sub-nav collapse" id="navExtra">
					<li class="sidebar-nav-item">
						<a href="./layouts/login.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Lo </span> <span class="sidebar-nav-name"> 받은쪽지함 </span>
						</a>
					</li>
					<li class="sidebar-nav-item">
						<a href="./layouts/login.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Lo </span> <span class="sidebar-nav-name"> 보낸쪽지함 </span>
						</a>
					</li>
					<li class="sidebar-nav-item">
						<a href="./layouts/login.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Lo </span> <span class="sidebar-nav-name"> 쪽지보관함 </span>
						</a>
					</li>
				</ul>
			</li>
			<!--조직도/주소록-->
			<li class="sidebar-nav-item">
				<a class="sidebar-nav-link collapsed" data-toggle="collapse" href="#navExtra2" aria-expanded="false" aria-controls="navExtra">
					<span class="sidebar-nav-icon"> <i class="fas fa-users"></i></span>
					<span class="sidebar-nav-name"> 조직도/주소록 </span>
					<span class="sidebar-nav-end"> <i data-feather="chevron-right" class="nav-collapse-icon"></i></span>
				</a>

				<ul class="sidebar-sub-nav collapse" id="navExtra2">
					<li class="sidebar-nav-item">
						<a href="./layouts/login.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Vi </span> <span class="sidebar-nav-name"> 조직도 조회 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="./layouts/signup.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Vi </span> <span class="sidebar-nav-name"> 주소록 조회 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="./layouts/404.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Ad </span> <span class="sidebar-nav-name"> 조직도 등록 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="./layouts/500.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Mo </span> <span class="sidebar-nav-name"> 조직도 수정 및 삭제 </span>
						</a>
					</li>
				</ul>
			</li>
			<!--일정관리-->
			<li class="sidebar-nav-item">
				<a class="sidebar-nav-link collapsed" data-toggle="collapse" href="#navExtra3" aria-expanded="false" aria-controls="navExtra">
					<span class="sidebar-nav-icon"> <i class="fas fa-calendar-check"></i></span>
					<span class="sidebar-nav-name"> 일정관리 </span>
					<span class="sidebar-nav-end"> <i data-feather="chevron-right" class="nav-collapse-icon"></i></span>
				</a>

				<ul class="sidebar-sub-nav collapse" id="navExtra3">
					<li class="sidebar-nav-item">
						<a href="schedulePersonal.sc" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Ad </span> <span class="sidebar-nav-name"> 개인 일정 관리 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="./layouts/signup.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Vi </span> <span class="sidebar-nav-name"> 회사 일정 조회 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="./layouts/login.html" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Ad </span> <span class="sidebar-nav-name"> 회사 일정 관리 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="todoList.td" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Ad </span> <span class="sidebar-nav-name"> To-Do </span>
						</a>
					</li>
				</ul>
			</li>
			<!--프로젝트관리-->
			<li class="sidebar-nav-item">
				<a class="sidebar-nav-link collapsed" data-toggle="collapse" href="#navExtra4" aria-expanded="false" aria-controls="navExtra">
					<span class="sidebar-nav-icon"> <i class="fas fa-tasks"></i></span>
					<span class="sidebar-nav-name"> 프로젝트관리 </span>
					<span class="sidebar-nav-end"> <i data-feather="chevron-right" class="nav-collapse-icon"></i></span>
				</a>

				<ul class="sidebar-sub-nav collapse" id="navExtra4">
					<li class="sidebar-nav-item">
						<a href="myProject.pr" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Mo </span> <span class="sidebar-nav-name"> 내 프로젝트 조회 </span>
						</a>
					</li>
					<li class="sidebar-nav-item">
						<a href="totalList.pr" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Mo </span> <span class="sidebar-nav-name"> 전체 프로젝트 조회 </span>
						</a>
					</li>
				</ul>
			</li>
			<!--게시판-->
			<li class="sidebar-nav-item">
				<a class="sidebar-nav-link collapsed" href="nlist.bo" aria-expanded="false" aria-controls="navExtra">
					<span class="sidebar-nav-icon"> <i class="fas fa-chalkboard"></i></span>
					<span class="sidebar-nav-name"> 게시판 </span>
					<span class="sidebar-nav-end"> <i data-feather="chevron-right" class="nav-collapse-icon"></i></span>
				</a>
			</li>

			<!--설문조사-->
			<li class="sidebar-nav-item">
				<a class="sidebar-nav-link collapsed" data-toggle="collapse" href="#navExtra6" aria-expanded="false" aria-controls="navExtra">
					<span class="sidebar-nav-icon"> <i class="fas fa-poll-h"></i></span>
					<span class="sidebar-nav-name"> 설문조사 </span>
					<span class="sidebar-nav-end"> <i data-feather="chevron-right" class="nav-collapse-icon"></i></span>
				</a>

				<ul class="sidebar-sub-nav collapse" id="navExtra6">
					<li class="sidebar-nav-item">
						<a href="enrollForm.su" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Mo </span> <span class="sidebar-nav-name"> 설문조사 등록 </span>
						</a>
					</li>
					<li class="sidebar-nav-item">
						<a href="list.su" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Mo </span> <span class="sidebar-nav-name"> 진행중인 설문 </span>
						</a>
					</li>

					<li class="sidebar-nav-item">
						<a href="endList.su" class="sidebar-nav-link">
							<span class="sidebar-nav-abbr"> Mo </span> <span class="sidebar-nav-name"> 마감된 설문 </span>
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	
</body>
</html>