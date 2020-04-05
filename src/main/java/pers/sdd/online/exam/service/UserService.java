package pers.sdd.online.exam.service;


import pers.sdd.online.exam.bean.UserBean;

public interface UserService {
	
	UserBean queryUserById(String userId);

	void insertUser(UserBean user);

	UserBean vertifyLoginUser(UserBean user);

	void deleteUserById(String userId);

	
}
