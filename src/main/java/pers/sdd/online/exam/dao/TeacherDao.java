package pers.sdd.online.exam.dao;

import java.util.List;

import pers.sdd.online.exam.bean.TeacherBean;

public interface TeacherDao {

	public List<TeacherBean> queryTeacherList();

	public void deleteTeacherById(String userId);

	public void insertTeacher(TeacherBean queryText);

	public List<TeacherBean> queryFuzzyTeacherList(String queryText);

	public TeacherBean queryTeacherById(String teaId);
}
