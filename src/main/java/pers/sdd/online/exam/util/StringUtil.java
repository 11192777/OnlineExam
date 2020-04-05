package pers.sdd.online.exam.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class StringUtil {

	public static boolean isEmpty(String str) {
		return str == null || "".equals(str.trim());
	}
	
	public static String fuzzyQueryStringDeal(String str) {
		if (!StringUtil.isEmpty(str)) {
			if (str.indexOf("\\") != -1) {
				str = str.replaceAll("\\\\", "\\\\\\\\");
			}
			if (str.indexOf("%") != -1) {
				str = str.replaceAll("%", "\\\\%");
			}
			if (str.indexOf("_") != -1) {
				str = str.replaceAll("_", "\\\\_");
			}
		}
		return str;
	}
	
	public static String getPinYin(String str) {
		char[] t1 = null;
		t1 = str.toCharArray();
		String[] t2 = new String[t1.length];
		HanyuPinyinOutputFormat t3 = new HanyuPinyinOutputFormat();
		t3.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		t3.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		t3.setVCharType(HanyuPinyinVCharType.WITH_V);
		String t4 = "";
		for (int i = 0; i < t1.length; i++) {
			if (java.lang.Character.toString(t1[i]).matches("[\\u4E00-\\u9FA5]+")) {
			}
			try {
				t2 = PinyinHelper.toHanyuPinyinStringArray(t1[i], t3);
			} catch (BadHanyuPinyinOutputFormatCombination e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			t4 += t2[0];
		}
		return t4;
	}
	
	public static String getPinYinHeadChar(String str){
		String convert = "";
		for (int j = 0;j<str.length();j++){
			char word = str.charAt(j);
			String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);
			if (pinyinArray != null){
				convert += pinyinArray[0].charAt(0);
			}else{
				convert += word;
			}
		}
		return convert.toUpperCase();
		
	}
}
