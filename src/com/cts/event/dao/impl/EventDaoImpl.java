package com.cts.event.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.cts.event.dao.EventDao;
import com.cts.event.entity.EventPO;
import com.cts.event.entity.RegisterPO;

@Repository
public class EventDaoImpl extends AbstractDao implements EventDao  {

	@Override
	public boolean createEvent(EventPO eventPO) throws Exception {	
		Session session = getSession();
		session.beginTransaction();
		session.save(eventPO);
		session.getTransaction().commit();
		session.close();
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EventPO> fetchEvent(EventPO eventPO) throws Exception {
		Session session = getSession();		
		String queryString = "from EventPO ";
		/*to fetch only upcoming events*/
		if(StringUtils.equalsIgnoreCase(eventPO.getAdminFlag(), "false")){
			queryString += " where eventStartDate > current_timestamp";
		}
		/*to fetch single result*/
		if(eventPO!=null && eventPO.getEventId()!=null){
			queryString += " where eventId=:eventId";
		}
		Query query = session.createQuery(queryString);
		if(eventPO!=null && eventPO.getEventId()!=null){
			query.setParameter("eventId", eventPO.getEventId());
		}
		List<EventPO> list = query.list();			
		session.close();		
		return list;
	}

	@Override
	public List<RegisterPO> fetchParticipants() throws Exception {
		Session session = getSession();			
		Query query = session.createQuery("from RegisterPO");		
		List<RegisterPO> participantList = query.list();			
		session.close();		
		return participantList;		
	}

}
