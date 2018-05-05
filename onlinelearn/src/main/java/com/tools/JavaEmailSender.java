package com.tools;

import java.util.Date;
import java.util.Properties;
 
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.bean.Edu_Emailesend_History;
import com.sun.mail.util.MailSSLSocketFactory;


public class JavaEmailSender {
	
	 public static void sendEmail(Edu_Emailesend_History email)throws Exception{
		    Properties props = new Properties();
		 
		    // 开启debug调试
		    props.setProperty("mail.debug", "true");
		    // 发送服务器需要身份验证
		    props.setProperty("mail.smtp.auth", "true");
		    // 设置邮件服务器主机名
		    props.setProperty("mail.host", "smtp.qq.com");
		    // 发送邮件协议名称
		    props.setProperty("mail.transport.protocol", "smtp");
		 
		    /**SSL认证，注意腾讯邮箱是基于SSL加密的，所有需要开启才可以使用**/
		    MailSSLSocketFactory sf = new MailSSLSocketFactory();
		    sf.setTrustAllHosts(true);
		    props.put("mail.smtp.ssl.enable", "true");
		    props.put("mail.smtp.ssl.socketFactory", sf);
		 
		    //创建会话
		    Session session = Session.getInstance(props);
		 
		    //发送的消息，基于观察者模式进行设计的
		    Message msg = new MimeMessage(session);
		    msg.setSubject(email.getTitle());
		    //使用StringBuilder，因为StringBuilder加载速度会比String快，而且线程安全性也不错
		    StringBuilder builder = new StringBuilder();
		    builder.append("\n"+email.getContent());
		    builder.append("\n时间 " + new Date());
		    msg.setText(builder.toString());
		    msg.setFrom(new InternetAddress("298185161@qq.com"));
		 
		    Transport transport = session.getTransport();
		    transport.connect("smtp.qq.com", "298185161@qq.com", "domaeieeytlabjfg");
		    //发送消息
		    transport.sendMessage(msg, new Address[] { new InternetAddress(email.getEmail()) });
		    transport.close();
		  }

}
