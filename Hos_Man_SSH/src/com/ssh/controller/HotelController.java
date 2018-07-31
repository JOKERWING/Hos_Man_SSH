package com.ssh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.bean.Book;
import com.ssh.bean.Hotel;
import com.ssh.bean.Hotel_Hotelimformation;
import com.ssh.controller.base.BaseController;
import com.ssh.service.HotelService;

@Controller
@RequestMapping("/HosMan")
public class HotelController extends BaseController {

	@Autowired
	private HotelService hotelservice;

	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	@RequestMapping("/test")
	public String test() {
		return "test";
	}
	
	@RequestMapping("/StudentTest")
	public String StudentTest() {
		return "StudentTest";
	}

	@RequestMapping("/test1")
	public String test1() {
		return "test1";
	}

	@RequestMapping("/test2")
	public String test2() {
		return "test2";
	}

	@RequestMapping("/map")
	public String map() {
		return "map";
	}

	@RequestMapping("/map1")
	public String map1() {
		return "map1";
	}
	
	@RequestMapping("/logintest")
	public String logintest() {
		return "logintest";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/book")
	public String book() {
		return "book";
	}

	@RequestMapping("/contact")
	public String contact() {
		return "contact";
	}

	@RequestMapping("/customer")
	public String customer() {
		return "customer";
	}

	@RequestMapping("/customerzon")
	public String customerzon() {
		return "customerzon";
	}

	@RequestMapping("/detail")
	public String detail() {
		return "detail";
	}

	@RequestMapping("/hotel")
	public String hotel() {
		return "hotel";
	}

	@RequestMapping("/hotelimformation")
	public String hotelimformation() {
		return "hotelimformation";
	}

	@RequestMapping("/pay")
	public String pay() {
		return "pay";
	}

	@RequestMapping("/register")
	public String register() {
		return "register";
	}

	@RequestMapping("/rooms")
	public String rooms() {
		return "rooms";
	}

	@RequestMapping("/forgetpwd")
	public String forgetpwd() {
		return "forgetpwd";
	}

	@RequestMapping("/admin/index")
	public String adminindex() {
		return "admin/index";
	}

	@RequestMapping("/admin/login")
	public String adminlogin() {
		return "admin/login";
	}

	@RequestMapping("/admin/indexfirst")
	public String adminindexfirst() {
		return "admin/indexfirst";
	}

	@RequestMapping("/admin/hotman")
	public String adminhotman() {
		return "admin/hotman";
	}

	@RequestMapping("/admin/hotimfman")
	public String adminhotimfman() {
		return "admin/hotimfman";
	}

	@RequestMapping("/admin/bookman")
	public String bookman() {
		return "admin/bookman";
	}

	@RequestMapping("/admin/cusman")
	public String cusman() {
		return "admin/cusman";
	}

	@RequestMapping("/admin/staman")
	public String staman() {
		return "admin/staman";
	}

	@RequestMapping("/admin/mystaman")
	public String mystaman() {
		return "admin/mystaman";
	}

	@RequestMapping("/admin/priman")
	public String priman() {
		return "admin/priman";
	}

	@RequestMapping("/admin/roleman")
	public String roleman() {
		return "admin/roleman";
	}

	@RequestMapping("/admin/rolepriman")
	public String rolepriman() {
		return "admin/rolepriman";
	}

	@RequestMapping("/admin/myrolepriman")
	public String myrolepriman() {
		return "admin/myrolepriman";
	}

	// 筛选出符合条件的客房信息
	@RequestMapping("/hotsel")
	public void hotsel(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String hiname = req.getParameter("type").trim();
		String indate = req.getParameter("indate").trim();
		String outdate = req.getParameter("outdate").trim();
		String pnum = req.getParameter("pnum").trim();
		List<Hotel_Hotelimformation> lst = hotelservice.hotsel(hiname, indate,
				outdate, pnum);
		printJSON(lst, req, rsp);
	}

	// 获得所有客房信息
	@RequestMapping("/getlisthot")
	public void getlisthotel(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		List<Hotel_Hotelimformation> lst = hotelservice.getListHotel();
		printJSON(lst, req, rsp);
	}
	
	@RequestMapping("/getlisthotby")
	public void getlisthotby(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String hid=req.getParameter("hid");
		String hname=req.getParameter("hname");
		String area1=req.getParameter("area1");
		String area2=req.getParameter("area2");
		String floor1=req.getParameter("floor1");
		String floor2=req.getParameter("floor2");
		String hiid=req.getParameter("hiid");
		printJSON(hotelservice.getlisthotby(hid,hname,area1,area2,floor1,floor2,hiid), req, rsp);
	}
	// 根据id删除客房信息
	@RequestMapping("/admin/delhot")
	public void delhot(HttpServletRequest req, HttpServletResponse rsp,
			PrintWriter out) throws IOException {
		String hid = req.getParameter("hid").trim();
		if (hotelservice.havehot(hid) == false) {
			print("nohot", req, rsp);
			System.out.println("delhot nohot");
		} else {
			if (hotelservice.delhot(hid)) {
				out.print("true");
				System.out.println("delhot  true");
			} else {
				out.print("false");
				System.out.println("delhot  false");
			}
		}
	}

	// 更新
	@RequestMapping("/admin/updhot")
	public void updhot(HttpServletRequest req, HttpServletResponse rsp,
			PrintWriter out) throws IOException {
		String hid = req.getParameter("hid").trim();
		String hname = req.getParameter("hname").trim();
		String harea = req.getParameter("harea").trim();
		String hfloor = req.getParameter("hfloor").trim();
		String hiid = req.getParameter("hiid").trim();
		if (hotelservice.updhot(hid, hname, harea, hfloor, hiid) == true) {
			out.print("true");
			System.out.println("updhot  true");
		} else {
			out.print("false");
			System.out.println("updhot  false");
		}
	}

	@RequestMapping("/selhotbyid")
	public void selhotbyid(HttpServletRequest req, HttpServletResponse rsp,
			PrintWriter out) throws IOException {
		String hid = req.getParameter("hid");
		printJSON(hotelservice.selhotbyid(hid), req, rsp);
	}

	@RequestMapping("/admin/addhot")
	public void addhot(HttpServletRequest req, HttpServletResponse rsp,
			PrintWriter out) throws IOException {
		String hid = req.getParameter("hid").trim();
		String hname = req.getParameter("hname").trim();
		String harea = req.getParameter("harea").trim();
		String hfloor = req.getParameter("hfloor").trim();
		String hiid = req.getParameter("hiid").trim();
		if(hotelservice.havehot(hid)){
			print("have", req, rsp);
		}else{
			print(hotelservice.addhot(hid, hname, harea, hfloor, hiid), req, rsp);
		}
		
	}
}
