package pers.sdd.online.exam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.sdd.online.exam.bean.UserBean;
import pers.sdd.online.exam.dao.UserDao;
import pers.sdd.online.exam.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public UserBean queryUserById(String userId) {
		return userDao.queryUserById(userId);
	}

	@Override
	public void insertUser(UserBean user) {
		userDao.insertUser(user);
	}

	@Override
	public UserBean vertifyLoginUser(UserBean user) {
		return userDao.vertifyLoginUser(user);
	}

	@Override
	public void deleteUserById(String userId) {
		userDao.deleteUserById(userId);
	}

}
