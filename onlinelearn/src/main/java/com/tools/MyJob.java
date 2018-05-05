package com.tools;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class MyJob implements Job{

	public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
       try{
		JobDataMap map=jobExecutionContext.getJobDetail().getJobDataMap();
       String email=map.getString("email");
       String content=map.getString("content");
       String title=map.getString("title");
       final Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
       // 邮件传输的协议
       props.put("mail.transport.protocol", "smtp");
       // 发送人
       props.put("mail.user", "nanjingpaoyuan@163.com");
       // 连接的邮件服务器
       props.put("mail.host", "smtp.163.com");
       // 访问SMTP服务时需要提供的密码
       props.put("mail.password", "huangjie");
    // 构建授权信息，用于进行SMTP进行身份验证
		Authenticator authenticator=new Authenticator(){
			  @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                // 用户名、密码
	                String userName = props.getProperty("mail.user");
	                String password = props.getProperty("mail.password");
	                return new PasswordAuthentication(userName, password);
	            }
		};
		  // 使用环境属性和授权信息，创建邮件会话
       Session mailSession = Session.getInstance(props, authenticator);
       // 创建邮件消息
       MimeMessage message = new MimeMessage(mailSession);
       // 设置发件人
       InternetAddress form = new InternetAddress(
               props.getProperty("mail.user"));
       message.setFrom(form);

       // 设置收件人
       InternetAddress to = new InternetAddress(email);
       message.setRecipient(RecipientType.TO, to);
       // 设置邮件标题
       message.setSubject(title);
       // 设置邮件的内容体
       message.setContent(content,"text/html;charset=UTF-8");
       // 发送邮件
       Transport.send(message);
       }catch(Exception e){
    	   e.printStackTrace();
       }
    }
}
