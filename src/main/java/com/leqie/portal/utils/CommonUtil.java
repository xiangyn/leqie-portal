package com.leqie.portal.utils;

import java.util.regex.Pattern;

import org.springframework.util.StringUtils;


public class CommonUtil {

	private static String PHONE_PATTERN = "^1\\d{10}$";
	
	public static boolean isPhone(String phone) {
		return !StringUtils.isEmpty(phone) && Pattern.matches(PHONE_PATTERN, phone);
	}
	
}
