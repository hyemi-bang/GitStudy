
const modiConfirmBtn = document.querySelector('#modiConfirmBtn');
const modiForm = document.querySelector('#modiForm');

console.log(modiForm);  // Ȯ�ο� �α�

const validataForm = () => {
		if (modiForm.elements.board_title.value.trim() == '') {
		alert('������ ������ϴ�.');
		return false;
	} else if(modiForm.elements.board_content.value.trim() == ''){
		alert('������ ������ϴ�.');
		return false;
	}
	return true;
}

// �� ������ submit�� �߻��ϴ� ��� ����Ǵ� �̺�Ʈ
modiForm.addEventListener('submit', (e) => {
	
	const result = validataForm();
	
	if(!result){
		e.preventDefault(); // �⺻ ������ ���´�. submit�ߴ�
	}
});

//��ư�� ������ �� �̺�Ʈ
modiConfirmBtn.addEventListener('click', (e) => {
	console.dir(modiForm);
	//form.elements : form�� �ҼӵǾ��ִ� ��ҵ�, name�� ���� �� ��Ҹ� ������ �� �ִ�
	console.log(modiForm.elements);
	console.log(modiForm.elements.board_title);

	/*if (modiForm.elements.board_title.value.trim() == '') {
		alert('������ ������ϴ�.');
		return;
	} else if(modiForm.elements.board_content.values.trim() == ''){
		alert('������ ������ϴ�.');
		return;
	} */

 	validataForm() ?  modiForm.submit() : 0; //form��Ҹ� JS���� ���� Submit �� �� �ִ�
});