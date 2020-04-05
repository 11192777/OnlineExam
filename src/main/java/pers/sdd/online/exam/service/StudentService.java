package pers.sdd.online.exam.service;

import java.util.List;

import pers.sdd.online.exam.bean.StudentBean;

public interface StudentService {

	List<StudentBean> queryStudentList();

	void deleteStudentById(String userId);

	void insertStudent(StudentBean student);

	List<StudentBean> queryFuzzyStudentList(String queryText);
	
}
