package pers.sdd.online.exam.dao;

import java.util.List;

import pers.sdd.online.exam.bean.StudentClass;

public interface StudentClassDao {

	List<StudentClass> queryStudentJionById(String studentId);

	void deleteRef(String studentId, String classId);

	void insertRefJoin(StudentClass refStudentClass);

	void deleteClassRef(String classId);

}
