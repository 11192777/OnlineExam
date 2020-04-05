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
public class TeacherPaper {

	private String teaId;
	private Integer papId;
	private Timestamp joinTime;
	
	PaperBean paper;
}
