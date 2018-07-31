package com.ssh.dao;

import java.util.List;

import com.ssh.bean.Customer;
import com.ssh.dao.base.IBaseDao;

public interface ICustomerDao extends IBaseDao<Customer, Integer> {

	public List<Customer> getlistcustomer();

	public List<Customer> selcustomer(String logid);

	public int regcus(String clogid, String cpwd, String cname, String csex,
			String ctele, String cidcard, String cemail);

	public List<Customer> selcusbyid(Integer cid);

	public int updcus(Integer cid, String clogid, String cpwd, String cname,
			String csex, String ctele, String cidcard, String cemail,
			String clevel, Integer clevsco);

	public int updlev(String c_level, Integer c_levsco, String c_logid);

	public List<Customer> sellev(String c_logid);

	public List<Customer> selcusbylogid(String clogid);

	public int addcus(String clogid, String cpwd, String cname, String csex,
			String ctele, String cidcard, String cemail);

	public List<Customer> getlistcusby(String cid, String clogid, String cname,
			String csex, String ctele, String cidcard, String cemail,
			String clevel, String clevsco);
}
