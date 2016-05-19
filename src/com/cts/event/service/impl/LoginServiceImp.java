package com.cts.event.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cts.event.bean.User;
import com.cts.event.dao.LoginDao;
import com.cts.event.entity.UserPO;
import com.cts.event.service.LoginService;

@Service
public class LoginServiceImp implements LoginService{
	
	@Autowired
	private LoginDao loginDao;

	/**
	 * ------------------------------------------------------------------------
	 * Function name : getUserDetails
	 * Description : This method is used to fetch user details 
	 * @author :
	 * @return : user
	 * @throws :
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@Override
	public User getUserDetails(User user)throws Exception {

		 UserPO userPO = loginDao.getUserDetails(user);
		 User usr = new User();
		 if(userPO!=null){			 
		 usr.setUserId(userPO.getUserId());
		 usr.setPassword(userPO.getPassword());
		 usr.setFirstName(userPO.getFirstName());
		 usr.setLastName(userPO.getLastName());
		 usr.setUserMailId(userPO.getUserMailId());
		 }
		return usr;
	}

}
