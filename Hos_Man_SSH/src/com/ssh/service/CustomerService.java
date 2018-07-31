package com.ssh.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.bean.Book;
import com.ssh.bean.Customer;
import com.ssh.bean.Level;
import com.ssh.dao.ICustomerDao;
import com.ssh.dao.ILevelDao;

@Transactional
@Service
public class CustomerService {

	@Autowired
	private ICustomerDao customerdaoimpl;
	@Autowired
	private ILevelDao leveldaoimpl;
	/**
	 * 列出所有用户信息
	 * 
	 * @return List<Customer> 空则返回null
	 */
	public List<Customer> getlistcustomer() {
		List<Customer> lst = customerdaoimpl.getlistcustomer();
		if (!lst.isEmpty()) {
			System.out.println("getlistcus  have");
			return lst;
		} else {
			System.out.println("getlistcus  null");
			return null;
		}
	}

	/**
	 * 检测用户账号密码
	 * 
	 * @param logid
	 * @param pwd
	 * @return String 如果存在return true，如果账号正确密码错误return pwdfalse，不存在return false
	 */
	public String checkcustomer(String logid, String pwd) {
		List<Customer> lst = getlistcustomer();
		for (Customer i : lst) {
			if (logid.equals(i.getCLogid())) {
				if (pwd.equals(i.getCPwd())) {
					return "true";
				} else {
					return "pwdfalse";
				}
			} else {
				continue;
			}
		}
		return "false";
	}

	/**
	 * 根据用户名logid查询用户信息
	 * 
	 * @param logid
	 * @return List<Customer>
	 */
	public List<Customer> selcustomer(String logid) {
		return customerdaoimpl.selcustomer(logid);

	}

	/**
	 * 注册用户
	 * 
	 * @param clogid
	 * @param cpwd
	 * @param cname
	 * @param csex
	 * @param ctele
	 * @param cidcard
	 * 
	 * @return boolean
	 */
	public boolean regcus(String clogid, String cpwd, String cname,
			String csex, String ctele, String cidcard,String cemail) {
		if (customerdaoimpl.regcus(clogid, cpwd, cname, csex, ctele, cidcard,cemail) >= 0) {
			System.out.println("regcus true");
			return true;
		} else {
			System.out.println("regcus false");
			return false;
		}
	}

	/**
	 * 根据cid判断客户是否存在
	 * 
	 * @param cid
	 * @return boolean
	 */
	public boolean havecus(Integer cid) {
		if (customerdaoimpl.get(cid) == null) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 根据cid删除用户信息
	 * 
	 * @param cid
	 * @return boolean
	 */
	public boolean delcus(Integer cid) {
		if( customerdaoimpl.deleteById(cid)){
			System.out.println("delcus  true");
			return true;
		}else{
			System.out.println("delcus  false");
			return false;
		}
	}

	/**
	 * 根据cid更新用户表
	 * 
	 * @param cid
	 * @param clogid
	 * @param cpwd
	 * @param cname
	 * @param csex
	 * @param ctele
	 * @param cidcard
	 * @param clevel
	 * @param clevsco
	 * @return boolean 
	 */
	public boolean updcus(Integer cid, String clogid, String cpwd, String cname,
			String csex, String ctele, String cidcard,String semail, String clevel,
			Integer clevsco) {
		if( customerdaoimpl.updcus(cid, clogid, cpwd, cname, csex, ctele,
				cidcard,semail, clevel, clevsco)>=0){
			System.out.println("updcus  true");
			return true;
		}else{
			System.out.println("updcus  false");
			return false;
		}
	}

	/**
	 * 根据cid查询用户信息
	 * 
	 * @param cid
	 * @return List<Customer> 空则返回null
	 */
	public List<Customer> selcusbyid(Integer cid) {
		List<Customer> lst= customerdaoimpl.selcusbyid(cid);
		if(lst.isEmpty()){
			System.out.println("selcusbyid  null");
			return null;
		}else{
			System.out.println("selcusbyid  have");
			return lst;
		}
		
	}
	/**
	 * 根据账号名查询用户信息
	 * @param clogid
	 * @return List<Customer> 空则返回null
	 */
	public List<Customer> selcusbylogid(String clogid) {
		List<Customer> lst= customerdaoimpl.selcusbylogid(clogid);
		if(lst.isEmpty()){
			System.out.println("selcusbylogid  null");
			return null;
		}else{
			System.out.println("selcusbylogid  have");
			return lst;
		}
		
	}

	/**
	 * 更新会员积分(+)和等级
	 * @param c_logid
	 * @param addlevsco
	 * @return boolean
	 */
	public boolean updaddlev(String c_logid,Integer addlevsco) {
		
		String level = null;
		Integer levsco = null;
		for(Customer c:customerdaoimpl.sellev(c_logid)){
			levsco=c.getCLevsco()+addlevsco;
		}
		for(Level l:leveldaoimpl.getlistlevel()){
			if(levsco>=l.getLlevscomax()){
				level=l.getLlevel();
			}
		}
		if (customerdaoimpl.updlev(level, levsco, c_logid) >= 0) {
			System.out.println("updlev  true");
			return true;
		}else{
			System.out.println("updlev  false");
			return false;
		}

	}
	/**
	 * 更新会员积分(-)和等级
	 * @param c_logid
	 * @param addlevsco
	 * @return boolean
	 */
	public boolean updredlev(String c_logid,Integer redlevsco) {
		
		String level = null;
		Integer levsco = null;
		for(Customer c:customerdaoimpl.sellev(c_logid)){
			levsco=c.getCLevsco()-redlevsco;
		}
		for(Level l:leveldaoimpl.getlistlevel()){
			if(levsco>=l.getLlevscomax()){
				level=l.getLlevel();
			}else if(levsco<0){
				level="V0";
			}
		}
		if (customerdaoimpl.updlev(level, levsco, c_logid) >= 0) {
			System.out.println("updlev  true");
			return true;
		}else{
			System.out.println("updlev  false");
			return false;
		}

	}
	/**
	 * 添加客户
	 * @param clogid
	 * @param cpwd
	 * @param cname
	 * @param csex
	 * @param ctele
	 * @param cidcard
	 * @param cemail
	 * @return boolean
	 */
	public boolean addcus(String clogid, String cpwd, String cname, String csex,
			String ctele, String cidcard, String cemail) {
		if( customerdaoimpl.addcus(clogid, cpwd, cname, csex, ctele,
				cidcard,cemail)>=0){
			System.out.println("addcus  true");
			return true;
		}else{
			System.out.println("addcus  false");
			return false;
		}
	}

	public List<Customer> getlistcusby(String cid, String clogid, String cname,
			String csex, String ctele, String cidcard, String cemail,
			String clevel, String clevsco) {
		List<Customer> lst= customerdaoimpl.getlistcusby(cid,clogid,cname,csex,ctele,cidcard,cemail,clevel,clevsco);
		if(lst.isEmpty()){
			System.out.println("getlistcusby  null");
			return null;
		}else{
			System.out.println("getlistcusby  have");
			return lst;
		}
	}
	
}
