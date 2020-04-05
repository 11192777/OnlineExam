package pers.sdd.online.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.StudentClass;
import pers.sdd.online.exam.dao.StudentClassDao;
import pers.sdd.online.exam.service.StudentClassService;

@Service
public class StudentClassServiceImpl implements StudentClassService{
	
	@Autowired
	private StudentClassDao studentClassDao;


	@Override
	public List<StudentClass> queryStudentJionById(String studentId) {
		return studentClassDao.queryStudentJionById(studentId);
	}

	@Override
	public void deleteRef(String studentId, String classId) {
		studentClassDao.deleteRef(studentId, classId);
	}

	@Override
	public void insertRefJoin(StudentClass refStudentClass) {
		studentClassDao.insertRefJoin(refStudentClass);
	}

	@Override
	public void deleteClassRef(String classId) {
		studentClassDao.deleteClassRef(classId);
	}

}
