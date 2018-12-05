
 
<%@ include file = "header.jsp" %>
<div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb button3">
         <li class="breadcrumb-item">
          <a href="index"><b>Home</b></a>   
        </li>
        <li class="breadcrumb-item active"><b><span style="color:white;">Dashboard</span></b></li>
          <span class="nav-link-text"></span>
      </ol>
       <!-- Icon Cards-->
      <div class="row" >
      
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-comments"></i>
              </div>
              <div class="mr-5">Departments</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="showDept.jsp">
              <span class="float-left">View</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-list"></i>
              </div>
              <div class="mr-5">Sub-Departments</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="showSubDept.jsp">
              <span class="float-left">View</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-success o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-shopping-cart"></i>
              </div>
              <div class="mr-5">Room,Rack & Shelfs</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="showRoomRackShelfs.jsp">
              <span class="float-left">View</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-danger o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-support"></i>
              </div>
              <div class="mr-5">List Of List</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="show_ListOfList.jsp">
              <span class="float-left">View</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
       
      </div>
         
          <br> 
          <div id="chartContainer" style="height: 500px; width: 100%;"></div>
<script src="resources/js//canvasjs.min.js"></script>
        
          
          </div>
          
         
       <script>
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light1", // "light1", "light2", "dark1", "dark2"
	title: {
		text: "Records Monitoring Graph"
	},
	subtitles: [{
		text: "",
		fontSize: 16
	}],
	axisY: {
		prefix: "",
		scaleBreaks: {
			customBreaks: [{
				startValue: 0,
				endValue: 2
			}]
		}
	},
	data: [{
		type: "column",
		yValueFormatString: "#,##0",
		dataPoints: [
			{ label: "Departments", y: 105 },
			{ label: "Sub-Departments", y: 461 },
			{ label: "Record Rooms", y: 02 },
			{ label: "Racks", y: 50 },
			{ label: "List Of List", y: 25000 },
			{ label: "List Details", y: 2500000 },
			{ label: "Meta Data", y: 20000000 },
			
		]
	}]
});
chart.render();

}
</script>  
          
            
<!--          <h1><marquee><span style="color:#FFC133;">U.P. STATE ARCHIVES ADMINISTRATIVE PANEL</span></marquee></h1> -->
   
    
    <%@ include file = "Footer.jsp" %>
 