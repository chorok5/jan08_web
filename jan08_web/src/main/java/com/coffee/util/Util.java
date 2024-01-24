package com.coffee.util;

import java.util.Iterator;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public class Util {
	
	public static int str2Int(String str) { // String을 int로 변경
		// A59 => 59로 출력되도록
		// 5a9 => 59로 출력되도록 (숫자만 남기고 문자 제거, 무조건 숫자만 출력되도록)
		
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < str.length(); i++) {
			if (Character.isDigit(str.charAt(i))) {
				sb.append(str.charAt(i));
			}
		}
//		return Integer.parseInt(sb.toString());
		


		int number = 0;
		if(sb.length() > 0) {
			number = Integer.parseInt(sb.toString());
		}
//		System.out.println("변환된 숫자 " + number);
		return number;
	}
	
// 		다른 방법 		
//		String numberOnly = str.replaceAll("[^-9]", "");
//		return Integer.parseInt(numberOnly);
		
		
	public static int str2Int2(String str) {
        // A59 -> 59
        // 5A9 -> 59
        String numberOnly = str.replaceAll("[^0-9]", "");
        return Integer.parseInt(numberOnly);
     }
	
	public static boolean intCheck(String str) {
		try {
			Integer.parseInt(str); // str을 int로 변경해. 변경 가능하면 숫자니까 true
			return true;
		} catch (Exception e) {
			return false;		
	}
}
//	public static void main(String[] args) {
//	String str1 = "hello123"; // false
//	String str2 = "1a2aa3"; // false
//	String str3 = "123"; // true
//	
//	System.out.println(intCheck(str1));
//	System.out.println(intCheck(str2));
//	System.out.println(intCheck(str3));
//
//	public static boolean intCheck2(String parameter) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//}
//	
	
//------------------------------------------------------------- 아래는 for문으로 돌림.
	
//	 String 값이 들어오면 int타입인지 확인하는 메소드
	public static boolean intCheck2(String str) {
	    if (str.length() == 0) {
	        return false;
	    }

	    for (int i = 0; i < str.length(); i++) {
	        if (!Character.isDigit(str.charAt(i))) {
	            // 숫자가 아닌 문자를 발견하면 false 반환
	            return false;
	        }
	    }
	    return true; // 모든 문자가 숫자인 경우에만 true 반환
	}

	// ip가져오기
	public static String getIP(HttpServletRequest request) {
	      String ip = request.getHeader("X-FORWARDED-FOR");
	      if(ip == null) {
	         ip = request.getHeader("Proxy-Client-IP");
	      }
	      if(ip == null) {
	         ip = request.getHeader("WL-Proxy-Client-IP");   
	      }
	      if(ip == null) {
	         ip = request.getHeader("HTTP_CLIENT_IP");
	      }
	      if(ip == null) {
	         ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	      }
	      if(ip == null) {
	         ip = request.getRemoteAddr();
	      }
	      return ip;
	   }

	// HTML태그를 특수기호로 변경 < &lt /  > &gt
	public static String removeTag(String str) {
		str = str.replaceAll("<", "&lt");
		str = str.replaceAll(">", "&gt");
		return str;
	}
	
	public static String addBR(String str) {
		return str.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
	   }
	
	public static String ipMasking(String ip) {
	    if(ip.indexOf('.') != -1) { // ip가 아닐때
	        StringBuffer sb = new StringBuffer(); // 멀티스레드 환경에서 동기화 지원
	        sb.append(ip.substring(0, ip.indexOf('.')+1));
	        sb.append("♡.");
	        sb.append(ip.substring(ip.indexOf('.', ip.indexOf('.')+1)+1));
	        
	        return sb.toString();
	    } else { 
	        return ip;
	    }
	}

	
	

	public static void main(String[] args) {
//	    String str1 = "hello123"; // false
//	    String str2 = "1a2aa3"; // false
//	    String str3 = "123"; // true
//	    String str4 = ""; // false
//
//	    System.out.println(intCheck2(str1));
//	    System.out.println(intCheck2(str2));
//	    System.out.println(intCheck2(str3));
//	    System.out.println(intCheck2(str4));
	}
}


