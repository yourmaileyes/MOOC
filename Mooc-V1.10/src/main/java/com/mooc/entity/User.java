package com.mooc.entity;

import java.util.Date;

public class User {
    private String id;
    
    private String sex;

    private String phone;

    private String mail;

    private String vx;

    private String nickname;

    private String username;

    private String password;

    private String mission;

    private String buycase;

    private String mycase;

    private int collect;

    private String education;

    public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public Date getFristtime() {
		return fristtime;
	}

	public void setFristtime(Date fristtime) {
		this.fristtime = fristtime;
	}

	private Date vip;
    
    private Date fristtime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail == null ? null : mail.trim();
    }

    public String getVx() {
        return vx;
    }

    public void setVx(String vx) {
        this.vx = vx == null ? null : vx.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getMission() {
        return mission;
    }

    public void setMission(String mission) {
        this.mission = mission == null ? null : mission.trim();
    }

    public String getBuycase() {
        return buycase;
    }

    public void setBuycase(String buycase) {
        this.buycase = buycase == null ? null : buycase.trim();
    }

    public String getMycase() {
        return mycase;
    }

    public void setMycase(String mycase) {
        this.mycase = mycase == null ? null : mycase.trim();
    }

    public int getCollect() {
        return collect;
    }

    public void setCollect(int collect) {
        this.collect = collect;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    public Date getVip() {
        return vip;
    }

    public void setVip(Date vip) {
        this.vip = vip;
    }
}