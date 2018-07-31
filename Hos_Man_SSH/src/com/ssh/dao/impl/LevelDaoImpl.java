package com.ssh.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssh.bean.Level;
import com.ssh.dao.ILevelDao;

@Repository
public class LevelDaoImpl extends BaseDaoImpl<Level, Integer> implements ILevelDao{

	@Override
	public List<Level> getlistlevel() {
		String sql=" select * from level order by lid; ";
		return super.getListBySQL(sql);
	}

	@Override
	public List<Level> sellsale(String llevel) {
		String sql=" select * from level where llevel=? ";
		return super.getListBySQL(sql, llevel);
	}


}
