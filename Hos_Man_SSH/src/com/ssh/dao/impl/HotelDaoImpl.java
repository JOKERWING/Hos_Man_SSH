package com.ssh.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssh.bean.Hotel;
import com.ssh.bean.Hotel_Hotelimformation;
import com.ssh.dao.IHotelDao;

@Repository
public class HotelDaoImpl extends BaseDaoImpl<Hotel,String> implements IHotelDao{


	@Override
	public List<Hotel_Hotelimformation> getlisthotel() {
		// TODO Auto-generated method stub
		return super.getListBySQL_JDBC(Hotel_Hotelimformation.class,"select * from hotel h join hotelimformation hi on h.hi_id=hi.hi_id order by h.hi_id ");
	}


	@Override
	public List<Hotel_Hotelimformation> hotsel(String hiname, String indate, String outdate,
			String pnum) {
		List<Hotel_Hotelimformation> lst;
		StringBuffer sql=new StringBuffer();
		sql.append(" SELECT *  FROM hotel join hotelimformation on hotel.hi_id=hotelimformation.hi_id");
		sql.append(" WHERE h_id NOT in ");
		sql.append(" (SELECT h_id from book WHERE ");
		sql.append(" ((b_indate<= ? and ? <b_outdate)OR( ? <=b_indate and ? >=b_outdate)OR(b_indate< ? AND ? <=b_outdate)))  ");
		if (hiname.equals("所有房型")) {
			if(Integer.parseInt(pnum)>3){
				sql.append(" AND( hi_name LIKE '%双%') ");
			}
			sql.append(" order by hi_type desc ");
			lst =super.getListBySQL_JDBC(Hotel_Hotelimformation.class, sql.toString(),indate,indate,indate,outdate,outdate,outdate);
		} else {
			sql.append(" and hi_name =? order by hi_type desc ");
			lst =super.getListBySQL_JDBC(Hotel_Hotelimformation.class, sql.toString(),indate,indate,indate,outdate,outdate,outdate,hiname);
		}
		return lst;
	}

	
	@Override
	public int updhot(String hid, String hname,Integer harea, Integer hfloor,Integer hiid) {
		String sql="UPDATE hotel SET h_name = ?,h_area=?,h_floor=?,hi_id=? WHERE h_id = ?";
		return super.querySql(sql, hname,harea,hfloor,hiid,hid);
	}


	@Override
	public List<Hotel> selhotbyid(String hid) {
		String sql="select * from hotel where h_id=? order by hi_id ";
		return super.getListBySQL(sql, hid);
	}


	@Override
	public int addhot(String hid, String hname, Integer area, Integer floor,
			Integer hiid) {
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into ");
		sql.append(" hotel( h_id, h_name, h_area, h_floor, hi_id) ");
		sql.append(" values(?,?,?,?,?); ");
		return super.querySql(sql.toString(),hid,hname,area,floor,hiid );
	}


	@Override
	public List<Hotel> getlisthotby(String hid, String hname, String area1,
			String area2, String floor1, String floor2, String hiid) {
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from hotel where 1=1  ");
		if(hid!=""){
			sql.append(" and h_id="+hid+" ");
		}
		sql.append(" and h_name like '%"+hname+"%' ");
		if(area1!=""){
			sql.append(" and h_area>="+area1+" ");
		}
		if(area2!=""){
			sql.append(" and h_area<="+area2+" ");
		}
		if(floor1!=""){
			sql.append(" and h_floor>="+floor1+" ");
		}
		if(floor2!=""){
			sql.append(" and h_floor<="+floor2+" ");
		}
		if(hiid!=""){
			sql.append(" and hi_id="+hiid+" ");
		}
		sql.append(" order by hi_id ");
		return super.getListBySQL(sql.toString());
	}

}
