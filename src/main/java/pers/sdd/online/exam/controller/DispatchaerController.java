package pers.sdd.online.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dispatcher")
public class DispatchaerController {

	@RequestMapping("teacher")
	public String teacher(){
		return "dispatcher/teacher";
	}
	
	@RequestMapping("manager")
	public String manager(){
		return "dispatcher/manager";
	}
	
	@RequestMapping("student")
	public String sutdent(){
		return "dispatcher/student";
	}
}
