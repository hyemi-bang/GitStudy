<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="chap08.model.Student, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- prefix="c" ��� prefix="core"�� �ϰ� �Ǹ� c:set -> core:set �̷������� �ۼ��ؾ��Ѵ� -->
<%
	ArrayList<Student> stus = new ArrayList<>();
	//DB���� �л� �������� ��ȸ�� �����ͷ� ����
	stus.add(new Student("A123", "���ڹ�", 20, 80, 90, 99));
	stus.add(new Student("A124", "���̽�", 20, 70, 80, 99));
	stus.add(new Student("A348", "�־���", 20, 80, 89, 58));
	stus.add(new Student("A255", "��Ʋ��", 20, 60, 90, 77));
	stus.add(new Student("A611", "���", 20, 80, 99, 100));
	
	pageContext.setAttribute("stus", stus);
	
	Student stu = new Student();
	//DB���� �л� �Ѹ��� ��ȸ�� ������ �����ͷ� ����
	stu.setStu_id("STU1234");
	stu.setStu_name("��浿");
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
		<li>JSP���� ��Ʈ����Ʈ�� �Ƿ��ִ� ������ �����ϰ� ���� �� �� �ִ� ����</li>
		<li>���� ������� Javascript�� format string�� �Ȱ��� ���ܼ� JSP ���ο����� �浹�� �߻��Ѵ�</li>
		<li>��Ʈ����Ʈ�� ��ü�� ����ִ� ��� �ش� ��ü�� getter�� ���� �Ӽ��� ���� ����� �� �ִ�</li>
		<li>���� ������ ��Ʈ����Ʈ�� ���� �̸����� ��ϵǾ� �ִ� ��� �⺻������ ���� ���� ������ ��Ʈ����Ʈ�� ����Ѵ�
		page > request > session > application ����</li>
	</ul>
	
	<c:set var="food" value="�Ľ�Ÿ"/>
	<script>
	      const food = '������';
	      console.log(`���� �޴��� ${food} �Դϴ�.`); //jsp�� �ȴ� => �Ľ�Ÿ�� ����
	      console.log(`���� �޴��� ${'${food}'} �Դϴ�.`);
	  </script>
	  
	  <h5>#EL�� ��ü�� ȣ���� ����ϴ� ���</h5>
	  
	  <ul>
	  	<li>��ü�� �׳� ����ϴ� ��� �ش� ��ä�� toString() ȣ���� ����Ѵ�</li>
	  	<li>${stu1}</li>
	  	<li>�ش� ��ü�� .�� ��� ȣ���ϸ� ������ �ش� ��ü�� Getter �޼��带 ȣ���Ͽ� ����Ѵ�</li>
	  	<li>Get method�� ���ٸ� ȣ���� �� ����</li>
	  	<li>stu1.stu_name: ${stu1.stu_name}</li>
	  	<li>stu1.stu_kor: ${stu1.stu_kor}</li>
	  	<li>stu1.stu_eng: ${stu1.stu_eng}</li>
	  	<li>stu1.stu_math: ${stu1.stu_math}</li>
	  	<li>stu1.avg: ${stu1.avg}</li>
	  	
	  </ul>
	  
	  <h5>#�ݺ����� �Բ� Ȱ���غ���</h5>
	  
	  <table border="1">
	  	<tr>
	  		<th>�й�</th>
	  		<th>�̸�</th>
	  		<th>����</th>
	  		<th>����</th>
	  		<th>����</th>
	  		<th>����</th>
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
	  
	  <h5># EL ���ͷ�</h5>
	  
	  <ul>
	  	<li>���� :  ${123}, ${10*10}, ${123+456}</li>
	  	<li>�Ǽ� : ${123.14234}, ${123.11*5 }</li>
	  	<li>���ڿ� : ${'Hello!'}, ${"���ڿ�"}, ${"${food}"}</li>
	  	<li>Boolean : ${true}, ${false}</li>
	  </ul>
	  
	  <h5>#EL ������</h5>
	  
	  <ul>
	  <c:set var="a" value="80"/>
	  <c:set var="b" value="7"/>
	  <c:set var="f" value="banana"/>
	  <c:set var="h" value="null"/>
	  <%pageContext.setAttribute("j", null); %>
	  
	  	<li>��� ������ : +, -, *, /, %, mod(=%)
	  	<div>${a+b}, ${a-b}, ${a*b}, ${a/b}, ${a%b}, ${a mod b}</div>
	  	</li>
	  	<li>�񱳿�����: ==, !=, eq, ne, lt, gt, le, ge, �ε�ȣ��
	  	<div>${a == b}, ${a eq b}, ${a!= b}, ${a ne b}, ${a < b}, ${a lt b}, ${a > b} , ${a gt b},
	  	 ${a >= b}, ${a ge b}, ${a <= b}, ${a le b}, ${a && b}, ${a and b}, ${a || b}, ${a or b}</div>
	  	</li>
	  	<li>�������� : and, or, not, &&, ||, !
	  	<div>${a > b and a % 2 == 0}, ${not (a == 10)}</div>
	  	</li>
	  	<li>empty: �ش� ���� null�Ǵ� �� ���ڿ�("")�� �� true�� �ȴ�
	  	<div>${empty f}, ${empty g } ,${empty h}, ${empty j}</div>
	  	</li>
	  	<li>���׿����� :
	  	<div>�ʿ��� ����ٱ��� ���� : ${a % 10 eq 0? a / 10 : a / 10 + 1}</div>
	  	</li>
	  	<li>EL�� ����� ������� ����������, ���������� JSP�� ���� ���� ��� ����� ������ ���� ����</li>
	  </ul>
	  
	  

</body>
</html>