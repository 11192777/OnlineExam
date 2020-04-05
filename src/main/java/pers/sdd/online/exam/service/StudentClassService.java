package pers.sdd.online.exam.service;

import java.util.List;

import pers.sdd.online.exam.bean.StudentClass;

public interface StudentClassService {

	List<StudentClass> queryStudentJionById(String studentId);

	void deleteRef(String studentId, String classId);

	void insertRefJoin(StudentClass refStudentClass);

	void deleteClassRef(String classId);

}
