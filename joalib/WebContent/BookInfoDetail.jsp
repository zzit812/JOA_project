
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.joalib.DTO.BookInfoDTO"%>
<%@page import="com.joalib.DAO.BookInfoDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page import="java.util.List"%>
<%@ page import="com.joalib.board.action.dbAction"%>
<%@ page import="com.joalib.DAO.DAO"%>
<%@ page import="com.joalib.DTO.BoardDTO"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<link rel="stylesheet" type="text/css" href="css/BookInfoDetail.css">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>





<body>
	<header>
		<div id="top_size">
			<!--로고-->
			<img id="logo" src="img/Logo_1.png">
			<!--탑네비-->
			<nav>
				<ul id="top_nav">
					<li><a href='index.jsp'>HOME</a></li> |
					<li>
						<%
						String member_id = null;
									member_id = (String)session.getAttribute("member_id");
									if ( member_id != null) {
										out.print("<a href='memberLogout.mem'>로그아웃</a>");
									}else{
										out.print("<a href='userJoinRule.html'>회원가입</a></li> | <li><a href='userLogin.html'>로그인</a>");
									}
					%>
					</li> |
					<li><a>포인트충전</a></li>
				</ul>
			</nav>
			<div class="clearF"></div>
			<!--탑메뉴-->
			<nav id="topMenuBorder">
				<ul id="top_menu">
				<li><div class="menuHoverEvent"></div>
					<a href="book_search.jsp">자료검색</a>
					<ul class="sub_menu">
						<li><a href="book_search.jsp">도서 검색</a></li>
					</ul></li>

				<li><div class="menuHoverEvent"></div>
					<a href="#">도서마당</a>
					<ul>
						<li><a href="">신착 도서</a></li>
						<li><a href="">베스트 셀러</a></li>
						<li><a href="">희망도서</a></li>
					</ul></li>

				<li><div class="menuHoverEvent"></div>
					<a href="#">이용안내</a>
					<ul>
						<li><a href="place.jsp">오시는 길</a></li>
							<li><a href="book_guide.jsp">도서 이용안내</a></li>
					</ul></li>

				<li><div class="menuHoverEvent"></div>
					<a href="board.jsp">커뮤니티</a>
					<ul>
						<li><a href="">공지사항</a></li>
						<li><a href="board.jsp">자유게시판</a></li>
						<li><a href="Fault_list.jsp">불량도서 신고</a></li>
						<li><a href="Donate_list.jsp">중고도서 나눔</a></li>
					</ul></li>

				<li><div class="menuHoverEvent"></div>
					<a href="mypage_main.jsp">나의서재</a>
					<ul>
						<li><a href="mypage_main.jsp">나의 서재</a></li>
						<li><a href="mypage_myPost.jsp">내가 쓴 글</a></li>
						<li><a href="mypage_memberinfoChange.jsp">정보 수정/ 탈퇴</a></li>
					</ul></li>
			</ul>
		<div id="window_menu"></div>
		<script src="js/lib_top.js"></script></nav>
	</header>


	<%
	 	JSONArray parse_listArr = (JSONArray)request.getAttribute("searchBook");
		JSONObject books = null;
		
			for(int i=0; i< 1 ; i++){
				books = (JSONObject)parse_listArr.get(i);
				String title= (String)books.get("title");
				String author = (String)books.get("author");
				String publisher = (String)books.get("publisher");
				String book_img = (String)books.get("coverLargeUrl");
				String isbn = (String)books.get("isbn");
				String pubDate = (String)books.get("pubDate");
				String categoryId = (String)books.get("categoryId");
				String description = (String)books.get("description");
		  %>


	<section>
		<div id="book_box">
			<div id="img_box">
				<span id="category"> </span> <img id="book_img" src="<%=book_img %>">
				<div id="button">

					<!-- 이곳에 원래 대출하기 관심도서 가 있음 -->
					대출가능한 도서가 아닙니다.

				</div>
			</div>
			<div id="detail_box">

				<div id="detail">
					<h3><%=title %></h3>
					<div>
						<b>저자사항</b>
						<%=author%></div>
					<div>
						<b>출판사</b>
						<%=publisher %>
					</div>
					<div>
						<b>출판년도</b>
						<%=pubDate %>
					</div>
					<div>
						<b>표준번호</b> ISBN:
						<%=isbn %>
					</div>
					<div>
						<b>상세정보</b>
					</div>
					<div>
						<%=description %>
					</div>
					<%} %>

				</div>
			</div>
	</section>


	<footer>
		<div id="footer_size">
			(변경해야함) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1<br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	</footer>





	</main>
</body>
</html>
