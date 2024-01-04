//closeAd.js
//체크박스 클릭하고 광고창 닫았을때 & 버튼 클릭후 창 닫았을 때 쿠키 30초 안나오게 설정하기

// const closeAdBtn = document.getElementById("closeAdBtn"); // 광고 닫기 버튼 
const adPopup = document.getElementById("advertisementPopup"); // 광고 팝업 창
const checkBox = document.getElementById("checkBox"); // 광고 팝업 창 내 체크박스

// 체크박스 옆에 닫기 버튼 클릭해도 창 닫히게 
/* checkBox.addEventListener('click', (e) => { // closeAdBtn -> checkBox
	 closeAdvertisement();
	fetch('/chap09/quiz/close'); // 서블릿을 호출

 });*/

// 브라우저의 창을 닫는 동작 감지 해서 쿠키 설정하러 가기
//  checkBox.addEventListener('change', function (e) {
//  if (checkBox.checked) {
//	  fetch('/quiz/close', { method: 'POST'});
//	  closeAdvertisement();
//	 }
//  });

window.addEventListener('beforeunload', function(event) {
	 // 체크박스가 체크되어 있을 때만 서블릿 호출
	if (checkBox.checked) {
		fetch('/quiz/close', { method: 'POST'});
		adPopup.close();
		document.cookie = "cookie=true; max-age=30";
	} else {
		  // 광고창을 닫았을 때 서블릿 호출
		fetch('/quiz/close', { method: 'GET' });
	}
});


window.addEventListener('load', function(){
	const cookieName = "cookie";
	const hideAdCookie  = document.cookie.split(';').find(row => row.startsWith(`${cookieName}=`));
	
	if(hideAdCookie){
		const [, value] = hideAdCookie.split('=');
		if(value === 'true'){
			window.close();
		}
	}
});



