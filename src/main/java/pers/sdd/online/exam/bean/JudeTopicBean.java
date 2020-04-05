package pers.sdd.online.exam.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Data
public class JudeTopicBean {
	public static final String TOPIC_NAME = "judge";
	private String topId;
	private String topContent;
	private Boolean result;
	private Integer couId;
	private String majName;

	public JudeTopicBean(String topContent, Boolean result) {
		this.topContent = topContent;
		this.result = result;
	}
}
