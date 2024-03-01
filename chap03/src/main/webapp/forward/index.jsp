<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3># Forward</h3>

	<ul>
		<li>사용자가 보낸 요청을 한 서블릿에서 일부 처리하고 다음 서블릿으로 넘겨 처리하는것</li>
		<li>요청, 응답 객체를 그대로 다음 서블릿으로 전달하기 때문에 해당 요청에 실려있던 파라미터들도 그대로 함께
			전달된다</li>
	</ul>
	
	<h3># Forward의 용도</h3>
	
	<ul>
		<li>서블릿에서는 자바 코드를 만들기 편하고, .jsp파일에서는 HTML코드 작성이 편하다</li>
		<li>하나의 요청에 대해 서블릿에서 
			1차로 자바에 관련된 모든 처리를 마친 후 포워드를 통해 
			2차로 .jsp페이지로 넘겨 HTML 코드에 관한 처리를 마치는 방식을 주로 사용한다</li>
		<li>이것을 view(JSP)와 controller(dispatcher + service로 합쳐진 느낌 / JAVA)의 분리라고 한다</li>
		<li>포워드를 사용하면 실제 view 페이지의 위치가 노출되지 않는다 (어떤 과정을 거쳐서 이 페이지가 만들어졌는지를 클라이언트는 모른다)</li>
		<li></li>
	</ul>
	

	<h3># forward test1</h3>

	<form action="/chap03/forward/test/1" method="GET">
		<input type="hidden" name="firstName" value="Smith" /> <input
			type="hidden" name="lastName" value="king" /> <input type="submit"
			value="보내기" />
	</form>

	<h3># forward test2</h3>

	<p>JSP도 servlet이기 때문에 form으로 요청 보내는 것이 가능하다</p>

	<form action="/chap03/forward/forwardTestJsp.jsp" method="GET">
		<input type="hidden" name="firstName" value="Smith" /> <input
			type="hidden" name="lastName" value="king" /> <input type="submit"
			value="보내기" />
	</form>

	<h3># Redirect</h3>

	<ul>
		<li>요청을 받으면 해당 요청을 보낸 클라이언트에게 다른 주소로 다시 요청 보내라고 응답하는것</li>
		<li>리다이렉트는 새로운 요청을 다시 보내는 것이기 때문에 이전 요청에 보냈던 파라미터는 기본적으로 남아있을 수
			없다</li>
		<li>처음 요청보냈던 주소가 그대로 유지 되지 않는다</li>
	</ul>

	<h3># redirect test1</h3>

	<form action="/chap03/forward/test/2" method="GET">
		<input type="hidden" name="firstName" value="Smith" /> 
		<input type="hidden" name="lastName" value="king" />
		<input type="submit"value="보내기" />
	</form>


</body>
</html>