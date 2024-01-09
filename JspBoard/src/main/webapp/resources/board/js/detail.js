const modiBtn = document.querySelector('#modiBtn');
const delBtn = document.querySelector('#delBtn');
const delForm  = document.querySelector('#delForm');
const inputPassword = document.querySelector('#inputPassword');
const hiddenPassword = document.querySelector('#hiddenPassword');

const getHashedPassword = password => sha256(password).toUpperCase();

const checkHash = () => boardPassword === getHashedPassword(inputPassword.value);

modiBtn.addEventListener('click', (e) => {
	
	 // = sha256(inputPassword.value);
   
   //console.log('boardPassword',boardPassword); -> 대문자로 나왔고
   //console.log('inputPassword', inputPassword.value); -> 소문자로 나왔다 그래서 sha256().toUpperCase()한것
   //console.log('inputHashed:', sha256(inputPassword.value));
   // ->여기서 추출된 결과를 보관해야한다 -> inputHashed 매게변수로 뺏다가.. -> checkHash 만듦
   
   
    if (checkHash()) {
        location.href = './modify?board_id=' + board_id;
    } else {
        alert('비밀번호가 틀렸습니다');
    }
});


delBtn.addEventListener('click', (e) => {
    if (checkHash()) {
		hiddenPassword.value = getHashedPassword(inputPassword.value);
        delForm.submit();
        alert('게시물이 삭제되었습니다.');
    } else {
        alert('비밀번호가 틀렸습니다');
    }
});


const delBtn2 = document.querySelector('#delBtn2');

delBtn2.addEventListener('click', (e)=>{
   const popup = open('./delete/open','_blank','width=500,height=350'); // 어플리케이션서블릿으로 가는 주소, 겟 방식으로 들어갈 것이다
	
});