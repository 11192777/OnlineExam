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
public class CourseBean {
	
	private Integer couId;
	private String couName;
	private String couMajor;
	private Date couUpdate;
	
}
