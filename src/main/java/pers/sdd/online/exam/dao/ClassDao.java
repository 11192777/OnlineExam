package pers.sdd.online.exam.dao;

import java.util.List;


import pers.sdd.online.exam.bean.ClassBean;

public interface ClassDao {

	List<ClassBean> queryClassList();

	void insertClass(ClassBean insertClass);

	List<ClassBean> queryClassListByTeacherId(String teacherId);

	ClassBean queryClassByClassId(String classId);

	void deleteClassById(String classId);

	void updateClass(ClassBean newClass);

}
