package pers.sdd.online.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import pers.sdd.online.exam.bean.PaperBean;
import pers.sdd.online.exam.dao.PaperDao;
import pers.sdd.online.exam.service.PaperService;

@Service
public class PaperServiceImpl implements PaperService{

	@Autowired
	private PaperDao paperDao;
	
	@Override
	public Integer insertPaper(PaperBean paper) {
		return paperDao.insertPaper(paper);
	}

	@Override
	public List<PaperBean> queryPaperList() {
		return paperDao.queryPaperList();
	}

	@Override
	public List<PaperBean> queryPaperListByParamer(String majorName, Integer courseName) {
		return paperDao.queryPaperListByParamer(majorName, courseName);
	}

	@Override
	public void deletePaperById(Integer paperId) {
		paperDao.deletePaperById(paperId);
	}

	@Override
	public void updateIncrementId() {
		paperDao.updateIncrementId();
	}

	@Override
	public Integer queryCourseTotal() {
		return paperDao.queryCourseTotal();
	}

	@Override
	public void alterAutoIncrementId(Integer startId) {
		paperDao.alterAutoIncrementId(startId);
	}

	@Override
	public PaperBean queryPaperById(Integer paperId) {
		return paperDao.queryPaperById(paperId);
	}

}
