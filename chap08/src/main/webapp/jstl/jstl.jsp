<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--taglib : 나만의 태그를 만드는 기능  -->
<!--prefix="c" : JSTL core  -->
<!--uri : 태그 라이브러리의 네임 스페이스 URI 식별자 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL</title>
</head>
<body>

	<h3>#JSTL (JSP Standard Tag Library)</h3>
	<ul>
		<li>JSP에서 자바 코드를 사용할 때 코드가 너무 지저분해져서 등장한 커스텀 태그 라이브러리</li>
		<li>뷰 쪽에서 자주 쓰이는 자바 문법들을 HTML 태그와 유사한 형식으로 사용할 수 있는 기능을 제공한다</li>
		<li>자바의 모든 기능을 사용할 수 있는건 아니지만, 뷰 페이지를 만들기에는 충분한 기능들이 태그형식으로 구현되어있다</li>
		<li>Maven Repository에서 다운로드 가능</li>
		<li>taglib 문법으로 추가한 후 사용해야한다</li>
	</ul>
	
	<h3>#JSTL core</h3>
	
	<dl>
		<dt><b>c:set</b></dt>
		<dd>각 영역에 setAttribute를 편리하게 단축하여 사용할 수 있는 태그</dd>
		<dd>이 태그로 생성한 변수는 JSP의 로컬 변수가 아니라 <br>
		서블릿 보관소(JspContext, ServletRequest, HttpSession, ServletContext)에 저장된다.</dd>
		<dd>scope의 기본값은 page. scope를 생략하면 JspContext에 저장된다.</dd>
		<dd>&lg;c:set&gt;으로 이미 존재하는 변수에 값을 할당할 경우 기존 값을 덮어쓴다.</dd>
	</dl>
	
	<%
		// 각 영역에 어트리뷰트 추가해보기
		application.setAttribute("fruit", "사과");
		session.setAttribute("fruit", "귤");
		request.setAttribute("fruit", "바나나");
		pageContext.setAttribute("fruit", "포도"); /* 포워드할때 사라지는 친구  */
	%>
	
	<h5>어트리뷰트는 JSP에서 쉽게 꺼내 쓰는 기능을 제공한다. (EL)</h5>
	<div>그냥쓰기: 기본적으로 가장 가까운 영역의 값을 사용 >> ${fruit}</div>
	<div>영역구분: <br> >> applicationScope : ${applicationScope.fruit}</div>
	<div>>> sessionScope : ${sessionScope.fruit}</div>
	<div>>> requestScope :<%=request.getAttribute("fruit") %></div>
	<div>>> pageScope: ${pageScope.fruit}</div>
	
	<h5>JSTL</h5>
	<c:set var="snack" value="초코파이" scope="application"/>
	<c:set var="snack" value="초코하임" scope="session"/>
	<c:set var="snack" value="화이트하임" scope="request"/>
	<c:set var="snack" value="빅파이" scope="page"/>
	<c:set var="snack" value="치토스"/><!-- scope 미지정시 page에 어트리뷰트 등록 -->
	<c:set var="coffee" value="카페라떼"/>
	
	<div>application: ${applicationScope.snack}</div>
	<div>session: ${sessionScope.snack}</div>
	<div>request: ${requestScope.snack}</div>
	<div>page: ${pageScope.snack}</div>
	<div></div>
	
	<dl>
		<dt><b>c:if</b></dt>
		<dd>if문을 간편하게 쓸 수 있는 태그. els if와 else는 없다</dd>
		<dt><b>c:choose, c:when, c:otherwise</b></dt>
		<dd>if, else if, else처럼 사용할 수 있는 태그</dd>
	</dl>
	
	<h5>#어트리뷰트에 보관된 값을 활용해 쉽게 if문 사용가능하다</h5>
	
	<c:if test ="${coffee =='카페라떼'}">
		<div>if문이 실행되었습니다.</div>
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
		<dd>for문을 간편하게 사용할 수 있는 태그<br>숫자를 통해 반복할 수 있고, 순서대로 꺼내며 반복할 수도 있다</dd>
		<dd>begin, end 속성을 넣어야한다</dd>
		<dd>step 속성 사용가능</dd>
	</dl>
	<h5>#원하는 횟수만큼 반복하기</h5>
	<c:forEach begin="0" end="9" var="i">
		<li id="list-item${i}">${i}번째 리스트 데이터 입니다.</li>
	</c:forEach>
	<li>&lt;%= pageContext.getAttribute("i")%&gt; 로 사용했었었다.</li>
		<div>for문 밖: 에서는 나오지 않는다 getAttribuet했다가 removeAttribute가 된것으로 보임${i}<br></<div>
	
	<table border="1">
	<c:forEach begin="0" end="19" var="i" step="2">
		<tr>
			<td>${i}</td>
			<td>${i + 1}</td>
		</tr>
	</c:forEach>
	</table>
	
	<h5>#배열, 리스트 등 순차적으로 꺼내면서 반복하기(Iterable)</h5>
	<div> 어트리뷰트에 등록을해야 ${index} 사용가능하다</div>
	
	<%
		String[] coffees ={"Americano" , "Cafe Latte", "Vanilla Latte", "Cafe Mocha", "Macchiato"};
		List<String> foods = new ArrayList<>();
		foods.add("삼겹살"); /* setAttribute 하기 전이던 후이던 상관없이 추가가 된다는 이야기 */
		
		pageContext.setAttribute("coffees", coffees);
		pageContext.setAttribute("foods", foods);
		
		foods.add("피자");
		foods.add("멸치국수");
		foods.add("잔치국수"); /*  서블릿에서 담아놓기만 하면 편리하게 사용이 가능하다는 이야기 */
		java.util.Collections.sort(foods);
		
	%>
	<%= coffees[1] %>
	
	<c:forEach items="${coffees}" var="co">
		<div>${co}</div>
	</c:forEach>
	
	<c:forEach items="${foods}" var="food">
		<div>${food}</div>
	</c:forEach>
	
	<h3># 반복하면서 varStatus 확인하기</h3>
	
	<ul>
		<li>varStatus.index : 현재 인덱스가 몇 번째 인지 확인할 수 있다(0부터 시작)</li>
		<li>varStatus.count : 현재 카운트가 몇 개 인가 확인할 수 있다 (1부터 시작)</li>
		<li>varStatus.first : 첫 번째 요소일때 true</li>
		<li>varStatus.last  : 마지막 요소일 때 true</li>
		<li>varStatus.begin : 시작값을 꺼내서 사용</li>
		<li>varStatus.end 	: 마지막 값을 꺼내서 사용</li>
		<li>varStatus.step	: 증감값을 꺼내서 사용</li>
		<li>varStatus.current : 현재 값</li>
	</ul>
	
	<c:forEach items="${foods}" var="food" varStatus="v">
		<c:choose>
			<c:when test="${v.first}">
				<div class="first">${v.index}번째 음식: ${food}(${v.count}개)</div>
			</c:when>
			<c:when test="${v.last}">
				<div class="last">${v.index}번째 음식: ${food}(${v.count}개)</div>
			</c:when>
			<c:otherwise>
				<div class="mid">${v.index}번째 음식: ${food}(${v.count}개)</div>
			</c:otherwise>
		</c:choose>
		<div>${v.index}:${food}(${v.count}개)</div>
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
		<dd>전달한 문자열을 split한 결과로 반복을 수행하는 문법</dd>
		<dd>delims="/" -> / 로 스플릿해라  "/#" -> /나 #로 스플릿 해라</dd>
	</dl>
	
	<h5>c:forTokens</h5>
	<c:set var="animals" value="pig/cat/dog/lion/tiger/zibra"/>
	
	<c:forTokens items="${animals}" delims="/" var="animal">
	<div>${animal}</div>
	</c:forTokens>
	
	<dl>
		<dt><b>c:url</b></dt>
		<dd>경로를 사용할 때 알아서 contextPath()를 추가해주는 문법</dd>
		<dd>&lt;%= request.getContextPath()%&gt;/abc/123 이런식으로 햇던 것을 &lt;c:url value="/abc/123"&gt; 로</dd>
	</dl>
	
	<h5>#url 깔끔하게 만들기 </h5>
	<ul>
		<li><%= request.getContextPath()%>/abc/123</li>
		<li><c:url value="/abc/123"/></li>
		<li>경로에 파라미터 추가하기 : /abc/123?taste=banana&type=hot</li>
		<li>
			<c:url value="abc/123/add">
				<c:param name="employee_id" value="101"/>
				<c:param name="department_id" value="80"/>
			</c:url>		
		</li>
	</ul>

	<ul>
		<li>c:url에 var을 설정하면 해당경로가 뷰에 출력되지 않고 어트리뷰트에 등록된다 </li>
		<li>&lt;a href="&lt;c:url="abc/123/aaa"&gt;"&gt;&lt;/a&gt; 이렇게 상요하지 않고</li>
		<li>&lt;c:url value="abc/123/aaa" var="myURL1"/&gt;</li>
		<li>&lt;a href="${myURL1}"&gt;링크1&lt;/a&gt; 이렇게 사용</li>
	</ul>	

	<c:url value="abc/123/aaa" var="myURL1"/>
	<a href="${myURL1}">링크1</a>
	<a href="${myURL1}">링크2</a>
	
</body>
</html>