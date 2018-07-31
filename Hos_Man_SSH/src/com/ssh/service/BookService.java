package com.ssh.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.bean.Book;
import com.ssh.dao.IBookDao;

@Transactional
@Service
public class BookService {

	@Autowired
	private IBookDao bookdaoimpl;

	// 判断订单表是否存在
	public boolean chkexistbook(Integer hid, Date indate) {
		for (Book b : getlistbook()) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(indate);
			if (hid.equals(b.getHId())
					&& date.equals(b.getBIndate().toString())) {
				System.out.println("chkexistbook  true");
				return true;
			}
		}
		System.out.println("chkexistbook  false");
		return false;
	}

	// 插入数据，并判断是否插入成功
	public boolean insertbook(Book b) {
		if (bookdaoimpl.insertbook(b) > 0) {
			System.out.println("insertbook  true");
			return true;
		} else {
			System.out.println("insertbook  false");
			return false;
		}
	}

	// 获得订单的相关数据，处理后，放入Book实体类内
	public Book dealbookdate(String hoid, String hname, String indate,
			String outdate, String pnum, String bprice1, String clogid,
			String bprepay1) throws ParseException {
		Integer hid = Integer.parseInt(hoid);
		/*
		 * Date b_indate = null; SimpleDateFormat formater = new
		 * SimpleDateFormat(); formater.applyPattern("yyyy/MM/dd");
		 * java.util.Date b_in = null; try { b_in = formater.parse(datein);
		 * b_indate = new java.sql.Date(b_in.getTime()); } catch (ParseException
		 * e) { // TODO Auto-generated catch block e.printStackTrace(); }
		 */
		Date bindate = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(indate);
		Date boutdate = (Date) new SimpleDateFormat("yyyy-MM-dd")
				.parse(outdate);
		Integer bpnum = Integer.parseInt(pnum);
		double bprice = Double.parseDouble(bprice1);
		double bprepay = Double.parseDouble(bprepay1);
		return new Book(hid, hname, bindate, boutdate, bpnum, bprice, clogid,
				bprepay);

	}

	/**
	 * 存pay的session(List形式)
	 * 
	 * @param bo
	 * @param req
	 * @return boolean
	 */
	public boolean paysesset(Book bo, HttpServletRequest req) {
		List<Book> lst=new ArrayList<Book>();
		lst.add(bo);
		req.getSession().setAttribute("paysession", lst);
		Object obj = req.getSession().getAttribute("paysession");
		if (obj != null) {
			System.out.println("paysesset  success");
			return true;
		} else {
			System.out.println("paysesset  success");
			return false;
		}
	}
	/**
	 * 获得pay的session
	 * @param req
	 * @return 如果session为空返回null 否则返回session（obj格式）
	 *//*
	public Object paysesget(HttpServletRequest req) {
		Object obj = req.getSession().getAttribute("paysession");
		if (obj == null) {
			return null;
		} else {
			return obj;
		}
	}*/
	public List<Book> paysesget(HttpServletRequest req) {
		
		return (List<Book>) req.getSession().getAttribute("paysession");
		
	}
	
	/**
	 * 移除paysession
	 * @param req
	 * @return boolean
	 */
	public boolean rempayses(HttpServletRequest req){
		req.getSession().removeAttribute("paysession");
		if (paysesget(req) == null) {
			System.out.println("paysession remove  success");
			return true;
		} else {
			System.out.println("paysession remove  fail");
			return false;
		}
	}
	
	/**
	 * 获得所有订单信息
	 * 
	 * @return List<Book>
	 */
	public List<Book> getlistbook() {
		System.out.println("getlistbook success");
		return bookdaoimpl.getlistbook();
		
	}

	/**
	 * 根据bid查询订单信息
	 * 
	 * @param bid
	 * @return List<Book> 无则返回null，否则返回List<Book>
	 */
	public List<Book> selbookbyid(Integer bid) {
		List<Book> lst=bookdaoimpl.selbookbyid(bid);
		if(lst.isEmpty()){
			System.out.println("selbookbyid  null");
			return null;
		}else{
			System.out.println("selbookbyid  have");
			return lst;
		}
	}
	/**
	 * 根据logid查询该用户的所有订单信息 按b_indate入住日期逆序显示
	 * @param logid
	 * @return List<Book> 无则返回null，否则返回List<Book>
	 */
	public List<Book> selfinbookbylogid(String logid) {
		List<Book> lst=bookdaoimpl.selfinbookbylogid(logid);
		if(lst.isEmpty()){
			System.out.println("selbookbylogid  null");
			return null;
		}else{
			System.out.println("selbookbylogid  have");
			return lst;
		}
	}
	/**
	 * 根据logid查询该用户的未完成的订单信息 按b_indate入住日期逆序显示
	 * @param logid
	 * @return List<Book> 无则返回null，否则返回List<Book>
	 */
	public List<Book> selprebookbylogid(String logid) {
		List<Book> lst=bookdaoimpl.selprebookbylogid(logid);
		if(lst.isEmpty()){
			System.out.println("selprebookbylogid  null");
			return null;
		}else{
			System.out.println("selprebookbylogid  have");
			return lst;
		}
	}
	/**
	 * 根据bid更新相应的订单表
	 * 
	 * @param bid
	 * @param hid
	 * @param hname
	 * @param bindate
	 * @param boutdate
	 * @param bpnum
	 * @param bprice
	 * @param clogid
	 * @param bprepay
	 * @return boolean
	 * @throws ParseException
	 */
	public boolean updbook(String bid, String hid, String hname,
			String bindate, String boutdate, String bpnum, String bprice,
			String clogid, String bprepay) throws ParseException {
		Integer bid1 = Integer.parseInt(bid);
		Integer hid1 = Integer.parseInt(hid);
		Integer bpnum1 = Integer.parseInt(bpnum);
		Date bindate1 = (Date) new SimpleDateFormat("yyyy-MM-dd")
				.parse(bindate);
		Date boutdate1 = (Date) new SimpleDateFormat("yyyy-MM-dd")
				.parse(boutdate);
		Double bprice1 = Double.parseDouble(bprice);
		Double bprepay1 = Double.parseDouble(bprepay);
		if (bookdaoimpl.updbook(bid1, hid1, hname, bindate1, boutdate1, bpnum1,
				bprice1, clogid, bprepay1) >= 0) {
			System.out.println("updbook  true");
			return true;
		} else {
			System.out.println("updbook  false");
			return false;
		}
	}

	/**
	 * 根据hid判断订单是否存在
	 * 
	 * @param hid
	 * @return boolean
	 */
	public boolean havebook(Integer hid) {
		if (bookdaoimpl.get(hid) == null) {
			System.out.println("havebook false");
			return false;
		} else {
			System.out.println("havebook true");
			return true;
		}
	}

	/**
	 * 根据bid删除订单
	 * 
	 * @param bid
	 * @return boolean
	 */
	public boolean delbook(Integer bid) {
		if (bookdaoimpl.deleteById(bid)) {
			System.out.println("delbook true");
			return true;
		} else {
			System.out.println("delbook false");
			return false;
		}
	}
	/**
	 * 添加订单
	 * @param hid
	 * @param hname
	 * @param bindate
	 * @param boutdate
	 * @param bpnum
	 * @param bprice
	 * @param clogid
	 * @param bprepay
	 * @return boolean
	 * @throws ParseException 
	 */
	public boolean addbook(String hid, String hname, String bindate,
			String boutdate, String bpnum, String bprice, String clogid,
			String bprepay) throws ParseException {
		Integer hid1 = Integer.parseInt(hid);
		Integer bpnum1 = Integer.parseInt(bpnum);
		Date bindate1 = (Date) new SimpleDateFormat("yyyy-MM-dd")
				.parse(bindate);
		Date boutdate1 = (Date) new SimpleDateFormat("yyyy-MM-dd")
				.parse(boutdate);
		Double bprice1 = Double.parseDouble(bprice);
		Double bprepay1 = Double.parseDouble(bprepay);
		if (bookdaoimpl.addbook(hid1, hname, bindate1, boutdate1, bpnum1,
				bprice1, clogid, bprepay1) >= 0) {
			System.out.println("addbook  true");
			return true;
		} else {
			System.out.println("addbook  false");
			return false;
		}
	}
	/**
	 * 根据条件查询订单信息
	 * @param bid
	 * @param hid
	 * @param hname
	 * @param bindate
	 * @param boutdate
	 * @param bpnum
	 * @param clogid
	 * @param bprice1
	 * @param bprice2
	 * @param bprepay
	 * @return List<Book> 空则返回null
	 * @throws ParseException 
	 */
	public List<Book> getlistbookby(String bid, String hid, String hname,
			String bindate, String boutdate, String bpnum, String clogid,
			String bprice1, String bprice2, String bprepay) throws ParseException {
		List<Book> lst=bookdaoimpl.getlistbookby(bid,hid,hname,bindate,boutdate,bpnum,clogid,bprice1,bprice2,bprepay);
		if(lst.isEmpty()){
			System.out.println("getlistbookby  null");
			return null;
		}else{
			System.out.println("getlistbookby  have");
			return lst;
		}
	}

}
