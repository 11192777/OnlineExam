package pers.sdd.online.exam.service;

import java.util.ArrayList;
import java.util.HashMap;

import pers.sdd.online.exam.bean.GradeBean;

public interface GradeService {


	void insertGrade(HashMap<String, Object> hash);

	ArrayList<GradeBean> queryGrade(String studentId);

	ArrayList<GradeBean> queryAllGrade();

}
