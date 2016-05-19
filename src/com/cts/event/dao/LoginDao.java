package com.cts.event.dao;

import com.cts.event.bean.User;
import com.cts.event.entity.UserPO;

public interface LoginDao {

	/**
	 * This method is used to validate login user 
	 * @param User
	 * @return userPO 
	 */
	public UserPO getUserDetails(User user)throws Exception;
}
