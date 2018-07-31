package com.ssh.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssh.bean.Role;
import com.ssh.dao.IRoleDao;

@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role, Integer> implements IRoleDao {

	@Override
	public List<Role> getlistrole() {
		String sql = " select * from role order by rid; ";
		return super.getListBySQL(sql);
	}

	@Override
	public List<Role> selrolebyid(Integer rid) {
		String sql = "select * from role where rid=?";
		return super.getListBySQL(sql, rid);
	}

	@Override
	public int updpri(Integer rid, String rname, String rnamec,
			String rimformation, Integer rmaxnum) {
		StringBuffer sql = new StringBuffer();
		sql.append(" update role set rname=?,rnamec=?,rimformation=?,rmaxnum=?  ");
		sql.append(" where rid=? ");
		return super.querySql(sql.toString(), rname, rnamec, rimformation,
				rmaxnum, rid);
	}

	@Override
	public List<Role> selrolebyname(String rname) {
		String sql = "select * from role where rname=?";
		return super.getListBySQL(sql, rname);
	}

	@Override
	public int addpri(Integer rid, String rname, String rnamec,
			String rimformation, Integer rmaxnum) {
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into ");
		sql.append(" role( rname,rnamec,rimformation,rmaxnum,rid ) ");
		sql.append(" values(?,?,?,?,?); ");
		return super.querySql(sql.toString(), rname, rnamec, rimformation,
				rmaxnum, rid);
	}

	@Override
	public int delrole(Integer rid) {
		StringBuffer sql=new StringBuffer();
		sql.append(" delete from role ");
		sql.append(" where  rid=? ");
		return super.querySql(sql.toString(),rid);
	}

	@Override
	public List<Role> getlistroleby(String rid, String rname, String rnamec,
			String rimformation, String rmaxnum) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from role where 1=1  ");
		if(rid!=""){
			sql.append(" and rid="+rid+" ");
		}
		if(rname!=""){
			sql.append(" and rname like '%"+rname+"%' ");
		}
		if(rnamec!=""){
			sql.append(" and rnamec like '%"+rnamec+"%' ");
		}
		if(rimformation!=""){
			sql.append(" and rimformation like '%"+rimformation+"%' ");
		}
		if(rmaxnum!=""){
			sql.append(" and rmaxnum="+rmaxnum+" ");
		}
		sql.append(" order by rid ");
		return super.getListBySQL(sql.toString());
	}

}
