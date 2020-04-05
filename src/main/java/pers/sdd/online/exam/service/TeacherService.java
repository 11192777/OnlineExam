package pers.sdd.online.exam.service;

import java.util.List;

import pers.sdd.online.exam.bean.TeacherBean;

public interface TeacherService {


	void insertTeacher(TeacherBean teacher);


	List<TeacherBean> queryTeacherList();

	List<TeacherBean> queryFuzzyTeacherList(String fuzzyQueryStringDeal);

	void deleteTeacherById(String userId);


	TeacherBean queryTeacherById(String teaId);

}
