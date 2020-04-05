package pers.sdd.online.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.TeacherBean;
import pers.sdd.online.exam.dao.TeacherDao;
import pers.sdd.online.exam.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TeacherDao teacherDao;
	
	@Override
	public void insertTeacher(TeacherBean teacher) {
		teacherDao.insertTeacher(teacher);
	}

	@Override
	public List<TeacherBean> queryTeacherList() {
		return teacherDao.queryTeacherList();
	}

	@Override
	public List<TeacherBean> queryFuzzyTeacherList(String fuzzyQueryStringDeal) {
		return teacherDao.queryFuzzyTeacherList(fuzzyQueryStringDeal);
	}

	@Override
	public void deleteTeacherById(String userId) {
		teacherDao.deleteTeacherById(userId);
	}

	@Override
	public TeacherBean queryTeacherById(String teaId) {
		return teacherDao.queryTeacherById(teaId);
	}

}
