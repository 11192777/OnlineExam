package pers.sdd.online.exam.dao;

import java.util.List;

import pers.sdd.online.exam.bean.StudentBean;

public interface StudentDao {

	public List<StudentBean> queryStudentList();

	public void deleteStudentById(String userId);

	public void insertStudent(StudentBean queryText);

	public List<StudentBean> queryFuzzyStudentList(String queryText);

}
