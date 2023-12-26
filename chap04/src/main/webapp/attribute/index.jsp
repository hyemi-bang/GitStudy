<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Attribute</title>
</head>
<body>

	<h3># Attribute</h3>

	<ul>
		<li>파라미터와 비슷하지만 다른 개념</li>
		<li>Parameter: 클라이언트의 form에서 서버측의 서블릿으로 보내는 데이터</li>
		<li>Attribute: 하나의 서블릿에서 다른 서블릿으로 전달할 수 있는 데이터(애초에 포워드를 염두에해두고
			만들어진 데이터)</li>
		<li>Attribute 들은 종류별로 유효한 범위(scope)가 존재하며 용도에 맞게 활용해야 한다</li>
		<li>종류로는 application, session, request, page가 있다</li>
	</ul>

	<h3># Attribute Scope</h3>
	<dl>
		<dt>1. application scope</dt>
		<dd>WAS(Web Application Server)에 저장해 놓는 어트리뷰트. 
			서버가 종료되기 전까지 계속	유지된다. 
			모든 서블릿에 접근할 수 있다. (전역 static 변수 같은 느낌이라, 한 곳에서 수정하면 다 수정된다)
		</dd>
		<dt>2. session scope</dt>
		<dd>하나의 세션이 만료되기 전까지 유지되는 어트리뷰트. 
			각 클라이언트마다 각자의 세션을 가지고 있다. (서버에서 제공해주는 개인 보관함)
		</dd>
		<dt>3. request scope</dt>
		<dd>하나의 요청이 만료되기 전(요청에 대한 응답을 하기 전)까지 유지되는 어트리뷰트. (매개 변수 느낌)
			 -> 즉 서버에서 리스폰스를 보낸 순간 요청이 만료된 것 
			 -> 하나의 요청은 포워드를 다닐때는 유지되고, 응답을 하게될 때 만료되는 것 
			 redirect 는 유지되지 않음/ forward, include 진행 되는 동안 유지되기 때문에 다음 처리로 데이터 전달하는 용도로 많이 쓰임
		</dd>
		<dt>4. page scope</dt>
		<dd>해당 JSP 페이지 내부에서만 사용할 수 있는 어트리뷰트. 
			forward, include로 다른 페이지로 넘어가는 경우 사라진다.(지역 변수 느낌)
		</dd>
	</dl>

	<h3># 각 어트리뷰트 출력해보기</h3>

	<ul>
		<li>application : <%=application.getAttribute("food")%></li>
		<li>session : <%=session.getAttribute("food")%></li>
		<li>request : <%=request.getAttribute("food")%></li>
		<li>page : <%=pageContext.getAttribute("food")%></li>
	</ul>

	<input id="applicationInput" type="text" value="orange" name="food" />
	<button id="applicationBtn">application 데이터 추가하기</button>
	<br>
	<input id="sessionInput" type="text" value="orange" name="food" />
	<button id="sessionBtn">session 데이터 추가하기</button>
	<br>
	<input id="requestInput" type="text" value="orange" name="food" />
	<button id="requestBtn">request 데이터 추가하기</button>
	<br>
	<input id="pageInput"  type="text" value="orange" name="food" />
	<button id="pageBtn"> page 데이터 추가하기</button>
	<br>
	
	<div>
		<a href="/chap04/session/index.jsp">세션정보 보러가기</a>
	</div>
	
	<script>
		const applicationBtn = document.getElementById("applicationBtn");
		const applicationInput = document.getElementById("applicationInput");
		
		applicationBtn.addEventListener('click', (e) => {
			<%-- <%application.setAttribute("food", "banana");%> 
			실행되는 순서 및 위치가 다르기때문에 자바스크립트 단에 자바 코드를 넣으면 안된다.--%>
			
			location.href = '/chap04/attribute/add.jsp?food='
					+ applicationInput.value+ '&scope=application';
		})
		
		const sessionBtn = document.getElementById("sessionBtn");
		const seesionInput = document.getElementById("sessionInput");
		
		sessionBtn.addEventListener('click', (e)=> {
			location.href = '/chap04/attribute/add.jsp?food='
				+ sessionInput.value+ '&scope=session';
		})
		
		const requestBtn = document.getElementById("requestBtn");
		const requestInput = document.getElementById("requestInput");
		
		requestBtn.addEventListener('click', (e)=> {
			location.href = '/chap04/attribute/add.jsp?food='
				+ requestInput.value+ '&scope=request';
		})
		
		const pageBtn = document.getElementById("pageBtn");
		const pageInput = document.getElementById("pageInput");
		
		pageBtn.addEventListener('click', (e)=> {
			location.href = '/chap04/attribute/add.jsp?food='
				+ pageInput.value+ '&scope=pageContext';
		})
	</script>
	
</body>
</html>