package pers.sdd.online.exam.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class GradeBean {

	private String userId;
	private Integer papId;
	private String stuId;
	private String claId;
	private Integer papScore;
	private String couName;
}
