package com.fb4088.ba01.service;

import com.fb4088.ba01.domain.User;

public interface UserService {
	User checkUser(String name);
	Integer registUser(User user);
}
