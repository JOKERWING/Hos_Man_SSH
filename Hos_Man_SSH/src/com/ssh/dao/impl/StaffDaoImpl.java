package com.ssh.dao.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssh.bean.Staff;
import com.ssh.dao.IStaffDao;



@Repository
public class StaffDaoImpl extends BaseDaoImpl<Staff,String>implements IStaffDao{

	@Override
	public List<Staff> getliststa() {
		String sql="select * from staff order by slogid";
		return super.getListBySQL(sql);
	}

	@Override
	public List<Staff> selstabyid(String slogid) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from staff ");
		sql.append(" where slogid =? ");
		return super.getListBySQL(sql.toString(), slogid);
	}

	@Override
	public int updsta(String slogid, String spwd, String sname, String ssex,
			Date sbirth, String semail, String stele, String sidcard,
			String saddress, String rname) {
		StringBuffer sql=new StringBuffer();
		sql.append(" UPDATE staff SET spwd=?,sname=?,ssex=?,sbirth=?,semail=?,stele=?,sidcard=?,saddress=?,rname=? ");
		sql.append(" WHERE slogid = ? ");
		return super.querySql(sql.toString(),spwd,sname,ssex,sbirth,semail,stele,sidcard,saddress,rname,slogid);
	}

	@Override
	public int addsta(String slogid, String spwd, String sname, String ssex,
			Date sbirth, String semail, String stele, String sidcard,
			String saddress, String rname) {
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into ");
		sql.append(" staff( slogid,spwd,sname,ssex,sbirth,semail,stele,sidcard,saddress,rname ) ");
		sql.append(" values(?,?,?,?,?,?,?,?,?,?); ");
		return super.querySql(sql.toString(),slogid,spwd,sname,ssex,sbirth,semail,stele,sidcard,saddress,rname);
	}

	@Override
	public List<Staff> getliststaby(String slogid, String sname, String ssex,
			String sbirth, String semail, String stele, String sidcard,
			String saddress, String rname) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from staff where 1=1  ");
		if(slogid!=""){
			sql.append(" and slogid='"+slogid+"' ");
		}
		if(sname!=""){
			sql.append(" and sname='"+sname+"' ");
		}
		if(!ssex.equals("全部")){
			sql.append(" and ssex='"+ssex+"' ");
		}
		if(sbirth!=""){
			sql.append(" and TO_DAYS(sbirth)=TO_DAYS('"+sbirth+"') ");
		}
		if(semail!=""){
			sql.append(" and semail like '%"+semail+"%' ");
		}
		if(stele!=""){
			sql.append(" and stele like '%"+stele+"%' ");
		}
		if(sidcard!=""){
			sql.append(" and sidcard like '%"+sidcard+"%' ");
		}
		if(saddress!=""){
			sql.append(" and saddress like '%"+saddress+"%' ");
		}
		if(rname!=""){
			sql.append(" and rname='"+rname+"' ");
		}
		sql.append(" order by slogid ");
		return super.getListBySQL(sql.toString());
	}




}
