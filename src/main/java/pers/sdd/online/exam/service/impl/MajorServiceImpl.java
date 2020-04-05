package pers.sdd.online.exam.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.MajorBean;
import pers.sdd.online.exam.dao.MajorDao;
import pers.sdd.online.exam.service.MajorService;

@Service
public class MajorServiceImpl implements MajorService{

	@Autowired
	private MajorDao majorDao;
	
	
	@Override
	public List<MajorBean> queryMajorList() {
		return majorDao.queryMajorList();
	}


	@Override
	public void insertMajor(MajorBean major) {
		majorDao.insertMajor(major);
	}


	@Override
	public void deleteMajorByName(String majorName) {
		majorDao.deleteMajorByName(majorName);
	}


	@Override
	public void updateMajorByName(Map<String, Object> paramMap) {
		majorDao.updateMajorByName(paramMap);
	}


}
