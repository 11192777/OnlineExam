package pers.sdd.online.exam.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Data
public class SelectTopicBean {
	public static final String TOPIC_NAME = "select";

	private Integer topId;
	private String topContent;
	private String res1;
	private String res2;
	private String res3;
	private String res4;
	private Integer resTrue;
	private Integer couId;
	private String majName;

	public SelectTopicBean(String topContent, String res1, String res2, String res3, String res4, Integer resTrue) {
		this.topContent = topContent;
		this.res1 = res1;
		this.res2 = res2;
		this.res3 = res3;
		this.res4 = res4;
		this.resTrue = resTrue;
	}

}
