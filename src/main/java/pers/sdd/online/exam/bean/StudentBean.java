package pers.sdd.online.exam.bean;

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
public class StudentBean {
	private String userId;
	private String stuName;
	private String stuSex;
	private String stuMajor;
	private String stuGrade;
	private Integer stuAge;
}
