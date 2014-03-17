package util;

import java.util.HashMap;
import java.util.Map;

public class Main {
	public static void main(String arg[]){
		Map<String, Double> s = new HashMap<String, Double>();
		s.put("a", 12.0);
		s.put("ab", 1.2);
		s.put("a", 12.4);
		System.out.println(s.get("a"));
		String imei = "0863071010842216";
		System.out.println(imei.substring(imei.length()-6,imei.length()));
		double a = 0;
		double b = 1000.0;
		double value = a/b;
		System.out.println("value......"+value);
	}
}
