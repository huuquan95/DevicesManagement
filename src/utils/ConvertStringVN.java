package utils;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class ConvertStringVN {
	public String removeAccent(String s) {
		  String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		  Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		  return pattern.matcher(temp).replaceAll("").replaceAll("Đ", "D").replaceAll("đ", "d");
		 }
	 public static void main(String[] args) {
		 ConvertStringVN convertStringVN = new ConvertStringVN();
		  System.out.print(convertStringVN.removeAccent("Bóng Đá"));
	 }
}
