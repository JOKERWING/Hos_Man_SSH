package com.ssh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.bean.Staff;
import com.ssh.controller.base.BaseController;
import com.ssh.service.StaffService;


@Controller
@RequestMapping("/HosMan")
public class StaffController extends BaseController {

	@Autowired
	private StaffService staffservice;

	// 登陆判断，session存储登陆职工的List<Staff>
	@RequestMapping("/admin/logchk")
	public void logchk(PrintWriter out, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		String slogid = req.getParameter("slogid").trim();
		String spwd = req.getParameter("spwd").trim();
		Object obj = staffservice.logchk(slogid, spwd);
		List<Staff> lst = new ArrayList<Staff>();
		if (obj.equals("nostaff")) {
			// 无用户名
			out.print("nostaff");
			System.out.println("staffcontroller logchk nostaff");
		} else if (obj.equals("pwdfalse")) {
			// 密码错误
			out.print("pwdfalse");
			System.out.println("staffcontroller logchk pwdfalse");
		} else {
			lst.add((Staff) obj);
			req.getSession().setAttribute("stafflst", lst);
			// printJSON(lst, req, rsp);
			System.out.println("staffcontroller logchk success");
		}
	}

	// 判断session，并获得值
	@RequestMapping("/admin/getses")
	public void getses(PrintWriter out, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		Object obj = req.getSession().getAttribute("stafflst");
		if (obj == null || ("").equals(obj)) {
			out.print("null");
			System.out.println("staffcontroller getses null");
		} else {
			List<Staff> lst = (List<Staff>) obj;
			printJSON(lst, req, rsp);
			System.out.println("staffcontroller getses have");
		}
	}

	// 登出并注销session，
	@RequestMapping("/admin/logout")
	public void logout(PrintWriter out, HttpServletRequest req,
			HttpServletResponse rsp) {
		req.getSession().removeAttribute("stafflst");
		Object obj = req.getSession().getAttribute("stafflst");
		if (obj == null) {
			out.print("true");
			System.out.println("staffcontroller logout true");
		} else {
			out.print("false");
			System.out.println("staffcontroller logout false");
		}
	}

	// 列出所有职工信息
	@RequestMapping("/selstabyid")
	public void selstabyid(PrintWriter out, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		String slogid = req.getParameter("slogid").trim();
		printJSON(staffservice.selstabyid(slogid), req, rsp);
	}
	
	// 删除职工信息
		@RequestMapping("/admin/delsta")
		public void delsta(PrintWriter out, HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			String slogid = req.getParameter("slogid").trim();
			if(!staffservice.havesta(slogid)){
				out.print("nostaff");
				System.out.println("staffcontroller delsta nostaff");
			}else{
				print(staffservice.delsta(slogid), req, rsp);
			}
		}
		@RequestMapping("/admin/updsta")
		public void updsta(HttpServletRequest req, HttpServletResponse rsp)
				throws IOException, ParseException {
			String slogid = req.getParameter("slogid").trim();
			String spwd = req.getParameter("spwd").trim();
			String sname = req.getParameter("sname").trim();
			String ssex = req.getParameter("ssex").trim();
			String sbirth = req.getParameter("sbirth").trim();
			String semail = req.getParameter("semail").trim();
			String stele = req.getParameter("stele").trim();
			String sidcard = req.getParameter("sidcard").trim();
			String saddress = req.getParameter("saddress").trim();
			String rname = req.getParameter("rname").trim();
			print(staffservice.updsta(slogid, spwd, sname, ssex, sbirth, semail, stele, sidcard, saddress, rname), req, rsp);
		}
		
		@RequestMapping("/admin/addsta")
		public void addsta(HttpServletRequest req, HttpServletResponse rsp)
				throws IOException, ParseException {
			String slogid = req.getParameter("slogid").trim();
			String spwd = req.getParameter("spwd").trim();
			String sname = req.getParameter("sname").trim();
			String ssex = req.getParameter("ssex").trim();
			String sbirth = req.getParameter("sbirth").trim();
			String semail = req.getParameter("semail").trim();
			String stele = req.getParameter("stele").trim();
			String sidcard = req.getParameter("sidcard").trim();
			String saddress = req.getParameter("saddress").trim();
			String rname = req.getParameter("rname").trim();
			if(staffservice.havesta(slogid)){
				print("havestaff", req, rsp);
			}else{
				print(staffservice.addsta(slogid, spwd, sname, ssex, sbirth, semail, stele, sidcard, saddress, rname), req, rsp);
			}
			
		}
		
		// 列出所有职工信息
		@RequestMapping("/getliststa")
		public void getliststa(PrintWriter out, HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			printJSON(staffservice.getliststa(), req, rsp);
		}
		
		@RequestMapping("/getliststaby")
		public void getliststaby(PrintWriter out, HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			String slogid=req.getParameter("slogid");
			String sname=req.getParameter("sname");
			String ssex=req.getParameter("ssex");
			String sbirth=req.getParameter("sbirth");
			String semail=req.getParameter("semail");
			String stele=req.getParameter("stele");
			String sidcard=req.getParameter("sidcard");
			String saddress=req.getParameter("saddress");
			String rname=req.getParameter("rname");
			printJSON(staffservice.getliststaby(slogid,sname,ssex,sbirth,semail,stele,sidcard,saddress,rname), req, rsp);
		}
}
