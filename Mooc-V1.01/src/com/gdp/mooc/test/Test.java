package com.gdp.mooc.test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gdp.mooc.biz.CourseBiz;
import com.gdp.mooc.entity.User;
import com.gdp.mooc.mapper.UserMapper;


public class Test {
	@Autowired
	static CourseBiz cs;
	
	
   public static void ttt() {
	System.out.println(cs);
   }
   
   public static void main(String[] args) {
	ttt();
}
}
