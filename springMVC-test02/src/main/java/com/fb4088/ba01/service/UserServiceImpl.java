package com.fb4088.ba01.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.fb4088.ba01.dao.UserDao;
import com.fb4088.ba01.domain.Student;
import com.fb4088.ba01.domain.User;
@Component(value = "userservice")
public class UserServiceImpl implements UserService{
	@Autowired
	@Qualifier(value = "userDao")
	private UserDao userDao;
	@Override
	public User checkUser(String name) {
		
		User user = userDao.selectByName(name);	
		
		return user;
	}
	@Override
	public Integer registUser(User user) {
		Integer num=userDao.insertUser(user);
		return num;
	}
	
}
