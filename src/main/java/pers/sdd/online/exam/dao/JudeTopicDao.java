package pers.sdd.online.exam.dao;

import java.util.List;

import pers.sdd.online.exam.bean.JudeTopicBean;

public interface JudeTopicDao {

	void insertJudeTopic(JudeTopicBean topicBean);

	List<JudeTopicBean> queryTopicList(String majorName, Integer courseId);

	void deleteTopicById(Integer topicId);

	Integer queryCourseTotal();

	void alterAutoIncrementId(Integer i);

	void updateIncrementId();

	JudeTopicBean queryTopicById(Integer topicId);

}
