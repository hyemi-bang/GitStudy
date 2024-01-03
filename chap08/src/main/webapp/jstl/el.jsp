<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="chap08.model.Student, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- prefix="c" 대신 prefix="core"로 하게 되면 c:set -> core:set 이런식으로 작성해야한다 -->
<%
	ArrayList<Student> stus = new ArrayList<>();
	//DB에서 학생 여러행을 조회한 데이터로 가정
	stus.add(new Student("A123", "김자바", 20, 80, 90, 99));
	stus.add(new Student("A124", "박이썬", 20, 70, 80, 99));
	stus.add(new Student("A348", "최씨플", 20, 80, 89, 58));
	stus.add(new Student("A255", "고틀린", 20, 60, 90, 77));
	stus.add(new Student("A611", "김고", 20, 80, 99, 100));
	
	pageContext.setAttribute("stus", stus);
	
	Student stu = new Student();
	//DB에서 학생 한명을 조회해 가져온 데이터로 가정
	stu.setStu_id("STU1234");
	stu.setStu_name("고길동");
	stu.setStu_age(15);
	stu.setStu_kor(100);
	stu.setStu_eng(80);
	stu.setStu_math(70);
	
	pageContext.setAttribute("stu1", stu);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>EL(Expression Language)</title>
</head>
<body>
	<h3># JSP EL(Expression Language)</h3>
	
	<ul>
		<li>JSP에서 어트리뷰트에 실려있는 값들을 간단하게 꺼내 쓸 수 있는 문법</li>
		<li>문법 생김새가 Javascript의 format string과 똑같이 생겨서 JSP 내부에서는 충돌이 발생한다</li>
		<li>어트리뷰트에 객체가 들어있는 경우 해당 객체의 getter를 통해 속성을 꺼내 사용할 수 있다</li>
		<li>여러 영역에 어트리뷰트가 같은 이름으로 등록되어 있는 경우 기본적으로 가장 좁은 범위의 어트리뷰트를 사용한다
		page > request > session > application 순서</li>
	</ul>
	
	<c:set var="food" value="파스타"/>
	<script>
	      const food = '육개장';
	      console.log(`오늘 메뉴는 ${food} 입니다.`); //jsp가 된다 => 파스타가 나옴
	      console.log(`오늘 메뉴는 ${'${food}'} 입니다.`);
	  </script>
	  
	  <h5>#EL로 객체를 호출해 사용하는 경우</h5>
	  
	  <ul>
	  	<li>객체를 그냥 출력하는 경우 해당 객채의 toString() 호출해 사용한다</li>
	  	<li>${stu1}</li>
	  	<li>해당 객체에 .을 찍고 호출하면 실제로 해당 객체의 Getter 메서드를 호출하여 사용한다</li>
	  	<li>Get method가 없다면 호출할 수 없다</li>
	  	<li>stu1.stu_name: ${stu1.stu_name}</li>
	  	<li>stu1.stu_kor: ${stu1.stu_kor}</li>
	  	<li>stu1.stu_eng: ${stu1.stu_eng}</li>
	  	<li>stu1.stu_math: ${stu1.stu_math}</li>
	  	<li>stu1.avg: ${stu1.avg}</li>
	  	
	  </ul>
	  
	  <h5>#반복문과 함께 활용해보기</h5>
	  
	  <table border="1">
	  	<tr>
	  		<th>학번</th>
	  		<th>이름</th>
	  		<th>나이</th>
	  		<th>국어</th>
	  		<th>영어</th>
	  		<th>수학</th>
	  	</tr>
	  <c:forEach items="${stus}" var="student">
	  <tr>
	  	<td>${student.stu_id}</td>
	  	<td>${student.stu_name}</td>
	  	<td>${student.stu_age}</td>
	  	<td>${student.stu_kor}</td>
	  	<td>${student.stu_eng}</td>
	  	<td>${student.stu_math}</td>
	  </tr>
	  </c:forEach>
	  </table>
	  
	  <h5># EL 리터럴</h5>
	  
	  <ul>
	  	<li>정수 :  ${123}, ${10*10}, ${123+456}</li>
	  	<li>실수 : ${123.14234}, ${123.11*5 }</li>
	  	<li>문자열 : ${'Hello!'}, ${"문자열"}, ${"${food}"}</li>
	  	<li>Boolean : ${true}, ${false}</li>
	  </ul>
	  
	  <h5>#EL 연산자</h5>
	  
	  <ul>
	  <c:set var="a" value="80"/>
	  <c:set var="b" value="7"/>
	  <c:set var="f" value="banana"/>
	  <c:set var="h" value="null"/>
	  <%pageContext.setAttribute("j", null); %>
	  
	  	<li>산술 연산자 : +, -, *, /, %, mod(=%)
	  	<div>${a+b}, ${a-b}, ${a*b}, ${a/b}, ${a%b}, ${a mod b}</div>
	  	</li>
	  	<li>비교연산자: ==, !=, eq, ne, lt, gt, le, ge, 부등호들
	  	<div>${a == b}, ${a eq b}, ${a!= b}, ${a ne b}, ${a < b}, ${a lt b}, ${a > b} , ${a gt b},
	  	 ${a >= b}, ${a ge b}, ${a <= b}, ${a le b}, ${a && b}, ${a and b}, ${a || b}, ${a or b}</div>
	  	</li>
	  	<li>논리연산자 : and, or, not, &&, ||, !
	  	<div>${a > b and a % 2 == 0}, ${not (a == 10)}</div>
	  	</li>
	  	<li>empty: 해당 값이 null또는 빈 문자열("")일 때 true가 된다
	  	<div>${empty f}, ${empty g } ,${empty h}, ${empty j}</div>
	  	</li>
	  	<li>삼항연산자 :
	  	<div>필요한 사과바구니 개수 : ${a % 10 eq 0? a / 10 : a / 10 + 1}</div>
	  	</li>
	  	<li>EL로 계산은 어느정도 가능하지만, 포워딩으로 JSP에 오기 전에 모든 계산을 끝내는 편이 좋다</li>
	  </ul>
	  
	  

</body>
</html>