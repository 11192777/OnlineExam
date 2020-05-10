package pers.sdd.online.exam.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.GradeBean;
import pers.sdd.online.exam.dao.GradeDao;
import pers.sdd.online.exam.service.GradeService;

@Service
public class GradeServiceImpl implements GradeService{

	@Autowired
	private GradeDao gradeDao;
	

	@Override
	public void insertGrade(HashMap<String, Object> hash) {
		// TODO Auto-generated method stub
		gradeDao.insertGrade(hash);
	}




	@Override
	public ArrayList<GradeBean> queryGrade(String studentId) {
		return gradeDao.queryGrade(studentId);
	}



	@Override
	public ArrayList<GradeBean> queryAllGrade() {
		// TODO Auto-generated method stub
		return gradeDao.queryAllGrade();
	}

}
