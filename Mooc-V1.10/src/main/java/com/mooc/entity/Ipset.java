package com.mooc.entity;

import java.util.Date;

public class Ipset {
private String ip;
private String type;
private String mark;
private Date firsttime;
private Date bantime;
private Date totime;
public String getIp() {
	return ip;
}
public void setIp(String ip) {
	this.ip = ip;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getMark() {
	return mark;
}
public void setMark(String mark) {
	this.mark = mark;
}
public Date getFirsttime() {
	return firsttime;
}
public void setFirsttime(Date firsttime) {
	this.firsttime = firsttime;
}
public Date getBantime() {
	return bantime;
}
public void setBantime(Date bantime) {
	this.bantime = bantime;
}
public Date getTotime() {
	return totime;
}
public void setTotime(Date totime) {
	this.totime = totime;
}
}
