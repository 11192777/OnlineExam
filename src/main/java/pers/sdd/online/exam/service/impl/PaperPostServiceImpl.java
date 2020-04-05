package pers.sdd.online.exam.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.PaperPostBean;
import pers.sdd.online.exam.dao.PaperPostDao;
import pers.sdd.online.exam.service.PaperPostService;

@Service
public class PaperPostServiceImpl implements PaperPostService{

	@Autowired
	private PaperPostDao paperPostDao;

	@Override
	public void insertPostPaper(PaperPostBean post) {
		paperPostDao.insertPostPaper(post);
	}

	@Override
	public ArrayList<PaperPostBean> queryExamByStudentId(String studentId) {
		return paperPostDao.queryExamByStudentId(studentId);
	}
}
