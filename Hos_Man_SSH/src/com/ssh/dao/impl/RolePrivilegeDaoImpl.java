package com.ssh.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssh.bean.RolePrivilegeAll;
import com.ssh.bean.Roleprivilege;
import com.ssh.dao.IRolePrivilegeDao;



@Repository
public class RolePrivilegeDaoImpl extends BaseDaoImpl<Roleprivilege, Integer> implements IRolePrivilegeDao{
	@Override
	public List<RolePrivilegeAll> selrolepriallbyrid(Integer rid) {
		StringBuffer sql=new StringBuffer();
		sql.append(" SELECT r.*,p.*,rp.rpid,rp.rid rid1,rp.pid pid1 ");
		sql.append(" FROM role  r LEFT JOIN roleprivilege rp ON r.rid=rp.rid ");
		sql.append(" LEFT JOIN privilege p ON rp.pid=p.pid ");
		sql.append(" where r.rid=? ");
		sql.append(" ORDER BY p.pid ");
		return super.getListBySQL_JDBC(RolePrivilegeAll.class,sql.toString(),rid);
	}

	@Override
	public List<RolePrivilegeAll> selrolepriallbyrname(String rname) {
		StringBuffer sql=new StringBuffer();
		sql.append(" SELECT r.*,p.*,rp.rpid,rp.rid rid1,rp.pid pid1 ");
		sql.append(" FROM role  r LEFT JOIN roleprivilege rp ON r.rid=rp.rid ");
		sql.append(" LEFT JOIN privilege p ON rp.pid=p.pid ");
		sql.append(" where r.rname=? ");
		sql.append(" ORDER BY p.pid ");
		return super.getListBySQL_JDBC(RolePrivilegeAll.class,sql.toString(),rname);
	}

	@Override
	public int addrolepri(Integer rid, Integer pid) {
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into ");
		sql.append(" roleprivilege(rid,pid) ");
		sql.append(" values(?,?); ");
		return super.querySql(sql.toString(),rid,pid);
	}

	@Override
	public int delrolepri(Integer rid, Integer pid) {
		StringBuffer sql=new StringBuffer();
		sql.append(" delete from roleprivilege ");
		sql.append(" where rid=? and pid=? ");
		return super.querySql(sql.toString(),rid,pid);
	}


}
