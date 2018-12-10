package com.gdp.mooc.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gdp.mooc.entity.Course;

public interface CourseBiz {
	public List<Course> selectAllCourse();
	Course selectByPrimaryKey(int id);
    int updateByPrimaryKeySelective(Course record);
    List<Course> coursesearch(String search);
    List<Course> freeCourse();
    List<Course> vipCourse();
    int deleteByPrimaryKey(String id);
    int savecourse(HttpServletRequest req);
}
