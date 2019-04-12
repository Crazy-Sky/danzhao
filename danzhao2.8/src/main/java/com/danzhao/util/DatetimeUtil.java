package com.danzhao.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DatetimeUtil {
	 public static String getnowtime() {
		 Date date = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time = sdf.format(date);
//		 System.out.println(time);
		 return time;
	}
	
	 public static String getNowTimeInFile() {
		 Date date = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		 sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		 String time = sdf.format(date);
//		 System.out.println(time);
		 return time;
	}
	 
	public static Date getNowTimeOfDate() throws ParseException {
		 Date date = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time = sdf.format(date);
		 Date utilDate = sdf.parse(time);
//		 System.out.println(time);
		 return utilDate;
	}
	
	public static String DateToString(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(date);
		return dateString;
	}
}
