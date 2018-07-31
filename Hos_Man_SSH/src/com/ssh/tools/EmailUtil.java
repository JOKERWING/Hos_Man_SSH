package com.ssh.tools;


import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.mail.util.ByteArrayDataSource;

import com.sun.mail.util.MailSSLSocketFactory;

public class EmailUtil {
	   final static public  String HOST= "smtp.qq.com";
	   final static public  String PROTOCOL = "smtp";
	   final static public  String FROM = "joker.qc@foxmail.com";
	   final static public  String USER = "joker.qc@foxmail.com";
	   final static public  String PASSWORD = "bpndhlmaldxzichh";
	   
	 public static void send(String toAddr, String subject, String body, List<byte[]> append, List<String> nameList) throws Exception {
	        Properties props = new Properties();
	        // 开启debug调试
	        props.setProperty("mail.debug", "false");
	        // 发送服务器需要身份验证
	        props.setProperty("mail.smtp.auth", "true");
	        // 设置邮件服务器主机名
	        props.setProperty("mail.host", HOST);
	        // 发送邮件协议名称
	        props.setProperty("mail.transport.protocol", PROTOCOL);

	        MailSSLSocketFactory sf = new MailSSLSocketFactory();
	        sf.setTrustAllHosts(true);
	        props.put("mail.smtp.ssl.enable", "true");
	        props.put("mail.smtp.ssl.socketFactory", sf);

	        // 设置环境信息
	        Session session = Session.getInstance(props);

	        // 创建邮件对象
	        Message msg = new MimeMessage(session);
	        msg.setSubject(subject);
	        // 设置邮件内容
	        //msg.setText(body);
	        msg.setContent(body,"text/html;charset = utf-8");//给BodyPart对象设置内容和格式/编码方式
	        msg.setSentDate(new Date());
	        if(append != null && append.size()>0 && append.get(0) != null){
		        Multipart multi = new MimeMultipart();
		        
		        for (int i = 0; i < append.size(); i++) {
		
		            MimeBodyPart attachmentPart = new MimeBodyPart();
		            byte[] ap = append.get(i);
		            String title = "attach" + i;
		            if (nameList != null && i < nameList.size()) {
		                title = nameList.get(i);
		            }
		            DataHandler dh = new DataHandler(new ByteArrayDataSource(ap, "application/octet-stream"));
		            attachmentPart.setDataHandler(dh);
		            String encodeTitle = "attach.txt";
		            try {
		                encodeTitle = MimeUtility.encodeWord(title, "UTF-8", "B");
		                String encodeText = MimeUtility.encodeText(title, "UTF-8", "B");
		                System.out.println(encodeText);
		                System.out.println(encodeTitle);
		            } catch (UnsupportedEncodingException e) {
		                System.out.println("发送异常");
		            }
		            attachmentPart.setFileName(encodeTitle);
		            multi.addBodyPart(attachmentPart);
		
		        }
	            msg.setContent(multi);
	        }
	        // 设置发件人
	        msg.setFrom(new InternetAddress(FROM));
	        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddr));

	        Transport transport = session.getTransport();
	        // 连接邮件服务器
	        transport.connect(USER, PASSWORD);
	        // 发送邮件
	        transport.sendMessage(msg, new Address[]{new InternetAddress(toAddr)});
	        // 关闭连接
	        transport.close();
	    }

}
