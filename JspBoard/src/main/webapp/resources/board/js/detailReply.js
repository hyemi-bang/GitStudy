
const replyContent = document.querySelector('#replyContent');
const replyForm = document.querySelector('#replyForm');
const replyWriter = document.querySelector('#replyWriter');
const replyPassword = document.querySelector('#replyPassword');

replyContent.addEventListener('keydown', (e) => {
	console.log(e);

	const keyCode = e.keyCode;
	
	 if (keyCode === 13) {
        if (!e.shiftKey) {
		// ����Ʈ �ȴ����� enter -> submit()�Ѵ�
			e.preventDefault();
			
			console.dir(replyPassword.value);
			if(replyWriter.value.trim() === ''){
				alert('�۾��̰� ����ֽ��ϴ�');
				return;
			} else if(replyPassword.value.trim() ==='' || replyPassword.value.length <5){
				alert('��й�ȣ�� 4���� �̻��̾���մϴ�');
					return;
			}
			
			replyForm.submit();  
		} else{
			//Shift + Enter -> ��ۿ��� �� �ٲ��ֱ�
			replyContent.innerText +='\n';
		}
	}

});