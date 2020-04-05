package pers.sdd.online.exam.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.TeacherPaper;
import pers.sdd.online.exam.dao.TeacherPaperDao;
import pers.sdd.online.exam.service.TeacherPaperService;

@Service
public class TeacherPaperServiceImpl implements TeacherPaperService{

	@Autowired
	private TeacherPaperDao teacherPaperDao;
	
	@Override
	public void insertRef(TeacherPaper ref) {
		teacherPaperDao.insertRef(ref);
	}

	@Override
	public ArrayList<TeacherPaper> queryPaperListByTeaId(String teacherId) {
		return teacherPaperDao.queryPaperListByTeaId(teacherId);
	}

	@Override
	public void deleteRef(TeacherPaper ref) {
		teacherPaperDao.deleteRef(ref);
	}

}
