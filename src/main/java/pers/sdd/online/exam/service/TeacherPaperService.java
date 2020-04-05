package pers.sdd.online.exam.service;

import java.util.ArrayList;

import pers.sdd.online.exam.bean.TeacherPaper;

public interface TeacherPaperService {

	void insertRef(TeacherPaper ref);

	ArrayList<TeacherPaper> queryPaperListByTeaId(String teacherId);

	void deleteRef(TeacherPaper ref);

}
