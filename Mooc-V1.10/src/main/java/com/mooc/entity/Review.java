package com.mooc.entity;

import java.util.Date;

public class Review {
private String reviewid;
private String context;
private String username;
private int courseid;
private Date time;
private int lable;
private String sex;
private int vip;

public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public int getVip() {
	return vip;
}
public void setVip(int vip) {
	this.vip = vip;
}
public String getReviewid() {
	return reviewid;
}
public void setReviewid(String reviewid) {
	this.reviewid = reviewid;
}
public String getContext() {
	return context;
}
public void setContext(String context) {
	this.context = context;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public int getCourseid() {
	return courseid;
}
public void setCourseid(int courseid) {
	this.courseid = courseid;
}
public Date getTime() {
	return time;
}
public void setTime(Date time) {
	this.time = time;
}
public int getLable() {
	return lable;
}
public void setLable(int lable) {
	this.lable = lable;
}
}
