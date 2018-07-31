package com.ssh.controller.base;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.ssh.tools.EmailUtil;


public class BaseController {

	// 输出JSON化的content
	public void printJSON(Object content, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		req.setCharacterEncoding("UTF-8");
		rsp.setCharacterEncoding("UTF-8");
		PrintWriter out = rsp.getWriter();
		out.print(JSON.toJSONString(content));
		out.flush();
		out.close();
	}

	// 输出非JSON化的content
	public void print(Object content, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		req.setCharacterEncoding("UTF-8");
		rsp.setCharacterEncoding("UTF-8");
		PrintWriter out = rsp.getWriter();
		out.print(content.toString().trim());
		out.flush();
		out.close();
	}
	
	//发送邮件
	public boolean sendemail(String emailaddress,String title,String contents){
		String html = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">"+
				"<html>"+
				"  <head>"+
				"    <base href=\"<%=basePath%>\">"+
				"    "+
				"    <title>您好</title>"+
				"	<meta http-equiv=\"pragma\" content=\"no-cache\">"+
				"	<meta http-equiv=\"cache-control\" content=\"no-cache\">"+
				"	<meta http-equiv=\"expires\" content=\"0\">    "+
				"	<meta http-equiv=\"keywords\" content=\"keyword1,keyword2,keyword3\">"+
				"	<meta http-equiv=\"description\" content=\"This is my page\">"+
				"	<!--"+
				"	<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">"+
				"	-->"+
				"  </head>"+
				"  "+
				"  <body>"+contents+
				/*"        <p>你好呀!</p>"+
				"        <p>我在进行测试邮件！收到QQ回复下~~</p>"+*/
				"  </body>"+
				"</html>";
		try {
			EmailUtil.send(emailaddress,title,html,null,null);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
