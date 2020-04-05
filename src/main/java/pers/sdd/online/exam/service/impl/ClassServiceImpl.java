package pers.sdd.online.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.ClassBean;
import pers.sdd.online.exam.dao.ClassDao;
import pers.sdd.online.exam.service.ClassService;

@Service
public class ClassServiceImpl implements ClassService{

	@Autowired
	private ClassDao classDao;
	
	@Override
	public List<ClassBean> queryClassList() {
		return classDao.queryClassList();
	}

	@Override
	public void insertClass(ClassBean insertClass) {
		classDao.insertClass(insertClass);
	}

	@Override
	public List<ClassBean> queryClassListByTeacherId(String teacherId) {
		return classDao.queryClassListByTeacherId(teacherId);
	}

	@Override
	public ClassBean queryClassByClassId(String classId) {
		return classDao.queryClassByClassId(classId);
	}

	@Override
	public void deleteClassById(String classId) {
		classDao.deleteClassById(classId);
	}

	@Override
	public void updateClass(ClassBean newClass) {
		classDao.updateClass(newClass);
	}

}
