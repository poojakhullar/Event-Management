package com.cts.event.service;

import com.cts.event.bean.User;

public interface LoginService {

	/**
	 * This method is used to validate login user 
	 * @param User
	 * @return user 
	 */
	public User getUserDetails(User user)throws Exception;
}
