package com.bean;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class WebTeacherBean {
	private Integer course_id;//课程编号
    private String course_name;//课程名称
    private Integer is_avaliable;//课程状态  1代表上架  2，代表下架
    private Integer subject_id;//课程专业id
    private String subject_link;//课程专业链
    private Date add_time;//添加时间
    private BigDecimal source_price;//课程原价
    private BigDecimal current_price;//课程销售价格，实际支付价格，设置为0则可免费观看
    private String title;//课程简介
    private Integer lession_num;//总课时
    private String logo;//图片路径
    private Date update_time;//最后更新时间
    private Integer page_buycount;//销售数量
    private Integer page_viewcount;//浏览数量
    private Date end_time;//有效结束时间
    private Integer losetype;//有效期类型 0 到期时间  1 按天数
    private String lose_time;//有效期 商品订单过期时间点
    private Integer sequence;//序列
    private BigDecimal course_gross_income;//该课程总共卖了多少钱
    private String context; //课程详情
    private SysSubject subject;
	public Integer getCourse_id() {
		return course_id;
	}
	public void setCourse_id(Integer course_id) {
		this.course_id = course_id;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public Integer getIs_avaliable() {
		return is_avaliable;
	}
	public void setIs_avaliable(Integer is_avaliable) {
		this.is_avaliable = is_avaliable;
	}
	public Integer getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(Integer subject_id) {
		this.subject_id = subject_id;
	}
	public String getSubject_link() {
		return subject_link;
	}
	public void setSubject_link(String subject_link) {
		this.subject_link = subject_link;
	}
	public Date getAdd_time() {
		return add_time;
	}
	public void setAdd_time(Date add_time) {
		this.add_time = add_time;
	}
	public BigDecimal getSource_price() {
		return source_price;
	}
	public void setSource_price(BigDecimal source_price) {
		this.source_price = source_price;
	}
	public BigDecimal getCurrent_price() {
		return current_price;
	}
	public void setCurrent_price(BigDecimal current_price) {
		this.current_price = current_price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getLession_num() {
		return lession_num;
	}
	public void setLession_num(Integer lession_num) {
		this.lession_num = lession_num;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public Integer getPage_buycount() {
		return page_buycount;
	}
	public void setPage_buycount(Integer page_buycount) {
		this.page_buycount = page_buycount;
	}
	public Integer getPage_viewcount() {
		return page_viewcount;
	}
	public void setPage_viewcount(Integer page_viewcount) {
		this.page_viewcount = page_viewcount;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public Integer getLosetype() {
		return losetype;
	}
	public void setLosetype(Integer losetype) {
		this.losetype = losetype;
	}
	public String getLose_time() {
		return lose_time;
	}
	public void setLose_time(String lose_time) {
		this.lose_time = lose_time;
	}
	public Integer getSequence() {
		return sequence;
	}
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
	public BigDecimal getCourse_gross_income() {
		return course_gross_income;
	}
	public void setCourse_gross_income(BigDecimal course_gross_income) {
		this.course_gross_income = course_gross_income;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public SysSubject getSubject() {
		return subject;
	}
	public void setSubject(SysSubject subject) {
		this.subject = subject;
	}
    
    

}
