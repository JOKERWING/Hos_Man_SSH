package com.ssh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.bean.Level;
import com.ssh.dao.ILevelDao;

@Transactional
@Service
public class LevelService {
	
	@Autowired
	private ILevelDao leveldapimpl;
	
	/**
	 * 根据会员等级查询会员表的打折率信息
	 * @param llevel
	 * @return Double 空则控制台输出信息，否则返回lsale
	 */
	public Double sellsale(String llevel){
		Double lsale = null;
		List<Level> lst=leveldapimpl.sellsale(llevel);
		if(lst.isEmpty()){
			System.out.println("sellsale  null");
		}else{
			for(Level l:lst){
				lsale=l.getLsale();
			}
		}
		System.out.println("sellsale  "+lsale);
		return lsale;
	}
	/**
	 * 获得所有会员表信息
	 * @return List<Level>
	 */
	public List<Level> getlistlevel(){
		System.out.println("getlistlevel");
		return leveldapimpl.getlistlevel();
	}
}
