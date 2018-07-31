package com.ssh.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssh.bean.Customer;
import com.ssh.dao.ICustomerDao;


@Repository
public class CustomerDaoImpl extends BaseDaoImpl<Customer,Integer> implements ICustomerDao{

	@Override
	public List<Customer> getlistcustomer() {
		// TODO Auto-generated method stub
		return super.getListBySQL(" select * from customer ORDER BY c_id");
	}

	@Override
	public List<Customer> selcustomer(String logid) {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from customer ");
		sql.append(" where c_logid=? ");
		return super.getListBySQL(sql.toString(),logid);
	}

	@Override
	public int regcus(String clogid,String cpwd,String cname,String csex,String ctele,String cidcard,String cemail) {
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into customer(c_logid,c_pwd,c_name,c_sex,c_tele,c_idcard,c_email,c_level,c_levsco) ");
		sql.append(" values(?,?,?,?,?,?,?,'V0','0'); ");
		return super.querySql(sql.toString(), clogid,cpwd,cname,csex,ctele,cidcard,cemail);
	}

	@Override
	public List<Customer> selcusbyid(Integer cid) {
		String sql=" select * from customer where c_id=? ";
		return super.getListBySQL(sql, cid);
	}

	@Override
	public int updcus(Integer cid, String clogid, String cpwd,
			String cname, String csex, String ctele, String cidcard,String cemail,
			String clevel, Integer clevsco) {
		StringBuffer sql=new StringBuffer();
		sql.append(" UPDATE customer SET c_logid=?,c_pwd=?,c_name=?,c_sex=?,c_tele=?,c_idcard=?,c_email=?,c_level=?,c_levsco=? ");
		sql.append(" WHERE c_id = ? ");
		return super.querySql(sql.toString(),clogid,cpwd,cname,csex,ctele,cidcard,cemail,clevel,clevsco,cid);
	}
	
	@Override
	public int addcus(String clogid, String cpwd, String cname, String csex,
			String ctele, String cidcard, String cemail) {
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into ");
		sql.append(" customer( c_logid,c_pwd,c_name,c_sex,c_tele,c_idcard,c_email) ");
		sql.append(" values(?,?,?,?,?,?,?); ");
		return super.querySql(sql.toString(),clogid,cpwd,cname,csex,ctele,cidcard,cemail);
	}
	
	@Override
	public int updlev(String c_level,Integer c_levsco,String c_logid) {
		String sql="update customer SET c_level=?, c_levsco=? where c_logid=?;";
		return super.querySql(sql, c_level,c_levsco,c_logid);
	}

	@Override
	public List<Customer> sellev(String c_logid) {
		String sql="select * from customer where c_logid=?;";
		return super.getListBySQL(sql, c_logid);
	}

	@Override
	public List<Customer> selcusbylogid(String clogid) {
		String sql=" select * from customer where c_logid=? ";
		return super.getListBySQL(sql, clogid);
	}

	@Override
	public List<Customer> getlistcusby(String cid, String clogid, String cname,
			String csex, String ctele, String cidcard, String cemail,
			String clevel, String clevsco) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from customer where 1=1  ");
		if(cid!=""){
			sql.append(" and c_id="+cid+" ");
		}
		if(clogid!=""){
			sql.append(" and c_logid='"+clogid+"' ");
		}
		if(cname!=""){
			sql.append(" and c_name='"+cname+"' ");
		}
		if(!csex.equals("全部")){
			sql.append(" and c_sex='"+csex+"' ");
		}
		if(ctele!=""){
			sql.append(" and c_tele like '%"+ctele+"%' ");
		}
		if(cidcard!=""){
			sql.append(" and c_idcard like '%"+cidcard+"%' ");
		}
		if(cemail!=""){
			sql.append(" and c_email like '%"+cemail+"%' ");
		}
		if(clevel!=""){
			sql.append(" and c_level='"+clevel+"' ");
		}
		if(clevsco!=""){
			sql.append(" and c_levsco="+clevsco+" ");
		}
		sql.append(" order by c_id ");
		return super.getListBySQL(sql.toString());
	}

	

	

	
	
}
