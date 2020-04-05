package pers.sdd.online.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.StudentBean;
import pers.sdd.online.exam.dao.StudentDao;
import pers.sdd.online.exam.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDao studentDao;
	
	@Override
	public List<StudentBean> queryStudentList() {
		return studentDao.queryStudentList();
	}

	@Override
	public void deleteStudentById(String userId) {
		studentDao.deleteStudentById(userId);
	}

	@Override
	public void insertStudent(StudentBean student) {
		studentDao.insertStudent(student);
	}

	@Override
	public List<StudentBean> queryFuzzyStudentList(String queryText) {
		return studentDao.queryFuzzyStudentList(queryText);
	}

}
