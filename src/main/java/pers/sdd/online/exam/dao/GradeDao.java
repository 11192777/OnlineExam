package pers.sdd.online.exam.dao;

import java.util.ArrayList;
import java.util.HashMap;

import pers.sdd.online.exam.bean.GradeBean;

public interface GradeDao {



	void insertGrade(HashMap<String, Object> hash);

	ArrayList<GradeBean> queryGrade(String studentId);

	ArrayList<GradeBean> queryAllGrade();

}
