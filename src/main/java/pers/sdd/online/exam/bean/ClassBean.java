package pers.sdd.online.exam.bean;

import java.sql.Date;

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
public class ClassBean {
	private String claId;
	private String claName;
	private String teaId;
	private Date createTime;
	
	private TeacherBean teacherBean;
}
