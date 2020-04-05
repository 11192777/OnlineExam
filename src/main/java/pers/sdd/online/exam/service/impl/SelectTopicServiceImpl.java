package pers.sdd.online.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.SelectTopicBean;
import pers.sdd.online.exam.dao.SelectTopicDao;
import pers.sdd.online.exam.service.SelectTopicService;

@Service
public class SelectTopicServiceImpl implements SelectTopicService {

	@Autowired
	private SelectTopicDao selectTopicDao;

	@Override
	public void insertSelectTopic(SelectTopicBean topicBean) {
		selectTopicDao.insertSelectTopic(topicBean);
	}


	@Override
	public List<SelectTopicBean> queryTopicList(String majorName, Integer courseId) {
		return selectTopicDao.queryTopicList(majorName, courseId);
	}


	@Override
	public void deleteTopicById(Integer topicId) {
		selectTopicDao.deleteTopicById(topicId);
	}


	@Override
	public void updateIncrementId() {
		selectTopicDao.updateIncrementId();
	}


	@Override
	public Integer queryCourseTotal() {
		return selectTopicDao.queryCourseTotal();
	}


	@Override
	public void alterAutoIncrementId(Integer i) {
		selectTopicDao.alterAutoIncrementId(i);
	}


	@Override
	public SelectTopicBean queryTopicById(Integer topicId) {
		return selectTopicDao.queryTopicById(topicId);
	}

}
