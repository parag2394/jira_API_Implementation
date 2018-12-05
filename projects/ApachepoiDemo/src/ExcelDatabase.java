import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
public class ExcelDatabase 
{
	public static void main(String[] args) throws Exception 
	   {
	      Class.forName("com.mysql.jdbc.Driver");
	      Connection connect = DriverManager.getConnection( 
	      "jdbc:mysql://localhost:3306/test1" , 
	      "root" , 
	      ""
	      );
	      Statement statement = connect.createStatement();
	      ResultSet resultSet = statement
	      .executeQuery("select * from emp_tbl");
	      XSSFWorkbook workbook = new XSSFWorkbook(); 
	      XSSFSheet spreadsheet = workbook
	      .createSheet("employe db");
	      XSSFRow row=spreadsheet.createRow(0);
	      XSSFCell cell;
	      cell=row.createCell(0);
	      cell.setCellValue("EMP_ID");
	      cell=row.createCell(1);
	      cell.setCellValue("EMPNAME");
	      cell=row.createCell(2);
	      cell.setCellValue("DEG");
	      cell=row.createCell(3);
	      cell.setCellValue("SALARY");
	      cell=row.createCell(4);
	      cell.setCellValue("DEPT");
	      int i=1;
	      while(resultSet.next())
	      {
	         row=spreadsheet.createRow(i);
	         cell=row.createCell(0);
	         cell.setCellValue(resultSet.getInt("emp_id"));
	         cell=row.createCell(1);
	         cell.setCellValue(resultSet.getString("empname"));
	         cell=row.createCell(2);
	         cell.setCellValue(resultSet.getString("deg"));
	         cell=row.createCell(3);
	         cell.setCellValue(resultSet.getString("salary"));
	         cell=row.createCell(4);
	         cell.setCellValue(resultSet.getString("dept"));
	         
	      }
	      FileOutputStream out = new FileOutputStream(
	      new File("exceldatabase2.xlsx"));
	      workbook.write(out);
	      out.close();
	      System.out.println(
	      "exceldatabase.xlsx written successfully");
	   }
}





