package board.secure;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecureTools {
	
	public static String genHashPassword(String password) {
		try {
			// 매개변수 password 를 getBytes(byte[])로 digest 해서 
			// MessageDigest 클래스의 getInstance 메서드를 사용하며
			// 이 메서드는 사용할 알고리즘의 이름을 매개변수로 받음 여기서는 "SHA256" 알고리즘을 사용함
			byte[] hashed = MessageDigest.getInstance("SHA256").digest(password.getBytes());
			
			StringBuilder builder = new StringBuilder();
			
			for(byte b : hashed) {
				builder.append(String.format("%02X", b));
			}
			return builder.toString();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}

}
