package pers.sdd.online.exam.dao;

import java.util.List;

import pers.sdd.online.exam.bean.CourseBean;

public interface CourseDao {

	List<CourseBean> queryCourseList();

	void insertCourse(CourseBean insertCouse);

	CourseBean queryCourseByNameAndMajor(CourseBean course);

	void deleteCourseById(String courseId);

	void updateCourse(CourseBean course);

	List<CourseBean> queryCourseByMajorName(String majorName);

	CourseBean queryCourseById(Integer couId);
	
	void updateIncrementId();
	
	Integer queryCourseTotal();

	void alterAutoIncrementId(Integer startId);

}
