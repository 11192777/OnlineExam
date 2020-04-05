package pers.sdd.online.exam.java.bean;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pers.sdd.online.exam.bean.JudeTopicBean;
import pers.sdd.online.exam.bean.SelectTopicBean;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocalPaperBean {
	private ArrayList<SelectTopicBean> selectTopicList;
	private ArrayList<JudeTopicBean> judgeTopicList;
}
