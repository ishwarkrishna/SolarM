package util;

import java.util.regex.Pattern;

public class Test {
	public static void main(String arg[]){
		String a = "0122.166.17.321";
		Pattern pattern = Pattern.compile(".*[^0-9].*");
		//System.out.println(pattern.equals(a));
		System.out.println(pattern.matcher(a).matches());
		/*char[] cChar = a.toCharArray();
		for(int i = 0; i< cChar.length; i++){
			if(Character.isDigit(cChar[i])){
				System.out.println("Its digit");
			}
		}*/
		
	}
}
