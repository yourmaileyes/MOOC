package com.gdp.mooc.controller;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdp.mooc.biz.*;
import com.gdp.mooc.entity.Course;
import com.gdp.mooc.entity.Log;
import com.gdp.mooc.entity.Review;
import com.gdp.mooc.entity.User;
import com.gdp.mooc.util.DateUtil;
import com.gdp.mooc.util.NubmerToJpgUtil;
import com.gdp.mooc.util.UploadFile;
@Controller
public class MainController {
	@Autowired
	UserBiz userBiz;
	@Autowired
	CourseBiz courseBiz;
	@Autowired
	ReviewBiz reviewBiz;
	@Autowired
	MessageBiz messageBiz;
	@Autowired
	LogBiz logBiz;
	public void setlog(User loginUser, String ip, String type) {
		Log log = new Log();
		log.setUserid(loginUser.getId());
		log.setUsername(loginUser.getUsername());
		log.setIp(ip);
		log.setType(type);
		logBiz.insert(log);
	}
	@RequestMapping(value = "varcodecheck")//验证码验证
	public void varcodecheck(String varcode,HttpSession session,HttpServletResponse res) throws IOException {
		res.setCharacterEncoding("utf-8");
		PrintWriter pw = res.getWriter();
		String var = (String) session.getAttribute("varcodenumber");
		if(!var.equals(varcode)){
			pw.write("0");
		}
	}
	
	@RequestMapping(value = "changevarcode")//更换验证码，验证码显示
	public void changevarcode(HttpSession session,HttpServletResponse res) throws IOException {

		/*String url=req.getServletContext().getRealPath("/varcodeimg")+"\\"+varcodeurl+".jpg";*/
		
		//验证码生成  varcodenumber为验证码的值
		/* url=req.getServletContext().getRealPath("/varcodeimg")+"\\"+varcodeurl+".jpg";*/
		//写出到response的输出流中
		String varcodenumber = NubmerToJpgUtil.NumberToJpgUtil(res.getOutputStream());
		session.setAttribute("varcodenumber",varcodenumber);
		
	}
		
	@RequestMapping(value = "admin")//管理员登录入口
	public String admin(HttpSession session) {
		return "loginadmin";
	}

	@RequestMapping(value = "index")
	public String index(HttpSession session,HttpServletRequest req) {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Course> freecourses = courseBiz.freeCourse();
		List<Course> vipcourses = courseBiz.vipCourse();
		session.setAttribute("freecourses", freecourses);
		session.setAttribute("vipcourses", vipcourses);
		return "index";
	}

	@RequestMapping(value = "subreview")
	// 提交评论
	public String subreview(HttpSession session, Review review,HttpServletRequest req) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "login";
		}
		int vip ;
		if(loginUser.getVip()!=null){
			vip=1;
		}else{
			vip=0;
		}
		Course course = new Course();
		course.setId(review.getCourseid());
		course.setLabel(reviewBiz.avglable(review.getCourseid()));
		courseBiz.updateByPrimaryKeySelective(course);
		review.setVip(vip);
		review.setSex(loginUser.getSex());
		review.setReviewid(DateUtil.getId());
		review.setUsername(loginUser.getUsername());
		reviewBiz.insert(review);
		setlog(loginUser, req.getRemoteAddr(), "发表评论，在'"+courseBiz.selectByPrimaryKey(review.getCourseid()).getName() +"'");
		return "redirect:coursevideo.do?courseid=" + review.getCourseid();

	}

	@RequestMapping(value = "review")
	// 查看评论
	public String review(HttpSession session, int courseid) {
		List<Review> reviews = reviewBiz.select(courseid);
		session.setAttribute("reviews", reviews);
		return "redirect:coursevideo.do";
	}

	@RequestMapping(value = "coursesearch")
	// 查找课程
	public String coursesearch(HttpSession session, String search, Map map) {
		System.out.println(search);
		List<Course> courses = courseBiz.coursesearch(search);
		map.remove(courses);
		map.put("courses", courses);
		map.put("search", search);
		return "courseindex";
	}
	
	
	
	/*@RequestMapping(value="testfile")
	public String testfile(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		if(!UploadFile.uploadFile("20",request)) {
			session.setAttribute("message", "上传失败！");
		}
		session.setAttribute("message", "上传成功！");
		return "message";
	}*/
   
  
}
