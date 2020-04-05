package pers.sdd.online.exam.util;

import java.io.File;

public class FileUtil {

	public static void deleteFile(String filePath){
		File file = new File(filePath);
		file.delete();
	}
}
