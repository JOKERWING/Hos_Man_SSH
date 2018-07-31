package com.ssh.controller;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.Region;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssh.bean.Customer;
import com.ssh.service.CustomerService;

@Controller
@RequestMapping("/Test")
public class TestController {
	
	@Autowired
	private CustomerService customerservice;
	/**
	 * 导出报表
	 * @throws Exception 
	 * @throws Exception 
	 */
	@RequestMapping("/print")
	public void print(HttpServletRequest req,HttpServletResponse rsp) throws Exception{
		System.out.println("进入test/print");
		rsp.reset(); 
		rsp.setCharacterEncoding("utf-8");
		rsp.setContentType("application/vnd.ms-excel");  
		String filename="数据统计.";
		rsp.setHeader("Content-Disposition","attachment; filename="+new String(filename.getBytes("gb2312"),"ISO-8859-1")+"xls"); 
		OutputStream ouputStream=rsp.getOutputStream(); 
		// 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("用户信息");
        // 单元格合并   
        
        // 四个参数分别是：起始行，起始列，结束行，结束列   
        sheet.addMergedRegion(new Region(0, (short) (0), 0, (short) (0))); //编号
        sheet.addMergedRegion(new Region(0, (short) (1), 0, (short) (1))); //登录名
        sheet.addMergedRegion(new Region(0, (short) (2), 0, (short) (2))); //密码
        sheet.addMergedRegion(new Region(0, (short) (3), 0, (short) (3))); //姓名
       
        //wb.C
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow(0);
        //HSSFRow row1 = sheet.createRow(1);
      
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
        HSSFCell cell = row.createCell((short) 0);  
        cell.setCellValue("编号");
        cell.setCellStyle(style);
        cell = row.createCell((short) 1);  
        cell.setCellValue("登录名");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 2);  
        cell.setCellValue("密码");  
        cell.setCellStyle(style);   
        cell = row.createCell((short)3);  
        cell.setCellValue("姓名");  
        cell.setCellStyle(style); 
        
        // 第五步，写入实体数据 实际应用中这些数据从数据库得到，  
      /* List<Object[]> listt= JbpmInfoService.daochu(list,jbpmInfodto);  */
        List<Customer> lst=customerservice.getlistcustomer();
        
      // List<Object[]> list=page.getResult();
        for (int i = 0; i < lst.size(); i++)  
        {  
        	HSSFRow row2 = sheet.createRow(i + 1);
            // 创建单元格，并设置值   
            cell=row2.createCell((short) 0);
            cell.setCellValue(String.valueOf(lst.get(i).getCId()==null ? "0" :lst.get(i).getCId())); 
            cell.setCellStyle(style);
            cell=row2.createCell((short) 1);
            cell.setCellValue(String.valueOf(lst.get(i).getCLogid()==null ? "0" :lst.get(i).getCLogid())); 
            cell.setCellStyle(style);
            cell=row2.createCell((short) 2);
            cell.setCellValue(String.valueOf(lst.get(i).getCPwd()==null ? "0" :lst.get(i).getCPwd()));  
            cell.setCellStyle(style);
            cell=row2.createCell((short) 3);
            cell.setCellValue(String.valueOf(lst.get(i).getCName()==null ? "0" :lst.get(i).getCName()));
            cell.setCellStyle(style);
        }
        
        
        /*for (int i = 0; i < listt.size(); i++)  
        {  
        	HSSFRow row2 = sheet.createRow(i + 2);
            // 第四步，创建单元格，并设置值  
            row2.createCell((short) 0).setCellValue(i+1);  
           
            row2.createCell((short) 1).setCellValue(String.valueOf(listt.get(i)[0]==null ? "0" :listt.get(i)[0]));  
            row2.createCell((short) 2).setCellValue(String.valueOf(listt.get(i)[1]==null ? "0" :listt.get(i)[1])); 
            row2.createCell((short) 3).setCellValue(String.valueOf(listt.get(i)[2]==null ? "0" :listt.get(i)[2]));  
            row2.createCell((short) 4).setCellValue(String.valueOf(listt.get(i)[3]==null ? "0" :listt.get(i)[3]));
            row2.createCell((short) 5).setCellValue(String.valueOf(listt.get(i)[4]==null ? "0" :listt.get(i)[4]));  
            row2.createCell((short) 6).setCellValue(String.valueOf(listt.get(i)[5]==null ? "0" :listt.get(i)[5])+"%");  
            row2.createCell((short) 7).setCellValue(String.valueOf(listt.get(i)[7]==null ? "0" :listt.get(i)[7]));  
            row2.createCell((short) 8).setCellValue(String.valueOf(listt.get(i)[8]==null ? "0" :listt.get(i)[8])); 
            row2.createCell((short) 9).setCellValue(String.valueOf(listt.get(i)[9]==null ? "0" :listt.get(i)[9]));  
            row2.createCell((short) 10).setCellValue(String.valueOf(listt.get(i)[10]==null ? "0" :listt.get(i)[10]));
            row2.createCell((short) 11).setCellValue(String.valueOf(listt.get(i)[11]==null ? "0" :listt.get(i)[11])+"%");  
  
        }  */
        // 第六步，将文件存到指定位置  
      
        try  
        {  
        
        	
        	  wb.write(ouputStream);    
              ouputStream.flush();    
              ouputStream.close();
           /* FileOutputStream fout = new FileOutputStream("C:/数据统计.xls");  
            wb.write(fout);  
            fout.close(); */ 
          
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();  
        }  
   
	 
		
	}
}
