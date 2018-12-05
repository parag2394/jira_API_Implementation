<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.icreon.parag.JiraAPI.daoImpl.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONObject"%>
<html>
<title>Icreon Worklogs</title>
<head>

 <link rel="Stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" /> 
 <!-- Bootstrap core CSS-->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
</head>
<body>
		      <!-- Example DataTables Card-->
      <div class="card mb-3">
        <div class="card-header">
        

  
            <table class="table table-bordered" id="ex1" width="100%" cellspacing="0">
              
             <thead>
                <tr class="warning" >
                  <td ><h6>S.NO</h6></td>
                    <td ><h6>WorkLog ID</h6></td>
                     <td ><h6>Issue No.</h6></td>
                      <td ><h6>Start Date</h6></td>
                       <td ><h6>Description</h6></td>
                        <td ><h6>Author</h6></td>
                         <td ><h6>Time Spent</h6></td>
                      
                </tr>
            </thead>
			
			
			
			<%
			try{
			GetWorklogs gw=new GetWorklogs();
			JSONArray jsonResults=gw.showWorklogs();
			
			int j=0;
			 for(int i=0; i < jsonResults.length();i++){
		        ++j;
// 		        int worklogsCount =(Integer)obj[0];
// 		        int worklogId =(Integer)obj[1];
// 		        String issueNo =String.valueOf(obj[2]) ;
// 		        String startDate =String.valueOf(obj[3]) ;
// 		        String description = String.valueOf(obj[4]) ;
// 		        String author = String.valueOf(obj[5]) ;
// 		        int timeSpentSeconds=(Integer)obj[6];
		        
		        %>
		        
		     <td><%=j%></td>
		     <td><%=jsonResults.getJSONObject(i).getInt("tempoWorklogId")%></td>
		     <td><%=jsonResults.getJSONObject(i).getJSONObject("issue").getString("key").trim()%></td>
		     <td><%=jsonResults.getJSONObject(i).getString("startDate").trim()%></td>
		     <td><%=jsonResults.getJSONObject(i).getString("description").trim()%></td>
		     <td><%=jsonResults.getJSONObject(i).getJSONObject("author").getString("displayName").trim()%></td>
		     <td><%=jsonResults.getJSONObject(i).getInt("timeSpentSeconds")/3600%> hrs</td>
		     </tr>
		     <%   
		        }
			}
			catch(Throwable e)
			{
		e.printStackTrace();
			}
	%>
		
           
    	        
            </table>
        
 

        
 </div>
        </div>
        
        
</body>


   <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="resources/vendor/datatables/dataTables.bootstrap4.js"></script>
      <script src="resources/js/sb-admin-datatables.min.js"></script>
      
       <script type="text/javascript" src="resources/js/jquery-1.12.4.js"></script>
      <script type="text/javascript" src="resources/js/jquery.dataTables.min.js"></script>
   <script type="text/javascript" src="resources/js/dataTables.buttons.min.js"></script>
   <script type="text/javascript" src="resources/js/buttons.flash.min.js"></script>
   <script type="text/javascript" src="resources/js/jszip.min.js"></script>
   <script type="text/javascript" src="resources/js/pdfmake.min.js"></script>
   <script  type="text/javascript" src="resources/js/vfs_fonts.js"></script>
    <script type="text/javascript" src="resources/js/buttons.html5.min.js"></script>
   <script type="text/javascript" src="resources/js/buttons.print.min.js"></script>
   

  
  

   <script  type="text/javascript">
       $(document).ready(function () {
           $('#ex1').DataTable({
               "lengthMenu": [[25, 50, 100, -1], [25, 50, 100, "All"]],

               dom: 'Bfrtip',
               buttons: [
                   'excel', 'print'
               ]

           });
       });

   </script>
</html>