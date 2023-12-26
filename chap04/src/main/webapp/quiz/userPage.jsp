<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>userPage.jsp</title>
</head>
<body>
    <!-- 로그인한 사람은 이전에 해당 아이디로 작성한(등록해둔) 메모를 볼 수 있어야 한다 -->
    <!-- 추가 버튼 -> 메모장 열리고 -> 메모 입력 후 저장 버튼 누르면 저장됨 -->
    <!-- 서버를 재시작 했을때 모든 회원정보 및 메모가 사라져도 상관없다 -->

    <h2> Hello! <%= session.getAttribute("userId") %>!</h2>
    <textarea id="memoInput"></textarea>
    <button type="button" onclick="saveMemo()">저장</button>
 	<button type="button" onclick="getSavedMemo()">메모 불러오기</button>
 	<button>로그아웃</button>
 	
    <!-- 기존 메모 출력 로직 -->
  	<!--<p id="savedMemoText"> getSavedMemo() %></p>  --> 

   <script>
        function saveMemo() {
            const memo = document.getElementById("memoInput").value;

            // 폼 생성
            const form = document.createElement("form");
            form.method = "POST";
            form.action = "/chap04/saveMemo"; // 저장 로직을 처리하는 서블릿 URL

            // 히든 필드 추가
            const userIdInput = document.createElement("input");
            userIdInput.type = "hidden";
            userIdInput.name = "userId";
            userIdInput.value = "<%= session.getAttribute("userId") %>"; 
            
            const memoInput = document.createElement("input");
            memoInput.type = "hidden";
            memoInput.name = "memo";
            memoInput.value = memo;

            // 폼에 히든 필드 추가
            form.appendChild(userIdInput);
            form.appendChild(memoInput);

            document.body.appendChild(form);
            form.submit();
        }
        
        public static List<Memo> getMemosUser(String userid) {
            // 사용자가 작성한 메모 조회
            
            
        }
       
    </script>
</body>
</html>















