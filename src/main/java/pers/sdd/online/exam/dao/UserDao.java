package pers.sdd.online.exam.dao;

import pers.sdd.online.exam.bean.UserBean;

public interface UserDao {

	UserBean queryUserById(String userId);

	void insertUser(UserBean user);

	UserBean vertifyLoginUser(UserBean user);

	void deleteUserById(String userId);

}
