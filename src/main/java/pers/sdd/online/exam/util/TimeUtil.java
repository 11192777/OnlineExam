package pers.sdd.online.exam.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class TimeUtil {

	public static final String DATE_FORMAT_MS = "yyyy-MM-dd HH:mm:ss";
	public static final String DATE_FORMAT_MS_SSS = "yyyy-MM-dd HH:mm:ss.SSS";

	public static String timeSplitMs(Timestamp time, String format) {

		DateFormat sdf = new SimpleDateFormat(format);

		if (time != null) {
			return sdf.format(time);
		}

		return null;
	}

	public static long timestampToLong(String time, String format) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.parse(time).getTime();
	}
}
