import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;

import pers.sdd.online.exam.util.TimeUtil;

public class Test {
	
	public static void main(String[] args) {
		
		long time = System.currentTimeMillis();
		
		Timestamp t = new Timestamp(time);
		System.out.println(time);
		try {
			System.out.println(TimeUtil.timestampToLong(t.toString(), TimeUtil.DATE_FORMAT_MS_SSS));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
