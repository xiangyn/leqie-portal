package com.leqie.portal.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static String format(Date date, String format) {
		return new SimpleDateFormat(format).format(date);
	}
	
}
