<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="bean.SprojectDAO" %>
<%@ page import="bean.SprojectDTO" %>
<%@ page import="java.util.List" %>
<%@ include file="../include/header.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>


<%		
	/* String my = request.getParameter("my"); */
 
	//현제 페이지 설정, request로 받는 파라미터는 항상 String
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	
	//글 리스트 출력 및 페이지 처리 관련
	List<SprojectDTO> list = null;	//컨텐츠 내용 저장할 list
	
	int pageSize = 6;	//1개 페이지에 보여줄 컨텐츠(글) 갯수	
	int currentPage = Integer.parseInt(pageNum);	//현제 페이지=pageNum, String > Integer 변환
	int start = (currentPage - 1) * pageSize + 1;	//현재 페이지 기준으로 DB에 저장된 내용을 잘라서 들고와야 함
	int end = currentPage * pageSize;
	
	int count = 0;	//총 컨텐츠(글) 갯수
	int pageBlock = 7;	//페이지 버튼의 출력 단위
	int totalPage;	//총 페이지 수
	int startPage;	//페이지 버튼 시작 번호
	int endPage;	//페이지 버튼 끝 번호 
%>

<%	
	//1st.전체 컨텐츠 가져오기
	SprojectDAO dao = new SprojectDAO();
	count = dao.getCount();
	if (count > 0) {
		list = dao.getAllList(start, end);
	}	
%>

<title>프로젝트 찾기</title>

<div class="searchfor-disply">
	<a href="javascript:doDisplay();">검색조건 보기</a>
</div>

<section class="section2">
	<form action="s-project_search.jsp" method="post" class="form-box1" id="checkboard">
		<ul class="searchfor">
			<li>
				<label>경력</label> 
				<select name="career">
					<option value="%">전체</option>
					<option value="new">신입</option>
					<option value="1">1년차</option>
					<option value="2">2년차</option>
					<option value="3">3년차</option>
					<option value="4">4년차</option>
					<option value="5">5년차</option>
					<option value="6">6년차</option>
					<option value="7">7년차이상</option>
				</select>
			</li>

			<li>
				<label>분야</label> 
				<select name="field">
					<option value="%">전체</option>
					<option value="dev">개발</option>
					<option value="plan">기획</option>
					<option value="design">디자인</option>
				</select>
			</li>


			<li>
				<label>업무 방식</label> 
				<select name="worktype">
					<option value="%">전체</option>
					<option value="online">원격</option>
					<option value="office">상주</option>
					<option value="discuss">협의</option>
				</select>
			</li>

			<li>
				<label>지역</label> 
				<select name="location">
					<option value="%">원격</option>
					<option value="seoul">서울</option>
					<option value="gyunggi">경기</option>
					<option value="incheon">인천</option>
					<option value="gangwon">강원</option>
					<option value="chungbuk">충북</option>
					<option value="chungnam">충남</option>
					<option value="daejeon">대전</option>
					<option value="sejong">세종</option>
					<option value="jeonbuk">전북</option>
					<option value="jeonnam">전남</option>
					<option value="gwangju">광주</option>
					<option value="gyungbuk">경북</option>
					<option value="gyungnam">경남</option>
					<option value="daegu">대구</option>
					<option value="ulsan">울산</option>
					<option value="busan">부산</option>
					<option value="jeju">제주</option>
				</select>
			</li>

			<li>
				<label>활동 유형</label> 
				<select name="employtype">
						<option value="%">전체</option>
						<option value="sfree">개인 프리랜서</option>
						<option value="tfree">팀 프리랜서드</option>
						<option value="sbusiness">개인 사업자</option>
						<option value="cbusiness">법인 사업자</option>
				</select>
			</li>

			<li>
				<label>프로젝트 유형</label> 
				<select name="projecttype">
						<option value="%">전체</option>
						<option value="side">사이드 프로젝트</option>
						<option value="main">메인 프로젝트</option>
				</select>
			</li>

			<li>
				<label>구인활동 여부</label> 
				<select name="available">
						<option value="1">on</option>
						<option value="0">off</option>
				</select>
			</li>

			<li>
				<label>예상 기간</label> 
				<select name="periond">
						<option value="%">전체</option>
						<option value="7">7일</option>
						<option value="30">30일</option>
						<option value="90">90일</option>
						<option value="180">180일</option>
						<option value="365">1년</option>
						<option value="2">2년이상</option>
				</select>
			</li>

			<li>
				<label>예상 급여</label> 
				<select name="pay">
					<option value="%">전체</option>
					<option value="100">100만원</option>
					<option value="200">200만원</option>
					<option value="300">300만원</option>
					<option value="400">400만원</option>
					<option value="500">500만원</option>
					<option value="600">600만원</option>
					<option value="700">700만원</option>
					<option value="800">800만원</option>
					<option value="900">900만원</option>
					<option value="1000">1000만원</option>
					<option value="2000">2000만원</option>
					<option value="3000">3000만원</option>
					<option value="4000">4000만원</option>
					<option value="5000">5000만원</option>
					<option value="10000">10000만원이상</option>
				</select>
			</li>
		</ul>
		<div class="wrapper-submit2">
			<input type="submit" value="검색" />
		</div>
	</form>
</section>

<section class="section5">
<%	//2nd. 컨텐츠(글) 리스트 출력
	if (list == null) {		//작성된 글이 없을때, count
%>	<h1>작성된 글이 없습니다.</h1>
<%	}
	
	if (list != null) {
		for (SprojectDTO dto : list) {
	}	
%>
	<ul>
		<li class="mboard">
			<tr>
				<th><a
					href="s-project_detail.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>"><%=dto.getSubject()%></a></th>
				<th>
					<%
					if (dto.getAvailable() == 1) {
					%> <img src="image/switch-on.png"
					width="40px" height="36px"> <%
 } else {
 %> <img
					src="image/switch-off.png" width="40px" height="36px"> <%
 }
 %>
				</th>
				<th><%=dto.getField()%></th>
				<td><img src="image/view.png" width="20px" height="20px" /><%=dto.getReadcount()%>
					<img src="image/thumbs.png" width="20px" height="20px" /><%=dto.getGood()%>
				</td>
			</tr>
			<tr>
				<th><%=dto.getCareer()%></th>
				<th><%=dto.getEmploytype()%></th>
				<th><%=dto.getLocation()%></th>
				<th><%=dto.getWorktype()%></th>
				<th><%=dto.getPay()%></th>
				<th><%=dto.getPeriod()%></th>
			</tr>
			<tr>
				<td colspan="4"><%=dto.getIntroduce()%></td>
			</tr>
		</table>
		<br />
	</div>

	<%
	}
	}
	}
	%>
</section>

<section class="section4">
<%	
	
	if (count > 0) {
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage / 10) * 10 + 1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		if (startPage > 10) {
	%>
	<a href="s-member.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
	<%
	}

	for (int i = startPage; i <= endPage; i++) {
	%>
	<a href="s-member.jsp?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
	}

	if (endPage < pageCount) {
	%>
	<a href="s-member.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
	<%
	}

	}
	%>
</section>

<footer>
	<hr color="skyblue" size="2" align="center" />
	<table width="500" align="right">

		<thead align="center">
			<tr>
				<th></th>
				<th>메인</th>
				<th>회원</th>
				<th>고객센터</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>사이트소개</td>
				<td><a href="/goworker/s-member/s-member.jsp">팀원찾기</a></td>
				<td>회원가입</td>
				<td>공지사항</td>

			</tr>
			<tr>
				<td>이용방법</td>
				<td>프로젝트찾기</td>
				<td>회원정보수정</td>
				<td>Q&A</td>
			</tr>
			<tr>
				<td></td>
				<td>프로젝트만들기</td>
				<td>회원탈퇴</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>취업정보</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>커뮤니티</td>
				<td></td>
				<td></td>
			</tr>
		</tbody>

	</table>
</footer>

<script type="text/javascript">
	var bDisplay = true;

	function doDisplay() {
		var con = document.getElementById("checkboard");
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}

	function viewMine() {
		value = document.getElementsByName("id")[0].value;
		open('s-project_detail.jsp?id=' + value, 'confirm',
				'width=500,height=500');
	}
</script>

