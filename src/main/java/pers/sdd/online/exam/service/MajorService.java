package pers.sdd.online.exam.service;

import java.util.List;
import java.util.Map;

import pers.sdd.online.exam.bean.MajorBean;

public interface MajorService {

	List<MajorBean> queryMajorList();

	void insertMajor(MajorBean major);

	void deleteMajorByName(String majorName);

	void updateMajorByName(Map<String, Object> paramMap);

}
