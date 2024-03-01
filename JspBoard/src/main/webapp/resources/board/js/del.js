
document.querySelector('form').addEventListener('click', (e) => {

	const inputPassword = document.querySelector('#inputPassword');
	const hashedPassword = sha256(inputPassword.value);

	if (hashedPassword === boardPassword) {
	} else {
		alert('비밀번호확인.');
		e.preventDefault();
	}
});