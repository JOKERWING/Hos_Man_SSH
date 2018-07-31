package com.ssh.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.controller.base.BaseController;
import com.ssh.service.RoleService;



@Controller
@RequestMapping("/HosMan")
public class RoleController extends BaseController {
	
	@Autowired
	private RoleService roleservice;

	@RequestMapping("/getlistrole")
	public void getlistrole(HttpServletRequest req, HttpServletResponse rsp) throws IOException{
		printJSON(roleservice.getlistrole(), req, rsp);
	}
	
	@RequestMapping("/getlistroleby")
	public void getlistroleby(HttpServletRequest req, HttpServletResponse rsp) throws IOException{
		String rid=req.getParameter("rid");
		String rname=req.getParameter("rname");
		String rnamec=req.getParameter("rnamec");
		String rimformation=req.getParameter("rimformation");
		String rmaxnum=req.getParameter("rmaxnum");
		printJSON(roleservice.getlistroleby(rid,rname,rnamec,rimformation,rmaxnum), req, rsp);
	}
	
	@RequestMapping("/selrolebyid")
	public void selrolebyid(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer rid=Integer.parseInt(req.getParameter("rid"));
		printJSON(roleservice.selrolebyid(rid),req , rsp);
	}
	@RequestMapping("/selrolebyname")
	public void selrolebyname(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String rname=req.getParameter("rname");
		printJSON(roleservice.selrolebyname(rname),req , rsp);
	}
	
	@RequestMapping("/admin/delrole")
	public void delrole(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer rid=Integer.parseInt(req.getParameter("rid"));
		if(!roleservice.haverole(rid)){
			print("norole", req, rsp);
		}else{
			print(roleservice.delrole(rid), req, rsp);
		}
	}
	
	@RequestMapping("/admin/updrole")
	public void updrole(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer rid=Integer.parseInt(req.getParameter("rid"));
		String rname=req.getParameter("rname");
		String rnamec=req.getParameter("rnamec");
		String rimformation=req.getParameter("rimformation");
		Integer rmaxnum=Integer.parseInt(req.getParameter("rmaxnum"));
		print(roleservice.updrole(rid,rname,rnamec,rimformation,rmaxnum), req, rsp);
	}
	
	@RequestMapping("/admin/addrole")
	public void addrole(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		Integer rid=Integer.parseInt(req.getParameter("rid"));
		String rname=req.getParameter("rname");
		String rnamec=req.getParameter("rnamec");
		String rimformation=req.getParameter("rimformation");
		Integer rmaxnum=Integer.parseInt(req.getParameter("rmaxnum"));
		if(roleservice.selrolebyid(rid)!=null){
			print("haverole", req, rsp);
		}else{
			print(roleservice.addrole(rid,rname,rnamec,rimformation,rmaxnum), req, rsp);
		}
		
	}
}
