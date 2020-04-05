package pers.sdd.online.exam.dao;

import java.util.ArrayList;

import pers.sdd.online.exam.bean.PaperPostBean;

public interface PaperPostDao {

	void insertPostPaper(PaperPostBean post);

	ArrayList<PaperPostBean> queryExamByStudentId(String studentId);

}
