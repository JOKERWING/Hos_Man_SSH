package com.ssh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.bean.Book;
import com.ssh.bean.Customer;
import com.ssh.controller.base.BaseController;
import com.ssh.service.CustomerService;

@Controller
@RequestMapping("/HosMan")
public class CustomerController extends BaseController {

	@Autowired
	private CustomerService customerservice;

	// 用户登录判断
	@RequestMapping("/cuslogin")
	private void login(PrintWriter out, HttpServletRequest req)
			throws UnsupportedEncodingException {
		String logid = req.getParameter("logid").trim();
		String pwd = req.getParameter("pwd").trim();
		String checkcus = customerservice.checkcustomer(logid, pwd);
		if (checkcus.equals("true")) {
			out.print("true");
			System.out.println("checkcus true");
			req.getSession().setAttribute("customerlst",
					customerservice.selcustomer(logid));
		} else if (checkcus.equals("pwdfalse")) {
			out.print("pwdfalse");
			System.out.println("checkcus  pwdfalse");
		} else if (checkcus.equals("false")) {
			out.print("false");
			System.out.println("checkcus  false");
		}
	}

	// 获得用户session
	@RequestMapping("/cussession")
	public void session(PrintWriter out, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		Object obj = req.getSession().getAttribute("customerlst");
		if (obj == null) {
			out.print("null");
			System.out.println("getcussession  null");
			return;
		}
		List<Customer> lst = (List<Customer>) obj;
		printJSON(lst, req, rsp);
		System.out.println("getcussession  have");
	}

	// 注销用户session
	@RequestMapping("/forgetlo")
	public void forgetlo(PrintWriter out, HttpServletRequest req) {
		req.getSession().removeAttribute("customerlst");
		Object obj = req.getSession().getAttribute("customerlst");
		if (obj == null) {
			out.print("true");
			System.out.println("forgetlo  true");
		} else {
			out.print("false");
			System.out.println("forgetlo  false");
		}
	}

	// 注册用户
	@RequestMapping("/regcus")
	public void regcus(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String clogid = req.getParameter("logid").trim();
		String cpwd = req.getParameter("pwd").trim();
		String cname = req.getParameter("name").trim();
		String csex = req.getParameter("sex").trim();
		String ctele = req.getParameter("tele").trim();
		String cidcard = req.getParameter("idcard").trim();
		String cemail = req.getParameter("email").trim();

		if (customerservice.selcusbylogid(clogid) == null) {
			print(customerservice.regcus(clogid, cpwd, cname, csex, ctele,
					cidcard, cemail), req, rsp);
		} else {
			print("havelogid", req, rsp);
			System.out.println("regcus  havelogid");
		}

	}

	// 获得所有用户列表
	@RequestMapping("/getlistcus")
	public void getlistcus(PrintWriter out, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
			printJSON(customerservice.getlistcustomer(), req, rsp);
	}
	
	@RequestMapping("/getlistcusby")
	public void getlistcusby(PrintWriter out, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		String cid=req.getParameter("cid");
		String clogid=req.getParameter("clogid");
		String cname=req.getParameter("cname");
		String csex=req.getParameter("csex");
		String ctele=req.getParameter("ctele");
		String cidcard=req.getParameter("cidcard");
		String cemail=req.getParameter("cemail");
		String clevel=req.getParameter("clevel");
		String clevsco=req.getParameter("clevsco");
		printJSON(customerservice.getlistcusby(cid,clogid,cname,csex,ctele,cidcard,cemail,clevel,clevsco), req, rsp);
	}

	// 根据cid删除用户
	@RequestMapping("/admin/delcus")
	public void delcus(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer cid = Integer.parseInt(req.getParameter("cid"));
		if (customerservice.havecus(cid) == false) {
			print("nocus", req, rsp);
			System.out.println("admin/delcus  nocus");
		} else {
			print(customerservice.delcus(cid), req, rsp);
		}

	}

	// 根据cid更新用户
	@RequestMapping("/admin/updcus")
	public void updcus(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer cid = Integer.parseInt(req.getParameter("cid"));
		String clogid = req.getParameter("clogid");
		String cpwd = req.getParameter("cpwd");
		String cname = req.getParameter("cname");
		String csex = req.getParameter("csex");
		String ctele = req.getParameter("ctele");
		String cidcard = req.getParameter("cidcard");
		String cemail = req.getParameter("cemail");
		String clevel = req.getParameter("clevel");
		Integer clevsco = Integer.parseInt(req.getParameter("clevsco"));
		print(customerservice.updcus(cid, clogid, cpwd, cname, csex, ctele,
				cidcard, cemail, clevel, clevsco), req, rsp);

	}

	@RequestMapping("/admin/addcus")
	public void addcus(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String clogid = req.getParameter("clogid");
		String cpwd = req.getParameter("cpwd");
		String cname = req.getParameter("cname");
		String csex = req.getParameter("csex");
		String ctele = req.getParameter("ctele");
		String cidcard = req.getParameter("cidcard");
		String cemail = req.getParameter("cemail");
		if (customerservice.selcusbylogid(clogid) == null) {
			print(customerservice.addcus(clogid, cpwd, cname, csex, ctele,
					cidcard, cemail), req, rsp);
		} else {
			print("havelogid", req, rsp);
			System.out.println("addcus  havelogid");
		}
	}

	// 根据cid查询用户
	@RequestMapping("/selcusbyid")
	public void selcusbyid(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer cid = Integer.parseInt(req.getParameter("cid"));
		printJSON(customerservice.selcusbyid(cid), req, rsp);
	}

	// 发送邮件找到密码。
	@RequestMapping("/getpwd")
	public void getpwd(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String logid = req.getParameter("logid").trim();
		List<Customer> lst = customerservice.selcustomer(logid);
		for (Customer c : lst) {
			StringBuffer contents = new StringBuffer();
			contents.append("   <p>尊敬的" + c.getCName() + "客户：<p>");
			contents.append("         <p>您的账号：" + c.getCLogid() + "  的密码为： "
					+ c.getCPwd() + "<p>");
			contents.append("         <p>请妥善保管，并记牢您的密码！<p>");
			if (sendemail(c.getCEmail(), "皇家建桥酒店密码找回", contents.toString())) {
				print(true, req, rsp);
			} else {
				print(false, req, rsp);
			}
		}
	}

}
