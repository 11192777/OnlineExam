package pers.sdd.online.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.JudeTopicBean;
import pers.sdd.online.exam.dao.JudeTopicDao;
import pers.sdd.online.exam.service.JudeTopicService;

@Service
public class JudeTopicServiceImpl implements JudeTopicService{
	
	@Autowired
	private JudeTopicDao judeTopicDao;

	@Override
	public void insertJudeTopic(JudeTopicBean topicBean) {
		judeTopicDao.insertJudeTopic(topicBean);
	}

	@Override
	public List<JudeTopicBean> queryTopicList(String majorName, Integer courseId) {
		return judeTopicDao.queryTopicList(majorName, courseId);
	}

	@Override
	public void deleteTopicById(Integer topicId) {
		judeTopicDao.deleteTopicById(topicId);
	}

	@Override
	public Integer queryCourseTotal() {
		return judeTopicDao.queryCourseTotal();
	}

	@Override
	public void alterAutoIncrementId(Integer i) {
		judeTopicDao.alterAutoIncrementId(i);
	}

	@Override
	public void updateIncrementId() {
		judeTopicDao.updateIncrementId();
	}

	@Override
	public JudeTopicBean queryTopicById(Integer topicId) {
		return judeTopicDao.queryTopicById(topicId);
	}

}
