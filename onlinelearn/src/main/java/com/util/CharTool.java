package com.util;

import java.io.UnsupportedEncodingException;

public class CharTool {

	public static String setCharEncoding(String target){
		String str = null;
		try {
			str = new String(target.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}
}
