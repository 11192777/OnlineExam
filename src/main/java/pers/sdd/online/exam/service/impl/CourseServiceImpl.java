package pers.sdd.online.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.CourseBean;
import pers.sdd.online.exam.dao.CourseDao;
import pers.sdd.online.exam.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseDao courseDao;
	
	@Override
	public List<CourseBean> queryCourseList() {
		return courseDao.queryCourseList();
	}


	@Override
	public void insertCourse(CourseBean insertCouse) {
		courseDao.insertCourse(insertCouse);
	}


	@Override
	public CourseBean queryCourseByNameAndMajor(CourseBean course) {
		return courseDao.queryCourseByNameAndMajor(course);
	}


	@Override
	public void deleteCourseById(String courseId) {
		courseDao.deleteCourseById(courseId);
	}


	@Override
	public void updateCourse(CourseBean course) {
		courseDao.updateCourse(course);
	}


	@Override
	public List<CourseBean> queryCourseByMajorName(String majorName) {
		return courseDao.queryCourseByMajorName(majorName);
	}


	@Override
	public CourseBean queryCourseById(Integer couId) {
		return courseDao.queryCourseById(couId);
	}


	@Override
	public void updateIncrementId() {
		courseDao.updateIncrementId();
	}


	@Override
	public Integer queryCourseTotal() {
		return courseDao.queryCourseTotal();
	}


	@Override
	public void alterAutoIncrementId(Integer startId) {
		courseDao.alterAutoIncrementId(startId);
	}

}
