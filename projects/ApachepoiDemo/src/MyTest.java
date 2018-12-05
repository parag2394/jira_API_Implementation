import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MyTest {

   public static void main(String[] args)throws Throwable {

       Connection con = null;
       Statement st = null;
       ResultSet rs = null;
       PreparedStatement ps=null;

       Class.forName("com.mysql.jdbc.Driver");
	     
	      
       String url = "jdbc:mysql://localhost:3306/test1"; 
       String user = "root";  
       String password = "";  
       String file="excel1.csv";
       

       try {
           con = DriverManager.getConnection(url, user, password);
         //  st = con.createStatement();
           
           ps=con.prepareStatement("LOAD DATA LOCAL INFILE '"+file+"' INTO TABLE emp_tbl(emp_id,empname,deg,salary,dept)");
    
           
           
        //  ps=conn.prepareStatement("LOAD DATA LOCAL INFILE '"+exceldatabase.xlsx+"' INTO TABLE emp_tbl(emp_id,ename,deg,salary,dept)") 
           
        //  String query= "LOAD DATA LOCAL INFILE '"+exceldatabase.xlsx+"' INTO TABLE emp_tbl(emp_id,ename,deg,salary,dept)";
           
         //  String sSqlLinux="LOAD DATA LOCAL INFILE 'exceldatabase.xlsx' INTO TABLE emp_tbl(emp_id,ename,deg,salary,dept) " + 
        //  " FIELDS TERMINATED BY ',' ENCLOSED BY '\"' " +
        //   " LINES TERMINATED BY '\\n'";

    
   
           ps.executeUpdate();
           System.out.println("------------------------------");    

       } catch (SQLException ex) {
           Logger lgr = Logger.getLogger(MyTest.class.getName());
           lgr.log(Level.SEVERE, ex.getMessage(), ex);

       } finally {
           try {
               if (rs != null) {
                   rs.close();
               }
               if (st != null) {
                   st.close();
               }
               if (con != null) {
                   con.close();
               }

           } catch (SQLException ex) {
               Logger lgr = Logger.getLogger(MyTest.class.getName());
               lgr.log(Level.WARNING, ex.getMessage(), ex);
           }
       }
   }
}
