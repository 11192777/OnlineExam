package pers.sdd.online.exam.dao;

import java.util.ArrayList;

import pers.sdd.online.exam.bean.TeacherPaper;

public interface TeacherPaperDao {

	void insertRef(TeacherPaper ref);

	ArrayList<TeacherPaper> queryPaperListByTeaId(String teacherId);

	void deleteRef(TeacherPaper ref);

}
