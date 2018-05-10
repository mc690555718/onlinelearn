package com.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


public class EduCourseKpoint implements Serializable{
    private Integer kpoint_Id;
    private Integer course_Id;
    private String name;
    private Integer parent_Id;
	private Date add_Time;
    private Integer sort;
    private Integer play_Count;
    private int free ;
    private String video_Url;
    private Integer teacher_Id;
    private String play_Time;
    private Integer kpoint_Type;
    private String video_Type;
    private String file_Type;
    private String content;
   

	private List<EduCourseKpoint> kpointList;
    public List<EduCourseKpoint> getKpointList() {
		return kpointList;
	}
	public void setKpointList(List<EduCourseKpoint> kpointList) {
		this.kpointList = kpointList;
	}
    public Integer getKpoint_Id() {
		return kpoint_Id;
	}
	public void setKpoint_Id(Integer kpoint_Id) {
		this.kpoint_Id = kpoint_Id;
	}
	public Integer getCourse_Id() {
		return course_Id;
	}

	public void setCourse_Id(Integer course_Id) {
		this.course_Id = course_Id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getParent_Id() {
		return parent_Id;
	}

	public void setParent_Id(Integer parent_Id) {
		this.parent_Id = parent_Id;
	}

	public Date getAdd_Time() {
		return add_Time;
	}

	public void setAdd_Time(Date add_Time) {
		this.add_Time = add_Time;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getPlay_Count() {
		return play_Count;
	}

	public void setPlay_Count(Integer play_Count) {
		this.play_Count = play_Count;
	}


	public int getFree() {
		return free;
	}
	public void setFree(int free) {
		this.free = free;
	}
	public String getVideo_Url() {
		return video_Url;
	}

	public void setVideo_Url(String video_Url) {
		this.video_Url = video_Url;
	}

	public Integer getTeacher_Id() {
		return teacher_Id;
	}

	public void setTeacher_Id(Integer teacher_Id) {
		this.teacher_Id = teacher_Id;
	}

	public String getPlay_Time() {
		return play_Time;
	}

	public void setPlay_Time(String play_Time) {
		this.play_Time = play_Time;
	}

	public Integer getKpoint_Type() {
		return kpoint_Type;
	}

	public void setKpoint_Type(Integer kpoint_Type) {
		this.kpoint_Type = kpoint_Type;
	}

	public String getVideo_Type() {
		return video_Type;
	}

	public void setVideo_Type(String video_Type) {
		this.video_Type = video_Type;
	}

	public String getFile_Type() {
		return file_Type;
	}

	public void setFile_Type(String file_Type) {
		this.file_Type = file_Type;
	}

	public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}