const modiBtn = document.querySelector('#modiBtn');
const delBtn = document.querySelector('#delBtn');
const delForm  = document.querySelector('#delForm');
const inputPassword = document.querySelector('#inputPassword');
const hiddenPassword = document.querySelector('#hiddenPassword');

const getHashedPassword = password => sha256(password).toUpperCase();

const checkHash = () => boardPassword === getHashedPassword(inputPassword.value);

modiBtn.addEventListener('click', (e) => {
	
	 // = sha256(inputPassword.value);
   
   //console.log('boardPassword',boardPassword); -> �빮�ڷ� ���԰�
   //console.log('inputPassword', inputPassword.value); -> �ҹ��ڷ� ���Դ� �׷��� sha256().toUpperCase()�Ѱ�
   //console.log('inputHashed:', sha256(inputPassword.value));
   // ->���⼭ ����� ����� �����ؾ��Ѵ� -> inputHashed �ŰԺ����� ���ٰ�.. -> checkHash ����
   
   
    if (checkHash()) {
        location.href = './modify?board_id=' + board_id;
    } else {
        alert('��й�ȣ�� Ʋ�Ƚ��ϴ�');
    }
});


delBtn.addEventListener('click', (e) => {
    if (checkHash()) {
		hiddenPassword.value = getHashedPassword(inputPassword.value);
        delForm.submit();
        alert('�Խù��� �����Ǿ����ϴ�.');
    } else {
        alert('��й�ȣ�� Ʋ�Ƚ��ϴ�');
    }
});


const delBtn2 = document.querySelector('#delBtn2');

delBtn2.addEventListener('click', (e)=>{
   const popup = open('./delete/open','_blank','width=500,height=350'); // ���ø����̼Ǽ������� ���� �ּ�, �� ������� �� ���̴�
	
});