package com.mooc.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.mooc.entity.Ipset;
import com.mooc.mapper.IpsetMapper;
/**
 * 过滤器，过滤封禁的IP
 * @author 杨祺晖
 *
 */
public class MoocInterceptor implements HandlerInterceptor{
	@Autowired
	IpsetMapper ipsetMapper;

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("进入：afterCompletion()");
		Ipset ipset =ipsetMapper.selectip(arg0.getRemoteAddr());
		Date date =new Date();
		ipset.setTotime(date);
		ipsetMapper.updateByPrimaryKeySelective(ipset);
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("进入：postHandle()");
		Ipset ipset =ipsetMapper.selectip(arg0.getRemoteAddr());
		if(ipset==null) {
			ipset = new Ipset();
			ipset.setIp(arg0.getRemoteAddr());
			ipsetMapper.insert(ipset);
		}
		
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("进入：preHandle()");
		Ipset ipset =ipsetMapper.selectip(arg0.getRemoteAddr());
		Date date = new Date();
		SimpleDateFormat sdf=new  SimpleDateFormat("yyyy年MM月d日 HH:mm:ss");
		if(ipset!=null&&ipset.getType()!=null&&ipset.getType().equals("1")) {
			arg1.setHeader("Content-Type", "text/html;charset=UTF-8");
			arg1.getWriter().write("<h1 style='text-align:center;color:red;padding-top:300px;'>您的IP已经被封禁！<br>封禁原因："+ipset.getMark()
			+"<br>封禁时间到:"+sdf.format(ipset.getBantime())+"</h1>");
			if(date.getTime()>ipset.getBantime().getTime()) {
				ipset.setType("0");
				ipsetMapper.updateByPrimaryKeySelective(ipset);
				return true;
			}
			return false;
		}
		return true;
	}

}
