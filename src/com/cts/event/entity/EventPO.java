package com.cts.event.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "EVENTS")
public class EventPO{
	
	private Integer eventId;
	private String eventName;
	private String eventType;
	private Date eventStartDate;
	private Date eventEndDate;
	private Integer participants;
	private String approved;
	private String host;
	
	private String adminFlag="false";
	
	
	private List<RegisterPO> registerPO;
	
	/*column join*/
	@OneToMany(mappedBy="eventPO")
	public List<RegisterPO> getRegisterPO() {
		return registerPO;
	}
	public void setRegisterPO(List<RegisterPO> registerPO) {
		this.registerPO = registerPO;
	}
	
	@Id
	@Column(name="EVENT_ID")
	@SequenceGenerator(name = "event_sequence", sequenceName = "SEQ_EVENTID")
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "event_sequence")
	public Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
	@Column(name="EVENT_NAME")
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	@Column(name="EVENT_TYPE")
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	@Column(name="EVENT_START_DATE")
	public Date getEventStartDate() {
		return eventStartDate;
	}
	public void setEventStartDate(Date eventStartDate) {
		this.eventStartDate = eventStartDate;
	}
	@Column(name="EVENT_END_DATE")
	public Date getEventEndDate() {
		return eventEndDate;
	}
	public void setEventEndDate(Date eventEndDate) {
		this.eventEndDate = eventEndDate;
	}
	@Column(name="PARTICIPANTS")
	public Integer getParticipants() {
		return participants;
	}
	public void setParticipants(Integer participants) {
		this.participants = participants;
	}
	@Column(name = "APPROVED")
	public String getApproved() {
		return approved;
	}
	public void setApproved(String approved) {
		this.approved = approved;
	}
	@Column(name = "HOST")
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	
	/*flag to fetch event details*/
	@Transient
	public String getAdminFlag() {
		return adminFlag;
	}
	public void setAdminFlag(String adminFlag) {
		this.adminFlag = adminFlag;
	}
}
