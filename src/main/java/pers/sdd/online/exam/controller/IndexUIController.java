package pers.sdd.online.exam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.sdd.online.exam.ajax.bean.AjaxResult;
import pers.sdd.online.exam.bean.UserBean;
import pers.sdd.online.exam.service.UserService;
import pers.sdd.online.exam.util.MD5Util;

@Controller
@RequestMapping("index")
public class IndexUIController {

	@Autowired
	private UserService userService;
	
	
	@RequestMapping("login")
	public String login() {
		return "index/login";
	}

	@RequestMapping("register")
	public String register() {
		return "index/register";
	}

	@ResponseBody
	@RequestMapping("doRegister")
	public Object doRegister(UserBean user) {
		AjaxResult result = new AjaxResult();

		UserBean queryUser = userService.queryUserById(user.getUserId());

		if (queryUser == null){
			user.setUserPasswd(MD5Util.digest(user.getUserPasswd()));
			userService.insertUser(user);
			result.setSuccess(true);
		}else{
			result.setSuccess(false);
		}
		return result;

	}
	
	@ResponseBody
	@RequestMapping("doLogin")
	public Object doLogin(UserBean user, HttpSession session){
		AjaxResult result = new AjaxResult();
		
		user.setUserPasswd(MD5Util.digest(user.getUserPasswd()));
		UserBean queryUser = userService.vertifyLoginUser(user);
		if (queryUser == null){
			result.setSuccess(false);
		}else{
			result.setSuccess(true);
			result.setData(queryUser.getUserType());
			session.setAttribute("loginUser", queryUser);
		}
		
		return result;
	}
}
