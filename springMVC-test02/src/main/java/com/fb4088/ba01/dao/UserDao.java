package com.fb4088.ba01.dao;

import com.fb4088.ba01.domain.User;

public interface UserDao {
	User selectByName(String username);
	Integer insertUser(User user);
}
