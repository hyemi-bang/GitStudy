<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>userPage.jsp</title>
</head>
<body>
    <!-- �α����� ����� ������ �ش� ���̵�� �ۼ���(����ص�) �޸� �� �� �־�� �Ѵ� -->
    <!-- �߰� ��ư -> �޸��� ������ -> �޸� �Է� �� ���� ��ư ������ ����� -->
    <!-- ������ ����� ������ ��� ȸ������ �� �޸� ������� ������� -->

    <h2> Hello! <%= session.getAttribute("userId") %>!</h2>
    <textarea id="memoInput"></textarea>
    <button type="button" onclick="saveMemo()">����</button>
 	<button type="button" onclick="getSavedMemo()">�޸� �ҷ�����</button>
 	<button>�α׾ƿ�</button>
 	
    <!-- ���� �޸� ��� ���� -->
  	<!--<p id="savedMemoText"> getSavedMemo() %></p>  --> 

   <script>
        function saveMemo() {
            const memo = document.getElementById("memoInput").value;

            // �� ����
            const form = document.createElement("form");
            form.method = "POST";
            form.action = "/chap04/saveMemo"; // ���� ������ ó���ϴ� ���� URL

            // ���� �ʵ� �߰�
            const userIdInput = document.createElement("input");
            userIdInput.type = "hidden";
            userIdInput.name = "userId";
            userIdInput.value = "<%= session.getAttribute("userId") %>"; 
            
            const memoInput = document.createElement("input");
            memoInput.type = "hidden";
            memoInput.name = "memo";
            memoInput.value = memo;

            // ���� ���� �ʵ� �߰�
            form.appendChild(userIdInput);
            form.appendChild(memoInput);

            document.body.appendChild(form);
            form.submit();
        }
        
        public static List<Memo> getMemosUser(String userid) {
            // ����ڰ� �ۼ��� �޸� ��ȸ
            
            
        }
       
    </script>
</body>
</html>















