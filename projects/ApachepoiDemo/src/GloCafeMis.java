
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.*;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.glo.db.ConnectionFactory;
import com.glo.db.DbUtil;

public class GloCafeMis {
	
	static int ibd_call;
	static int obd_call;
	static java.sql.Date  sqlDate = new java.sql.Date(new java.util.Date().getTime());
	static java.sql.Date  sqlDate1 = new java.sql.Date(new java.util.Date().getTime());
	

	public static void main(String[] args) {
		
		Connection con =null;
        PreparedStatement pst =null;
        ResultSet rst=null;
       
        
  
		
		
		
		
	/////////////////////////////////////////////////////////////	
		
		try {
			con=ConnectionFactory.getConnection();
			pst=con.prepareStatement("select * from glocafe");
			rst=pst.executeQuery();
		}
			
			catch(Exception e) {
				e.printStackTrace();
			}
			
			
     ////////////////////////////////////////////////////////////
		
		
		
		
		
		
	/////////////////////////////////////////////////////////////	
		// Retrieve data in datasheet 
		
	try {
//		XSSFWorkbook workbook = new XSSFWorkbook(); 
//	      XSSFSheet spreadsheet = workbook
//	      .createSheet("Glo Cafe MIS");
		
		
		FileInputStream fis = new FileInputStream(
			      new File("GloCafeMis1.xlsx"));
			      XSSFWorkbook workbook = new XSSFWorkbook(fis);
			      XSSFSheet spreadsheet = workbook.getSheetAt(0);
			      XSSFRow row=spreadsheet.createRow(3);
	   //  XSSFRow row;   //=spreadsheet.createRow(0);
	      XSSFCell cell;
	//     // cell=row.createCell(1);
	      //cell.setCellValue("Total_Ibd_Call");
	     // cell=row.createCell(2);
	     // cell.setCellValue("Total_Obd_Call");
	     // cell=row.createCell(3);
	//     // cell.setCellValue("Total_Sms_Push");
	   //   cell=row.createCell(3);
	    //  cell.setCellValue("Obd_call");
	    //  cell=row.createCell(4);
	    //  cell.setCellValue("SMS_Push");
	      
	      
	      int i=4;
	      if(rst.next())
	      {
	    	// XSSFRow row = spreadsheet.createRow((short) i);
	    	 // row=spreadsheet.createRow(i);
	    	// row.createCell((short) 0).setCellValue(rst.getString(1));
	    	// row.createCell((short) 1).setCellValue(Integer.toString(rst.getInt(2)));
	    	// row.createCell((short) 2).setCellValue(Integer.toString(rst.getInt(3)));
	    	// row.createCell((short) 3).setCellValue(Integer.toString(rst.getInt(4)));
	       
	         row=spreadsheet.createRow(i);
	         cell=row.createCell(0);
	         cell.setCellValue(rst.getString(1));
	         cell=row.createCell(1);
	        cell.setCellValue(rst.getInt(2));
	         cell=row.createCell(2);
	         cell.setCellValue(rst.getInt(3));
	       cell=row.createCell(3);
	       cell.setCellValue(rst.getInt(4));
	       
	     //  workbook.getSheetAt(0).getRow(1).getCell(1);
	      // workbook.getSheetAt(0).getRow(4).getCell(1).setCellValue(rst.getString(1));
	         
	       i++;
	      }
	   //   FileOutputStream out = new FileOutputStream(
	   //   new File("GloCafeMis1.xlsx"));
	   //   workbook.write(out);
	      //out.close();
	      
	      fis.close();
	        System.out.println("written successfully");
		}
	
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
