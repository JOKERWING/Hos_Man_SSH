package com.ssh.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.ssh.bean.RolePrivilegeAll;
import com.ssh.controller.base.BaseController;
import com.ssh.service.RolePrivilegeService;

@Controller
@RequestMapping("/HosMan")
public class RolePrivilageController extends BaseController {

	@Autowired
	private RolePrivilegeService roleprivilegeservice;

	@RequestMapping("/selrolepriallbyrid")
	public void selrolepriallbyrid(HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		Integer rid = Integer.parseInt(req.getParameter("rid").trim());
		printJSON(roleprivilegeservice.selrolepriallbyrid(rid), req, rsp);
	}

	@RequestMapping("/selrolepriallbyrname")
	public void selrolepriallbyrname(HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		String rname = req.getParameter("rname").trim();
		printJSON(roleprivilegeservice.selrolepriallbyrname(rname), req, rsp);
	}

	@RequestMapping("/checkrolepriall")
	public void checkrolepriall(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String slogid = req.getParameter("slogid").trim();
		String pfunction = req.getParameter("flag").trim();
		print(roleprivilegeservice.havepri(slogid,pfunction), req, rsp);
	}

	@RequestMapping("/admin/updrolepri")
	public void updrolepri(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String[] pid = req.getParameter("pid").trim().split(",");
		String rname = req.getParameter("rname").trim();
		Integer rid = null;
		List<RolePrivilegeAll> lst = roleprivilegeservice
				.selrolepriallbyrname(rname);
		List<Integer> lstadd = new ArrayList<Integer>();
		for (String s : pid) {
			lstadd.add(Integer.parseInt(s));
		}
		List<Integer> lstsub = new ArrayList<Integer>();
		for (RolePrivilegeAll r : lst) {
			lstsub.add(r.getPid());
			rid = r.getRid();
		}
		Iterator<Integer> itadd = lstadd.iterator();
		while (itadd.hasNext()) {
			Integer ia = itadd.next();
			Iterator<Integer> itsub = lstsub.iterator();
			while (itsub.hasNext()) {
				Integer is = itsub.next();
				if (ia.equals(is)) {
					itadd.remove();
					itsub.remove();
					break;
				}
			}
		}
		if (lstadd.isEmpty()) {
			System.out.println("updrolepri  add  null");
		} else {
			for (Integer ia : lstadd) {
				roleprivilegeservice.addrolepri(rid, ia);
			}
		}
		if (lstsub.isEmpty()) {
			System.out.println("updrolepri  sub  null");
		} else {
			for (Integer is : lstsub) {
				roleprivilegeservice.delrolepri(rid, is);
			}
		}
		print(true, req, rsp);
	}
}
