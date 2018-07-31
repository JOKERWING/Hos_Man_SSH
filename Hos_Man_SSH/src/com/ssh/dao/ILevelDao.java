package com.ssh.dao;

import java.util.List;

import com.ssh.bean.Level;
import com.ssh.dao.base.IBaseDao;

public interface ILevelDao extends IBaseDao<Level, Integer> {

	public List<Level> getlistlevel();

	public List<Level> sellsale(String llevel);
}
