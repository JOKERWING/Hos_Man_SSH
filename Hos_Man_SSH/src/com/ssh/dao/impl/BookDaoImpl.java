package com.ssh.dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssh.bean.Book;
import com.ssh.bean.Hotel;
import com.ssh.dao.IBookDao;

@Repository
public class BookDaoImpl extends BaseDaoImpl<Book, Integer> implements IBookDao {

	@Override
	public int insertbook(Book b) {
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into ");
		sql.append(" book( h_id, h_name, b_indate, b_outdate, b_pnum,b_price,c_logid,b_prepay) ");
		sql.append(" values(?,?,?,?,?,?,?,?); ");
		return super.querySql(sql.toString(), b.getHId(),b.getHName(),b.getBIndate(),b.getBOutdate(),b.getBPnum(),b.getBPrice(),b.getCLogid(),b.getBPrepay());
	}

	@Override
	public List<Book> getlistbook() {
		return super.getListBySQL(" select * from book ORDER BY b_indate; ");
	}

	@Override
	public List<Book> selbookbyid(Integer bid) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from book ");
		sql.append(" where b_id =? ");
		return super.getListBySQL(sql.toString(), bid);
	}
	
	@Override
	public List<Book> selfinbookbylogid(String logid) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from book ");
		sql.append(" where c_logid =? ");
		sql.append(" and TO_DAYS(NOW())-TO_DAYS(b_indate)>0 AND TO_DAYS(NOW())-TO_DAYS(b_outdate)>=0 ");
		sql.append(" order by b_indate desc ");
		return super.getListBySQL(sql.toString(), logid);
	}
	
	@Override
	public List<Book> selprebookbylogid(String logid) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from book ");
		sql.append(" where c_logid =? ");
		sql.append(" and  (TO_DAYS(b_outdate)-TO_DAYS(NOW())>0 ");
		sql.append(" OR b_prepay<>b_price)");
		sql.append(" order by b_indate ");
		return super.getListBySQL(sql.toString(), logid);
	}
	
	@Override
	public int updbook(Integer bid, Integer hid, String hname, Date bindate,
			Date boutdate, Integer bpnum, Double bprice, String clogid,Double bprepay) {
		StringBuffer sql=new StringBuffer();
		sql.append(" UPDATE book SET h_id=?,h_name=?,b_indate=?,b_outdate=?,b_pnum=?,b_price=?,c_logid=?,b_prepay=? ");
		sql.append(" WHERE b_id = ? ");
		return super.querySql(sql.toString(),hid,hname,bindate,boutdate,bpnum,bprice,clogid,bprepay,bid);
	}

	@Override
	public int addbook(Integer hid, String hname, Date bindate,
			Date boutdate, Integer bpnum, Double bprice, String clogid,
			Double bprepay) {
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into ");
		sql.append(" book( h_id,h_name,b_indate,b_outdate,b_pnum,b_price,c_logid,b_prepay) ");
		sql.append(" values(?,?,?,?,?,?,?,?); ");
		return super.querySql(sql.toString(),hid,hname,bindate,boutdate,bpnum,bprice,clogid,bprepay);
	}

	@Override
	public List<Book> getlistbookby(String bid, String hid, String hname,
			String bindate, String boutdate, String bpnum, String clogid,
			String bprice1, String bprice2, String bprepay) throws ParseException {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from book where 1=1  ");
		if(bid!=""){
			sql.append(" and b_id="+bid+" ");
		}
		if(hid!=""){
			sql.append(" and h_id="+hid+" ");
		}
		sql.append(" and h_name like '%"+hname+"%' ");
		if(bindate!=""){
			sql.append(" and TO_DAYS(b_indate)>=TO_DAYS('"+bindate+"')  ");
		}
		if(boutdate!=""){
			sql.append(" and TO_DAYS(b_outdate)<=TO_DAYS('"+boutdate+"') ");
		}
		if(bpnum!=""){
			sql.append(" and b_pnum="+bpnum+" ");
		}
		if(clogid!=""){
			sql.append(" and c_logid='"+clogid+"' ");
		}
		if(bprice1!=""){
			sql.append(" and b_price>="+bprice1+" ");
		}
		if(bprice2!=""){
			sql.append(" and b_price<="+bprice2+" ");
		}
		if(!bprepay.equals("全部")){
			if(bprepay.equals("预全")){
				sql.append(" and b_prepay=b_price ");
			}else{
				sql.append(" and b_prepay!=b_price ");
			}
			
		}
		sql.append(" order by b_indate ");
		return super.getListBySQL(sql.toString());
	}

	

	
	

	

}
