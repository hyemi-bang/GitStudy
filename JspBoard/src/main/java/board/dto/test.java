package board.dto;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public class test {

	public static void main(String[] args) {
		// String 에 기본적으로 있는 해시코드 메서드는 비밀번호로 사용하기에 좋지 않음
		// 문자열만으로 충분히 유추가 가능함
		System.out.println("ABcD".hashCode());

		String message = "hello";
		// 사용할 수 있는 해시 알고리즘 종류 : SHA256, SHA512, MD5 ...
		try {
			// 해당 알고리즘의 인스턴스 생성
			MessageDigest eater = MessageDigest.getInstance("SHA512");

			// 해당 알고리즘에 원하는 메세지 세팅
			eater.update(message.getBytes());

			byte[] result = eater.digest(); // byte[]

			System.out.println(Arrays.toString(result));
			System.out.println(new String(result));

			// 일반적으로 결과를 16진수 문자열로 바꿔서 DB에 저장하는 편
			StringBuilder builder = new StringBuilder();
			
			// 한자리 숫자가 나올 수도 있으므로 %02X 앞에 0을 추가해야함
			for (int i = 0; i < result.length; i++) {
				System.out.printf("%02X", result[i]);
				builder.append(String.format("%02X", result[i]));
				
			}
			System.out.println();
			System.out.println(builder);

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		// 암호화 해시 함수
		//https://ko.wikipedia.org/wiki/%EC%95%94%ED%98%B8%ED%99%94_%ED%95%B4%EC%8B%9C_%ED%95%A8%EC%88%98
	
	/*
			1byte - 8bit
			1byte -> 16진수 2개로 표현
			
			1byte 49 -> 0011 0001 (모든 1바이트의 값은 : 8개의 2진수로 표현될 수 있다. 8bit이기 때문)
			
			4자리의 2진수 숫자는 16진수 숫자 하나로 표현될 수 있다
			0000 -> 0
			.
			.
			.
			1111 ->15(F)
			
			8비트는 0~127 인데 1000 0000은 128이니까 오버플로우 나서 -128
			0111 1111 127
			1000 0000 -128
			1000 0001 -127
			1000 0010 -126
			
			0010 0101 - -> 0 <-> 1 바꿔 
			1101 1011 -> -37
			  (32) + (4) + 1 => 37임 
			.
			.
			.
			.
			1111 1110 -2 (0000 00
			1111 1111 -1
			0000 0000 0
	*/
	}
}
