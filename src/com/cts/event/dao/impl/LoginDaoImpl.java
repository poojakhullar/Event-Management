package com.cts.event.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cts.event.bean.User;
import com.cts.event.dao.LoginDao;
import com.cts.event.entity.UserPO;

@Repository
public class LoginDaoImpl extends AbstractDao implements LoginDao{

	
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
	@Transactional	
	public UserPO getUserDetails(User user) throws Exception {
		
		Session session = getSession();			
		Query query = session.createQuery("from UserPO where userId=:userId");
		query.setParameter("userId", user.getUserId());
		UserPO userPO = (UserPO)query.uniqueResult();
		session.close();
		return userPO;
	}

}
