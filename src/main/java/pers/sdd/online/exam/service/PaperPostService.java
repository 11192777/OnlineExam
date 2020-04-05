package pers.sdd.online.exam.service;

import java.util.ArrayList;

import pers.sdd.online.exam.bean.PaperPostBean;

public interface PaperPostService {

	void insertPostPaper(PaperPostBean post);

	ArrayList<PaperPostBean> queryExamByStudentId(String studentId);

}
