package com.ssh.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssh.bean.Privilege;
import com.ssh.dao.IPrivilegeDao;



@Repository
public class PrivilegeDaoImpl extends BaseDaoImpl<Privilege, Integer> implements IPrivilegeDao{

	@Override
	public List<Privilege> getlistpri() {
		// TODO Auto-generated method stub
		return super.getListBySQL(" select * from privilege order by pid; ");
	}

	@Override
	public List<Privilege> selpribyid(Integer pid) {
		String sql=" select * from privilege where pid=? ";
		return super.getListBySQL(sql, pid);
	}

	@Override
	public int updpri(Integer pid, String pfunction, String pimformation) {
		StringBuffer sql=new StringBuffer();
		sql.append(" update privilege set pfunction=?,pimformation=?  ");
		sql.append(" where pid=? ");
		return super.querySql(sql.toString(), pfunction,pimformation,pid);
	}

	@Override
	public int addpri(Integer pid, String pfunction, String pimformation) {
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into ");
		sql.append(" privilege( pfunction,pimformation,pid ) ");
		sql.append(" values(?,?,?); ");
		return super.querySql(sql.toString(),pfunction,pimformation,pid);
	}

	@Override
	public int delpri(Integer pid) {
		StringBuffer sql=new StringBuffer();
		sql.append(" delete from privilege ");
		sql.append(" where  pid=? ");
		return super.querySql(sql.toString(),pid);
	}

	@Override
	public List<Privilege> getlistpriby(String pid, String pfunction,
			String pimformation) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from privilege where 1=1  ");
		if(pid!=""){
			sql.append(" and pid="+pid+" ");
		}
		if(pfunction!=""){
			sql.append(" and pfunction like '%"+pfunction+"%' ");
		}
		if(pimformation!=""){
			sql.append(" and pimformation like '%"+pimformation+"%' ");
		}
		sql.append(" order by pid ");
		return super.getListBySQL(sql.toString());
	}


}
