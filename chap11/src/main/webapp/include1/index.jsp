<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--  �������κ��� request.despatcher�� �ϴ°Ŷ�
jsp:include�� forwardó�� webapp ���� ��θ� ������� �Ѵ�--%>
<jsp:include page="./top.jsp"/>

	<h1>Index.jsp</h1> 

	<p>
		Lorem ipsum dolor sit amet, consectetur adipisicing elit.<br>
		Ducimus totam harum odit unde odio soluta non consequatur omnis neque<br>
		perspiciatis distinctio eligendi architecto recusandae quia ipsum<br>
		veniam nihil hic inventore.
	</p>
	
	<p>�ڹٽ�ũ��Ʈ�� Ŭ���̾�Ʈ���� �۵��ϴ� ����̱⶧���� 3������ ������ ���� �ʴ´�.</p>
	<p>����� �ϳ��� ���������� �ٸ� ���������� �ϼ��� ����� �������� ���̱� ������ <br>
	�� jsp�������� �ϼ��ϱ� ���� ���� �� �������� ���� �����ؾ� �Ѵ�(ex: jstl, page...)</p>
	
	<c:forEach begin="0" end="9" var="i">
		<p>paragraph${i}</p>
	</c:forEach>

	<jsp:include page="./bottom.jsp"/>