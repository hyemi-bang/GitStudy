//closeAd.js
//체크박스 클릭하고 광고창 닫았을때 & 버튼 클릭후 창 닫았을 때 쿠키 30초 안나오게 설정하기
  
// const closeAdBtn = document.getElementById("closeAdBtn"); // 광고 닫기 버튼 
const adPopup = document.getElementById("advertisementPopup"); // 광고 팝업 창
const checkBox = document.getElementById("checkBox"); // 광고 팝업 창 내 체크박스


if(checkBox.checked){
	fetch('/chap09/quiz/close');
	window.close();
}

// 체크박스 옆에 닫기 버튼 클릭해도 창 닫히게 
 checkBox.addEventListener('click', (e) => { // closeAdBtn -> checkBox
	 closeAdvertisement();
	fetch('/chap09/quiz/close'); // 서블릿을 호출

 });

  // 광고를 닫는 함수
  // 광고 팝업 창 이미지를 가리는게 아니라 창을 닫아야함 
  const closeAdvertisement = () => {
    adPopup.style.display = "hide"; // none -> hide
  };

