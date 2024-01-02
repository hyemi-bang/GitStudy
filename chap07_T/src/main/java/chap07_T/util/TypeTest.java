package chap07_T.util;

import chap07_T.dto.BreadDTO;

public class TypeTest {
	
	static void method1(BreadDTO bread) {
		bread.setBread_name("초코소로빵");
		bread.setBread_price(2200);
	} // bread에 리턴을 하지 않지만, 매게변수를 bread로 했다
	
	static void method2(int a) {
		a = a+10;
	}
	

	public static void main(String[] args) {
		// 참조형 변수(Wrapper클래스, String클래스에는 적용되지 않음)의 경우에는 해당 인스턴스의 주소를 넘기기 때문에 
		// 메서드에 가서 변화가 있다면 원본 인스턴스에 변화가 생긴다
		BreadDTO bread = new BreadDTO();
		
		method1(bread); // method1에다가 bread를 전달하면 원본 메서드의 BreadDTO 의 녀석들이 변화하는 것이다.
		
		
		System.out.println("Bread Name: " + bread.getBread_name());
		System.out.println("Bread Price: " + bread.getBread_price());
		
		// 기본형 변수의 경우는 저장되어있는 값을 넘기기 때문에 메서드에 가서 변화가 생겨도 메서드의 지역변수의 값이 변할 뿐이다.
		int num = 10;
		method2(num);
		System.out.println("num:" + num);
		

	}

}
