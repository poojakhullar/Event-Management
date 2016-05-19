package com.cts.event.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "EVENT_REGISTER")
public class RegisterPO {

	private String userId;
	private String firstName;
	private String lastName;
	private Integer eventId;		
	private String emailId;
	private String phone;
	
	private EventPO eventPO;
	
	/*column join*/
	@ManyToOne
	@JoinColumn(name="EVENT_ID",insertable=false,updatable=false)
	public EventPO getEventPO() {
		return eventPO;
	}
	public void setEventPO(EventPO eventPO) {
		this.eventPO = eventPO;
	}
	@Id
	@Column(name = "USER_ID")
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Column(name = "FIRST_NAME")
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	@Column(name = "LAST_NAME")
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	@Column(name = "EVENT_ID")
	public Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
	
	@Column(name = "EMAIL_ID")
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	@Column(name = "PHONE")
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}	
	
}
