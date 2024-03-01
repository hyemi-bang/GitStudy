const btn1 = document.getElementById('btn1');

btn1.addEventListener('click',(e)=>{
	//window.open(url?: string | URL | undefined, target?: string | undefined, features?: string | undefined)
	// : 새 창을 여는 자바스크립트 함수 , window 생략가능
	// taget > a 태그의 taget, 
	
	open('./popup.jsp','_blank','width=400,height=400,top=100,right=100'); 
	// _blank 새창
});