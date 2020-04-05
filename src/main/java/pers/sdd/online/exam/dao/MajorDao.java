package pers.sdd.online.exam.dao;

import java.util.List;
import java.util.Map;


import pers.sdd.online.exam.bean.MajorBean;

public interface MajorDao {

	List<MajorBean> queryMajorList();

	void insertMajor(MajorBean major);

	void deleteMajorByName(String majorName);
	
	void updateMajorByName(Map<String, Object> paramMap);


}
