<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--taglib : ������ �±׸� ����� ���  -->
<!--prefix="c" : JSTL core  -->
<!--uri : �±� ���̺귯���� ���� �����̽� URI �ĺ��� -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL</title>
</head>
<body>

	<h3>#JSTL (JSP Standard Tag Library)</h3>
	<ul>
		<li>JSP���� �ڹ� �ڵ带 ����� �� �ڵ尡 �ʹ� ������������ ������ Ŀ���� �±� ���̺귯��</li>
		<li>�� �ʿ��� ���� ���̴� �ڹ� �������� HTML �±׿� ������ �������� ����� �� �ִ� ����� �����Ѵ�</li>
		<li>�ڹ��� ��� ����� ����� �� �ִ°� �ƴ�����, �� �������� ����⿡�� ����� ��ɵ��� �±��������� �����Ǿ��ִ�</li>
		<li>Maven Repository���� �ٿ�ε� ����</li>
		<li>taglib �������� �߰��� �� ����ؾ��Ѵ�</li>
	</ul>
	
	<h3>#JSTL core</h3>
	
	<dl>
		<dt><b>c:set</b></dt>
		<dd>�� ������ setAttribute�� ���ϰ� �����Ͽ� ����� �� �ִ� �±�</dd>
		<dd>�� �±׷� ������ ������ JSP�� ���� ������ �ƴ϶� <br>
		���� ������(JspContext, ServletRequest, HttpSession, ServletContext)�� ����ȴ�.</dd>
		<dd>scope�� �⺻���� page. scope�� �����ϸ� JspContext�� ����ȴ�.</dd>
		<dd>&lg;c:set&gt;���� �̹� �����ϴ� ������ ���� �Ҵ��� ��� ���� ���� �����.</dd>
	</dl>
	
	<%
		// �� ������ ��Ʈ����Ʈ �߰��غ���
		application.setAttribute("fruit", "���");
		session.setAttribute("fruit", "��");
		request.setAttribute("fruit", "�ٳ���");
		pageContext.setAttribute("fruit", "����"); /* �������Ҷ� ������� ģ��  */
	%>
	
	<h5>��Ʈ����Ʈ�� JSP���� ���� ���� ���� ����� �����Ѵ�. (EL)</h5>
	<div>�׳ɾ���: �⺻������ ���� ����� ������ ���� ��� >> ${fruit}</div>
	<div>��������: <br> >> applicationScope : ${applicationScope.fruit}</div>
	<div>>> sessionScope : ${sessionScope.fruit}</div>
	<div>>> requestScope :<%=request.getAttribute("fruit") %></div>
	<div>>> pageScope: ${pageScope.fruit}</div>
	
	<h5>JSTL</h5>
	<c:set var="snack" value="��������" scope="application"/>
	<c:set var="snack" value="��������" scope="session"/>
	<c:set var="snack" value="ȭ��Ʈ����" scope="request"/>
	<c:set var="snack" value="������" scope="page"/>
	<c:set var="snack" value="ġ�佺"/><!-- scope �������� page�� ��Ʈ����Ʈ ��� -->
	<c:set var="coffee" value="ī���"/>
	
	<div>application: ${applicationScope.snack}</div>
	<div>session: ${sessionScope.snack}</div>
	<div>request: ${requestScope.snack}</div>
	<div>page: ${pageScope.snack}</div>
	<div></div>
	
	<dl>
		<dt><b>c:if</b></dt>
		<dd>if���� �����ϰ� �� �� �ִ� �±�. els if�� else�� ����</dd>
		<dt><b>c:choose, c:when, c:otherwise</b></dt>
		<dd>if, else if, elseó�� ����� �� �ִ� �±�</dd>
	</dl>
	
	<h5>#��Ʈ����Ʈ�� ������ ���� Ȱ���� ���� if�� ��밡���ϴ�</h5>
	
	<c:if test ="${coffee =='ī���'}">
		<div>if���� ����Ǿ����ϴ�.</div>
	</c:if>
	
	<c:set var="num" value="-5"/>
	<c:choose>
		<c:when test="${num>10}">
		<div>if</div>
		</c:when>
		<c:when test="${num>0}">
		<div>else if</div>
		</c:when>
		<c:when test="${num> -10}">
		<div>else if</div>
		</c:when>
		<c:otherwise>
		<div>else</div>
		</c:otherwise>
	</c:choose>
	
	<dl>
		<dt><b>c:forEach</b></dt>
		<dd>for���� �����ϰ� ����� �� �ִ� �±�<br>���ڸ� ���� �ݺ��� �� �ְ�, ������� ������ �ݺ��� ���� �ִ�</dd>
		<dd>begin, end �Ӽ��� �־���Ѵ�</dd>
		<dd>step �Ӽ� ��밡��</dd>
	</dl>
	<h5>#���ϴ� Ƚ����ŭ �ݺ��ϱ�</h5>
	<c:forEach begin="0" end="9" var="i">
		<li id="list-item${i}">${i}��° ����Ʈ ������ �Դϴ�.</li>
	</c:forEach>
	<li>&lt;%= pageContext.getAttribute("i")%&gt; �� ����߾�����.</li>
		<div>for�� ��: ������ ������ �ʴ´� getAttribuet�ߴٰ� removeAttribute�� �Ȱ����� ����${i}<br></<div>
	
	<table border="1">
	<c:forEach begin="0" end="19" var="i" step="2">
		<tr>
			<td>${i}</td>
			<td>${i + 1}</td>
		</tr>
	</c:forEach>
	</table>
	
	<h5>#�迭, ����Ʈ �� ���������� �����鼭 �ݺ��ϱ�(Iterable)</h5>
	<div> ��Ʈ����Ʈ�� ������ؾ� ${index} ��밡���ϴ�</div>
	
	<%
		String[] coffees ={"Americano" , "Cafe Latte", "Vanilla Latte", "Cafe Mocha", "Macchiato"};
		List<String> foods = new ArrayList<>();
		foods.add("����"); /* setAttribute �ϱ� ���̴� ���̴� ������� �߰��� �ȴٴ� �̾߱� */
		
		pageContext.setAttribute("coffees", coffees);
		pageContext.setAttribute("foods", foods);
		
		foods.add("����");
		foods.add("��ġ����");
		foods.add("��ġ����"); /*  �������� ��Ƴ��⸸ �ϸ� ���ϰ� ����� �����ϴٴ� �̾߱� */
		java.util.Collections.sort(foods);
		
	%>
	<%= coffees[1] %>
	
	<c:forEach items="${coffees}" var="co">
		<div>${co}</div>
	</c:forEach>
	
	<c:forEach items="${foods}" var="food">
		<div>${food}</div>
	</c:forEach>
	
	<h3># �ݺ��ϸ鼭 varStatus Ȯ���ϱ�</h3>
	
	<ul>
		<li>varStatus.index : ���� �ε����� �� ��° ���� Ȯ���� �� �ִ�(0���� ����)</li>
		<li>varStatus.count : ���� ī��Ʈ�� �� �� �ΰ� Ȯ���� �� �ִ� (1���� ����)</li>
		<li>varStatus.first : ù ��° ����϶� true</li>
		<li>varStatus.last  : ������ ����� �� true</li>
		<li>varStatus.begin : ���۰��� ������ ���</li>
		<li>varStatus.end 	: ������ ���� ������ ���</li>
		<li>varStatus.step	: �������� ������ ���</li>
		<li>varStatus.current : ���� ��</li>
	</ul>
	
	<c:forEach items="${foods}" var="food" varStatus="v">
		<c:choose>
			<c:when test="${v.first}">
				<div class="first">${v.index}��° ����: ${food}(${v.count}��)</div>
			</c:when>
			<c:when test="${v.last}">
				<div class="last">${v.index}��° ����: ${food}(${v.count}��)</div>
			</c:when>
			<c:otherwise>
				<div class="mid">${v.index}��° ����: ${food}(${v.count}��)</div>
			</c:otherwise>
		</c:choose>
		<div>${v.index}:${food}(${v.count}��)</div>
	</c:forEach>	
	
	
	<%-- <c:set var="doneLoop" value="false"/>
	<c:forEach var="entitiy" items="${_STORE}" varStatus="v">
		<c:if test="${v.count % 6 == 1}">
			<c:set var="doneLoop" value="false"/>
		</c:if>
		<c:if test="${!doneLoop}">
			<span><input type="checkbox" id="store_id" name="store_id" value="<c:out value="${entity.STORE_ID}"/>"></span>
		</c:if>
	</c:forEach> --%>
	
	<dl>
		<dt><b>c:forTokens</b></dt>
		<dd>������ ���ڿ��� split�� ����� �ݺ��� �����ϴ� ����</dd>
		<dd>delims="/" -> / �� ���ø��ض�  "/#" -> /�� #�� ���ø� �ض�</dd>
	</dl>
	
	<h5>c:forTokens</h5>
	<c:set var="animals" value="pig/cat/dog/lion/tiger/zibra"/>
	
	<c:forTokens items="${animals}" delims="/" var="animal">
	<div>${animal}</div>
	</c:forTokens>
	
	<dl>
		<dt><b>c:url</b></dt>
		<dd>��θ� ����� �� �˾Ƽ� contextPath()�� �߰����ִ� ����</dd>
		<dd>&lt;%= request.getContextPath()%&gt;/abc/123 �̷������� �޴� ���� &lt;c:url value="/abc/123"&gt; ��</dd>
	</dl>
	
	<h5>#url ����ϰ� ����� </h5>
	<ul>
		<li><%= request.getContextPath()%>/abc/123</li>
		<li><c:url value="/abc/123"/></li>
		<li>��ο� �Ķ���� �߰��ϱ� : /abc/123?taste=banana&type=hot</li>
		<li>
			<c:url value="abc/123/add">
				<c:param name="employee_id" value="101"/>
				<c:param name="department_id" value="80"/>
			</c:url>		
		</li>
	</ul>

	<ul>
		<li>c:url�� var�� �����ϸ� �ش��ΰ� �信 ��µ��� �ʰ� ��Ʈ����Ʈ�� ��ϵȴ� </li>
		<li>&lt;a href="&lt;c:url="abc/123/aaa"&gt;"&gt;&lt;/a&gt; �̷��� ������� �ʰ�</li>
		<li>&lt;c:url value="abc/123/aaa" var="myURL1"/&gt;</li>
		<li>&lt;a href="${myURL1}"&gt;��ũ1&lt;/a&gt; �̷��� ���</li>
	</ul>	

	<c:url value="abc/123/aaa" var="myURL1"/>
	<a href="${myURL1}">��ũ1</a>
	<a href="${myURL1}">��ũ2</a>
	
</body>
</html>