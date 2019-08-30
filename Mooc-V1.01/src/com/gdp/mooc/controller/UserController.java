package com.gdp.mooc.controller;

/**
 * 杨祺晖
 * 2018.9.14
 * 591284209@qq.com
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdp.mooc.biz.CourseBiz;
import com.gdp.mooc.biz.LogBiz;
import com.gdp.mooc.biz.MessageBiz;
import com.gdp.mooc.biz.ReviewBiz;
import com.gdp.mooc.biz.UserBiz;
import com.gdp.mooc.entity.*;
import com.gdp.mooc.util.DateUtil;

@Controller
public class UserController {
	@Autowired
	UserBiz userBiz;
	@Autowired
	CourseBiz courseBiz;
	@Autowired
	MessageBiz messageBiz;
	@Autowired
	ReviewBiz reviewBiz;
	@Autowired
	LogBiz logBiz;

	/**
	 * 普通日志写入
	 * 
	 * @param loginUser
	 * @param ip
	 * @param type
	 */
	public void setlog(User loginUser, String ip, String type) {
		Log log = new Log();
		log.setUserid(loginUser.getId());
		log.setUsername(loginUser.getUsername());
		log.setIp(ip);
		log.setType(type);
		logBiz.insert(log);
	}

	@RequestMapping(value = "login")
	public String login(User user, HttpSession session, HttpServletRequest req) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("username", user.getUsername());
		paramMap.put("password", user.getPassword());
		User loginUser = userBiz.selectLoginUser(paramMap);
		if (loginUser == null) {
			return "login";
		}
		setlog(loginUser, req.getRemoteAddr(), "登录");
		session.setAttribute("loginUser", loginUser);
		return "redirect:course.do";
	}

	@RequestMapping(value = "logout") // 注销登出
	public String logout(String type, User user, HttpSession session, HttpServletRequest req) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		} else {
			session.invalidate();
			if (type == "admin") {
				setlog(loginUser, req.getRemoteAddr(), "管理员注销");
				return "loginadmin";
			} else
				setlog(loginUser, req.getRemoteAddr(), "注销");
			return "redirect:index.do";
		}
	}

	/*
	 * ajax密码检查
	 */
	@RequestMapping(value = "passwordcheck")
	public void selectUser(User user, HttpSession session, HttpServletResponse response, HttpServletRequest req)
			throws IOException {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("username", user.getUsername());
		paramMap.put("password", user.getPassword());
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if (userBiz.selectUser(paramMap) == 1) {
			if (!"admin".equals(userBiz.selectLoginUser(paramMap).getMission())) {
				if (userBiz.selectLoginUser(paramMap).getBuycase() != null) {
					if ("1".equals(userBiz.selectLoginUser(paramMap).getBuycase())) {
						out.println("3");// 屏蔽登录
					} else
						out.println("1");// 正常登录密码正确
				} else {
					out.println("1");
				}
			} else {
				out.println("2");// 管理员返回
			}
		} else {
			Log log = new Log();
			log.setIp(req.getRemoteAddr());
			log.setType("尝试登录账号:" + user.getUsername() + "，密码错误");
			logBiz.insert(log);
			out.println("0");//密码错误返回值
		}
	}

	@RequestMapping(value = "usercheck")
	// 注册检查
	public void Usercheck(String username, HttpSession session, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		int i = userBiz.selectUser(username);
		out.println(i);
	}

	@RequestMapping(value = "quickregist")
	// 快速注册
	public String insertUser(String varcode, User user, HttpSession session, HttpServletRequest req) {
		String id = DateUtil.getId();
		String username = user.getUsername();
		String revarcode = (String) session.getAttribute("varcodenumber");
		if (varcode == null) {
			return "redirect:course.do";
		}
		if (userBiz.selectUser(username) == 1 || !varcode.equals(revarcode)) {
			return "redirect:course.do";
		}
		user.setId(id);
		user.setMission(null);
		user.setBuycase(null);
		user.setMycase(null);
		user.setVip(null);
		userBiz.insertSelective(user);
		session.setAttribute("loginUser", user);
		setlog(user, req.getRemoteAddr(), "快速注册");
		return "redirect:course.do";
	}

	@RequestMapping(value = "regist")
	// 注册
	public String regist(String varcode, User user, HttpSession session, HttpServletRequest req) {
		String id = DateUtil.getId();
		String username = user.getUsername();
		String revarcode = (String) session.getAttribute("varcodenumber");
		if (varcode == null) {
			return "redirect:course.do";
		}
		if (userBiz.selectUser(username) == 1 || !varcode.equals(revarcode)) {
			return "redirect:course.do";
		}
		user.setId(id);
		user.setMission(null);
		user.setBuycase(null);
		user.setMycase(null);
		user.setVip(null);
		userBiz.insertSelective(user);
		setlog(user, req.getRemoteAddr(), "普通注册");
		return "redirect:course.do";
	}

	@RequestMapping(value = "showvip")
	// 会员中心
	public String showvip(HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser != null) {
			loginUser = userBiz.selectByPrimaryKey(loginUser.getId());
			session.setAttribute("loginUser", loginUser);
		}
		return "vip";
	}

	@RequestMapping(value = "mylearn")
	// 我的课程查询
	public String myCourse(HttpSession session, Map map) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		}
		List<Course> courses = new ArrayList<Course>();
		List<Message> messages = messageBiz.selectmy(loginUser.getId());
		for (int i = 0; i < messages.size(); i++) {
			int a = messages.get(i).getCourseid();
			Course course = courseBiz.selectByPrimaryKey(a);
			courses.add(course);
		}
		map.put("mycourses", courses);
		return "mylearn";

	}

	@RequestMapping(value = "course")
	// 主页课程查询
	public String Course(HttpSession session, Map map) {
		List<Course> courses = courseBiz.selectAllCourse();
		map.put("courses", courses);
		return "courseindex";

	}

	@RequestMapping(value = "coursedetail")
	// 单课程主页
	public String Courseindex(int id, HttpSession session, Map map) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		}
		Message message = new Message();
		message.setCourseid(id);
		message.setUserid(loginUser.getId());
		Message me = messageBiz.select(message);
		if (me == null) {
			map.put("isSelect", false);
		} else {
			map.put("isSelect", true);
		}
		Course course = courseBiz.selectByPrimaryKey(id);
		map.put("course", course);
		return "coursedetail";

	}

	@RequestMapping(value = "coursevideo")
	// 单课程视屏
	public String Coursevideo(int courseid, HttpSession session, Map map) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		}
		Course course = courseBiz.selectByPrimaryKey(courseid);
		if ("1".equals(course.getType())) {
			if (loginUser.getVip() == null) {
				return "vip";
			}
		}
		map.put("course", course);
		List<Review> reviews = reviewBiz.select(courseid);
		map.put("reviews", reviews);
		return "coursevideo";

	}

	@RequestMapping(value = "insertCourse")
	// 加入课程
	public void insertCourse(int courseid, String userid, HttpSession session, HttpServletRequest req,
			HttpServletResponse response) throws IOException {
		String result = "订阅成功！";
		User user = (User) session.getAttribute("loginUser");
		Course c = courseBiz.selectByPrimaryKey(courseid);
		if (user.getVip() == null && "1".equals(c.getType())) {
			result = "此课程是会员课程，请购买会员！";
		} else {
			Message message = new Message();
			message.setCourseid(courseid);
			message.setUserid(userid);
			int i = messageBiz.insert(message);
			setlog(user, req.getRemoteAddr(), "订阅课程:" + c.getName());
		}
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	@RequestMapping(value = "deleteCourse")
	// 删除课程
	public String deleteCourse(int courseid, String userid, HttpServletResponse response, HttpServletRequest req)
			throws IOException {
		Message message = new Message();
		message.setCourseid(courseid);
		message.setUserid(userid);
		PrintWriter out = response.getWriter();
		int i = messageBiz.delete(message);
		User loginUser = userBiz.selectByPrimaryKey(userid);
		Course c = courseBiz.selectByPrimaryKey(courseid);
		setlog(loginUser, req.getRemoteAddr(), "取消课程：" + c.getName());
		String result = i > 0 ? "true" : "false";
		return result;
	}

	@RequestMapping(value = "infoset")
	// 个人信息设置
	public String Infoset(User user, HttpSession session, HttpServletRequest req) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		}
		user.setCollect(loginUser.getCollect());
		List<Review> reviews = reviewBiz.selectbyuserid(loginUser.getUsername());
		for (int a = 0; a < reviews.size(); a++) {
			reviews.get(a).setSex(user.getSex());
		}
		reviewBiz.updateByPrimaryKeySelective(reviews);

		userBiz.updateByPrimaryKeySelective(user);
		Map map = new HashMap<String, String>();
		map.put("username", loginUser.getUsername());
		map.put("password", loginUser.getPassword());
		session.setAttribute("loginUser", userBiz.selectLoginUser(map));
		setlog(loginUser, req.getRemoteAddr(), "个人信息更改");
		return "redirect:course.do";

	}

	@RequestMapping(value = "vip")
	// vip购买 0为1个月，1为半年，2为一年
	public void Vip(HttpSession session, int viptype, HttpServletResponse response, HttpServletRequest req)
			throws IOException {
		String data = "已经成功充值";
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			// return "login";
		}
		List<Review> reviews = reviewBiz.selectbyuserid(loginUser.getUsername());
		int collect = loginUser.getCollect();
		boolean isvip = false;
		boolean is = true;
		Date date = new Date();
		Date vipdate = loginUser.getVip();
		if (vipdate == null) {
			is = false;
		} else if (vipdate.getTime() > date.getTime()) {
			is = false;
		}
		if (vipdate == null || is) {
			if (viptype == 0) {
				if (collect < 500) {
					data = "余额不足，请联系管理员充值！";
				} else {
					loginUser.setCollect(collect - 500);
					vipdate = new Date();
					vipdate.setMonth(vipdate.getMonth() + 1);
					loginUser.setVip(vipdate);
					isvip = true;
					setlog(loginUser, req.getRemoteAddr(), "购买会员：一个月");
				}
			} else if (viptype == 1) {
				if (Integer.valueOf(loginUser.getCollect()) < 2000) {
					data = "余额不足，请联系管理员充值！";
				} else {
					loginUser.setCollect(collect - 2000);
					vipdate = new Date();
					vipdate.setMonth(vipdate.getMonth() + 6);
					loginUser.setVip(vipdate);
					isvip = true;
					setlog(loginUser, req.getRemoteAddr(), "购买会员：半年");
				}
			} else if (viptype == 2) {
				if (collect < 3000) {
					data = "余额不足，请联系管理员充值！";
				} else {
					loginUser.setCollect(collect - 3000);
					vipdate = new Date();
					vipdate.setYear(vipdate.getYear() + 1);
					loginUser.setVip(vipdate);
					isvip = true;
					setlog(loginUser, req.getRemoteAddr(), "购买会员：一年");
				}
			}
		} else {
			if (viptype == 0) {
				if (collect < 500) {
					data = "余额不足，请联系管理员充值！";
				} else {
					loginUser.setCollect(collect - 500);
					vipdate.setMonth(vipdate.getMonth() + 1);
					loginUser.setVip(vipdate);
					isvip = true;
					setlog(loginUser, req.getRemoteAddr(), "购买会员：一个月");
				}
			} else if (viptype == 1) {
				if (collect < 2000) {
					data = "余额不足，请联系管理员充值！";
				} else {
					loginUser.setCollect(collect - 2000);
					vipdate.setMonth(vipdate.getMonth() + 6);
					loginUser.setVip(vipdate);
					isvip = true;
					setlog(loginUser, req.getRemoteAddr(), "购买会员：半年");
				}
			} else if (viptype == 2) {
				if (collect < 3000) {
					data = "余额不足，请联系管理员充值！";
				} else {
					loginUser.setCollect(collect - 3000);
					vipdate.setYear(vipdate.getYear() + 1);
					loginUser.setVip(vipdate);
					isvip = true;
					setlog(loginUser, req.getRemoteAddr(), "购买会员：一年");
				}
			}

		}
		if (isvip = true) {
			for (int a = 0; a < reviews.size(); a++) {
				reviews.get(a).setVip(1);
			}
		}
		reviewBiz.updateByPrimaryKeySelective(reviews);
		userBiz.updateByPrimaryKeySelective(loginUser);
		Map map = new HashMap<String, String>();
		map.put("username", loginUser.getUsername());
		map.put("password", loginUser.getPassword());
		session.setAttribute("loginUser", userBiz.selectLoginUser(map));

		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		out.println(data);

	}
}
