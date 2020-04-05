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
public class PaperPostBean {

	private Integer papId;
	private String papTitle;
	private Integer examTime;
	private Timestamp startTime;
	private Timestamp endTime;
	private String teaId;
	private String claId;
	
	private TeacherBean teacher;
}
