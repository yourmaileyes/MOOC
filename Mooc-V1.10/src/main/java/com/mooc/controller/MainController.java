package com.mooc.controller;

import java.awt.FontFormatException;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mooc.biz.*;
import com.mooc.entity.Course;
import com.mooc.entity.Log;
import com.mooc.entity.Review;
import com.mooc.entity.User;
import com.mooc.util.DateUtil;
import com.mooc.util.NubmerToJpgUtil;
import com.mooc.util.UploadFile;
import com.wf.captcha.GifCaptcha;
import com.wf.captcha.utils.CaptchaUtil;
import org.springframework.web.servlet.ModelAndView;

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
	public void varcodecheck(String varcode,HttpServletRequest req,HttpServletResponse res) throws IOException {
		res.setCharacterEncoding("utf-8");
		PrintWriter pw = res.getWriter();
		/*String var = (String) session.getAttribute("varcodenumber");*/
		if(!CaptchaUtil.ver(varcode, req)){
			pw.write("0");
		}
	}
	
	@RequestMapping(value = "changevarcode")//更换验证码，验证码显示
	public void changevarcode(HttpServletRequest req,HttpServletResponse res) throws IOException, FontFormatException {

		/*String url=req.getServletContext().getRealPath("/varcodeimg")+"\\"+varcodeurl+".jpg";*/
		
		//验证码生成  varcodenumber为验证码的值
		/* url=req.getServletContext().getRealPath("/varcodeimg")+"\\"+varcodeurl+".jpg";*/
		//写出到response的输出流中
		/*String varcodenumber = NubmerToJpgUtil.NumberToJpgUtil(res.getOutputStream());
		session.setAttribute("varcodenumber",varcodenumber);*/
		//使用新的验证码
		// 设置位数
        //CaptchaUtil.out(5, req, res);
        // 设置宽、高、位数
        //CaptchaUtil.out(130, 48, 5, req, res);
        
        // 使用gif验证码
        GifCaptcha gifCaptcha = new GifCaptcha(130,48,4);
        gifCaptcha.setFont(gifCaptcha.FONT_7);
		CaptchaUtil.out(gifCaptcha,req, res);
	}
		
	@RequestMapping(value = "admin")//管理员登录入口
	public String admin(HttpSession session) {
		return "loginadmin";
	}
	
	

	@RequestMapping(value = {"index",""})
	public ModelAndView index(ModelAndView mav) {
		List<Course> freecourses = courseBiz.freeCourse();
		List<Course> vipcourses = courseBiz.vipCourse();
		mav.addObject("freecourses", freecourses);
		mav.addObject("vipcourses", vipcourses);
		mav.setViewName("index");
		return mav;
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
		return "redirect:coursevideo?courseid=" + review.getCourseid();

	}

	@RequestMapping(value = "review")
	// 查看评论
	public ModelAndView review(ModelAndView mav, int courseid) {
		List<Review> reviews = reviewBiz.select(courseid);
		mav.addObject("reviews", reviews);
		mav.setViewName("redirect:coursevideo");
		return mav;
	}

	@RequestMapping(value = "coursesearch")
	// 查找课程
	public String coursesearch(String search, Map map) {
		List<Course> courses = courseBiz.coursesearch(search);
		map.remove(courses);
		map.put("courses", courses);
		map.put("search", search);
		return "courseindex";
	}
	
	@RequestMapping("/error/{errorcode}")
	public String error(@PathVariable int errorcode) {
		String pager = "404";
		switch (errorcode) {
        case 404:
            pager = "404";
            break;
        case 500:
            pager = "500";
            break;
    }
		return pager;
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
