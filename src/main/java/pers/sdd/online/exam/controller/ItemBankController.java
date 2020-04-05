package pers.sdd.online.exam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pers.sdd.online.exam.ajax.bean.AjaxResult;
import pers.sdd.online.exam.bean.CourseBean;
import pers.sdd.online.exam.bean.JudeTopicBean;
import pers.sdd.online.exam.bean.MajorBean;
import pers.sdd.online.exam.bean.SelectTopicBean;
import pers.sdd.online.exam.service.CourseService;
import pers.sdd.online.exam.service.JudeTopicService;
import pers.sdd.online.exam.service.MajorService;
import pers.sdd.online.exam.service.SelectTopicService;
import pers.sdd.online.exam.util.StringUtil;

@Controller
@RequestMapping("manager")
public class ItemBankController {

	@Autowired
	private MajorService majorService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private SelectTopicService selectTopicService;
	@Autowired
	private JudeTopicService judeTopicService;

	@RequestMapping("itemBank/itemList")
	public String itemList() {
		return "manager/itemBank/itemList";
	}

	@RequestMapping("itemBank/itemAdd")
	public String itemAdd() {
		return "manager/itemBank/itemAdd/step1";
	}

	@RequestMapping("itemBank/itemAdd/step2")
	public String itemAddStep2() {
		return "manager/itemBank/itemAdd/step2";
	}

	@RequestMapping("itemBank/itemAdd/step3")
	public String itemAddStep3() {
		return "manager/itemBank/itemAdd/step3";
	}

	@RequestMapping("itemBank/itemAdd/step4")
	public String itemAddStep4() {
		return "manager/itemBank/itemAdd/step4";
	}

	@RequestMapping("itemBank/itemAdd/judeStep2")
	public String itemAddJudeStep2() {
		return "manager/itemBank/itemAdd/judeStep2";
	}

	@RequestMapping("itemBank/itemAdd/judeStep3")
	public String itemAddJudeStep3() {
		return "manager/itemBank/itemAdd/judeStep3";
	}

	@ResponseBody
	@RequestMapping("itemBank/itemList/doItemShow")
	public Object doItemShow(Integer topicId, String topicType) {
		AjaxResult result = new AjaxResult();
		try {
			if (topicType.equals(SelectTopicBean.TOPIC_NAME)) {
				result.setData(selectTopicService.queryTopicById(topicId));
				result.setSuccess(true);
			} else if (topicType.equals(JudeTopicBean.TOPIC_NAME)) {
				result.setData(judeTopicService.queryTopicById(topicId));
			}
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("itemBank/doDeleteTopic")
	public Object doDeleteTopic(Integer topicId, String topicType) {
		AjaxResult result = new AjaxResult();

		try {
			if (topicType.equals(SelectTopicBean.TOPIC_NAME)) {
				selectTopicService.deleteTopicById(topicId);
				selectTopicService.updateIncrementId();
				selectTopicService.alterAutoIncrementId(selectTopicService.queryCourseTotal() + 1);
			} else if (topicType.equals(JudeTopicBean.TOPIC_NAME)) {
				judeTopicService.deleteTopicById(topicId);
				judeTopicService.updateIncrementId();
				judeTopicService.alterAutoIncrementId(judeTopicService.queryCourseTotal() + 1);
			} else {
				// other
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("itemBank/doPageQuery")
	public Object doPageQuery(String majorName, Integer courseId, String topicType) {
		AjaxResult result = new AjaxResult();

		try {
			if (topicType.equals(SelectTopicBean.TOPIC_NAME)) {
				List<SelectTopicBean> queryTopicList = selectTopicService.queryTopicList(majorName, courseId);
				result.setData(queryTopicList);
			} else if (topicType.equals(JudeTopicBean.TOPIC_NAME)) {
				List<JudeTopicBean> queryTopicList = judeTopicService.queryTopicList(majorName, courseId);
				result.setData(queryTopicList);
			} else {
				// other
			}
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("itemBank/itemAdd/doAddJudeItem")
	public Object doAddJudeItem(JudeTopicBean topicBean) {
		AjaxResult result = new AjaxResult();

		try {
			judeTopicService.insertJudeTopic(topicBean);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("itemBank/itemAdd/doAddSelectItem")
	public Object doAddSelectItem(SelectTopicBean topicBean) {
		AjaxResult result = new AjaxResult();

		try {
			selectTopicService.insertSelectTopic(topicBean);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("itemBank/doGetCourse")
	public Object doGetCourse(String majorName) {
		AjaxResult result = new AjaxResult();

		try {
			List<CourseBean> courseList = courseService.queryCourseByMajorName(majorName);
			result.setData(courseList);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}

		return result;
	}

	@ResponseBody
	@RequestMapping("itemBank/doGetMajor")
	public Object doGetMajor() {
		AjaxResult result = new AjaxResult();

		try {
			List<MajorBean> majorList = majorService.queryMajorList();
			result.setData(majorList);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
		}

		return result;
	}
}
