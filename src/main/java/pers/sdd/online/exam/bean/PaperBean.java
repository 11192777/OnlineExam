package pers.sdd.online.exam.bean;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PaperBean {
	
	private Integer papId;
	private String teaId;
	private String majName;
	private Integer couId;
	private String url;
	private Timestamp createTime;
	private String paperName;
	
	private CourseBean course;
	
}
