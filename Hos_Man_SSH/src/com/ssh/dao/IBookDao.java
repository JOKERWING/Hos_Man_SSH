package com.ssh.dao;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.ssh.bean.Book;
import com.ssh.dao.base.IBaseDao;

public interface IBookDao extends IBaseDao<Book, Integer> {

	public int insertbook(Book b);

	public List<Book> getlistbook();

	public List<Book> selbookbyid(Integer bid);

	public List<Book> selfinbookbylogid(String logid);

	public List<Book> selprebookbylogid(String logid);

	public int updbook(Integer bid, Integer hid, String hname, Date bindate,
			Date boutdate, Integer bpnum, Double bprice, String clogid,
			Double bprepay);

	public int addbook(Integer hid, String hname, Date bindate, Date boutdate,
			Integer bpnum, Double bprice, String clogid, Double bprepay);

	public List<Book> getlistbookby(String bid, String hid, String hname,
			String bindate, String boutdate, String bpnum, String clogid,
			String bprice1, String bprice2, String bprepay) throws ParseException;

}
