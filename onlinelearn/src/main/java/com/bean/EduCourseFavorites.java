package com.bean;


public class EduCourseFavorites {
    private Integer id;

    private Integer courseId;

    private Integer userId;

    private String addTime;
    
    private EduCourse eduCourse;

    public Integer getId() {
        return id;
    }

    public EduCourse getEduCourse() {
		return eduCourse;
	}

	public void setEduCourse(EduCourse eduCourse) {
		this.eduCourse = eduCourse;
	}

	public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}