package com.danzhao.test;

public class StringTest {
	public static void main(String[] args) {
		String str = "123:B";
		System.out.println(str.substring(0, str.indexOf(":")));
		System.out.println(str.substring(str.indexOf(":")+1));
	}
}
