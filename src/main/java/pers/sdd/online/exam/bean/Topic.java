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
public abstract class Topic {
	protected String topContent;
	protected String topId;
	protected String couId;
	protected String majName;
}
