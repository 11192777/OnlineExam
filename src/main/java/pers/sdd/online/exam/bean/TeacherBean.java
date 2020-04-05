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
public class TeacherBean {
	private String userId;
	private String teaName;
	private String teaSex;
	private String teaMajor;
	private Integer teaAge;
	private String teaPhone;
}
