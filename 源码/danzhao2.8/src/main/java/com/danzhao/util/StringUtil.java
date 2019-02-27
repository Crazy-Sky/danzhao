package com.danzhao.util;

import java.util.ArrayList;
import java.util.List;

public class StringUtil {

	// / -->> \\
	public static String StringDealWith(String str){
		str.replaceAll("/", "\\");
		return str;
	}
	
	//字符处理 1:2:3 --> [1,2,3]
	public static List<String> StringToList(String str){
		List<String> list = new ArrayList<String>();
		int i = 0, j = 0 ;
		String t = "";
		while(i < str.length()){
			t += str.charAt(j);
			j++;
			if(j >= str.length()){
				list.add(t);
				break;
			}
			if(str.charAt(j) == ':'){
				i = j;
				j++;
				list.add(t);
				t = "";
			}
		}
		
		return list;
	}
	//字符处理 [1,2,3] --> 1:2:3
	public static String listToString(List<String> list){
		String str = "";
		for (String s : list) {
			str += s;
			str += ":";
		}
		str = str.substring(0, str.length()-1);
		return str;
	}
	
	//字符处理 [1,2,3] --> 1;2;3
	public static String listToString2(List<String> list){
		String str = "";
		for (String s : list) {
			str += s;
			str += ";";
		}
		str = str.substring(0, str.length()-1);
		return str;
	}
	
	public static void main(String[] args) {
		/*String s = "1:2:21:313:4:5:6:10";
		List<String> s2 = StringUtil.StringToList(s);
		System.out.println(s2.toString());
		String t = StringUtil.listToString(s2);
		System.out.println(t);*/
		/*List<String> list = new ArrayList<String>();
		list.add("1:B");list.add("2:A");list.add("3:D");
		System.out.println(StringUtil.listToString2(list));*/
	}
}
