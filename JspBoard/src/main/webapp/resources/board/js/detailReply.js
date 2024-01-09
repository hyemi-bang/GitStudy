
const replyContent = document.querySelector('#replyContent');
const replyForm = document.querySelector('#replyForm');
const replyWriter = document.querySelector('#replyWriter');
const replyPassword = document.querySelector('#replyPassword');

replyContent.addEventListener('keydown', (e) => {
	console.log(e);

	const keyCode = e.keyCode;
	
	 if (keyCode === 13) {
        if (!e.shiftKey) {
		// 쉬프트 안누르고 enter -> submit()한다
			e.preventDefault();
			
			console.dir(replyPassword.value);
			if(replyWriter.value.trim() === ''){
				alert('글쓴이가 비어있습니다');
				return;
			} else if(replyPassword.value.trim() ==='' || replyPassword.value.length <5){
				alert('비밀번호는 4글자 이상이어야합니다');
					return;
			}
			
			replyForm.submit();  
		} else{
			//Shift + Enter -> 댓글에서 줄 바꿔주기
			replyContent.innerText +='\n';
		}
	}

});