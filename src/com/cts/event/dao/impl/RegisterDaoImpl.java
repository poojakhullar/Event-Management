package com.cts.event.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.cts.event.bean.Event;
import com.cts.event.dao.RegisterDao;
import com.cts.event.entity.RegisterPO;

@Repository
public class RegisterDaoImpl extends AbstractDao implements RegisterDao{

	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : registerUser
	 * Description : This method is used to register a user for event 
	 * @author :
	 * @return : boolean	
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@Override
	public boolean registerUser(RegisterPO registerPO) throws Exception {
		
		if(verifyUserId(registerPO)==false){
			return false;
		}
		Session session = getSession();
		session.beginTransaction();
		session.save(registerPO);
		session.getTransaction().commit();
		session.close();
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean verifyUserId(RegisterPO registerPO) throws Exception {

		Session session = getSession();
		String queryString ="from RegisterPO where userId=:userId and eventId=:eventId";
		Query query = session.createQuery(queryString);
		query.setParameter("userId", registerPO.getUserId());
		query.setParameter("eventId", registerPO.getEventId());
		List<RegisterPO> list = query.list();
		session.close();
		if(list!=null && list.size()>0){
			return false;
		}
		return true;
	}

	/**
	 * ------------------------------------------------------------------------
	 * Function name : fetchTicketCount
	 * Description : This method is used to fetch ticket count
	 * @author : event
	 * @return : event	
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@Override
	public Event fetchTicketCount(Event event) throws Exception {
		Session session = getSession();		
		String eventQuery = "from RegisterPO where eventId=:eventId";
		Query query = session.createQuery(eventQuery);
		query.setParameter("eventId", event.getEventId());
		event.setTicketCount(query.list().size());		
		return null;
	}

}
