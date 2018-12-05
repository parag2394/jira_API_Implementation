package com.up_archives.metadata.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import com.up_archives.listDetails.daoImpl.AccesslistDetailsDAO;
import com.up_archives.metadata.daoImpl.AccessMetaDataDAO;


@Controller
public class MetaDataController {

	String rack;
	private static String UPLOAD_DIRECTORY ="D:\\UP_ARCHIVES\\";
	 int listid;
	 String deptnamee;
	 String docsubject;
	 int roomno;
	 String f_roomno;
	 int rackno;
	 String f_rack_no;
	 String locationcode;
	 String locationcode1="";
	 String boxno;
	 String fileno;
	 int totalcover_no;
	 String folder;
	 String subfolder;
	 String internalsubfolder;
	 String shelf_no;
	 String sub_list_id;
	 int dept_id;
	 int sub_dept_id;
	 int doc_year_from;
	 int doc_year_to;
	 String remark;
	 String doc_path;
	
	@RequestMapping("/GetLocationCode")
	public void getSpecifiedLocationCode(
			@RequestParam("roomnum")String roomnum,
			@RequestParam("racknum")String racknum,
			@RequestParam("sf_no")String sf_no,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        int new_Rack=Integer.parseInt(racknum.trim());        
        if(new_Rack<=9)
        {
        	rack="00"+racknum.trim();
        }
        else
        {
        	rack="0"+racknum.trim();
        }
        
		String room="R"+roomnum.trim();
		
		String locationCode=room+rack+sf_no.trim();
		System.out.println(locationCode);
		AccesslistDetailsDAO ad=new AccesslistDetailsDAO();
		
		List<Object[]> l=ad.getLocationCode(locationCode);
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(l);
		out.write(element.toString());
		
	}
	
	@RequestMapping("/getMetaDataListDetailsInfo")
	public void getMetaDataListDetails(
			@RequestParam("deptid")int deptid,
			HttpServletRequest request,
			HttpServletResponse response
			) throws Throwable
	{
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        AccessMetaDataDAO amd=new AccessMetaDataDAO();
        List<Object[]> l=amd.get_metadata_list_details(deptid);
        Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(l);
		out.write(element.toString());

        
        
	}
	
	
	@RequestMapping(value="savefile",method=RequestMethod.POST)  
    public ModelAndView saveimage( @RequestParam CommonsMultipartFile file, 
    		@RequestParam("hffilecount")int record_id,
           HttpSession session) throws Exception{  
  
	
		System.out.println("Record id is........................................ :"+record_id);
			AccessMetaDataDAO amda=new AccessMetaDataDAO();
			List<Object[]> list=amda.get_metadata_list_details_by_id(record_id);
			for(Object[] obj:list)
			{
				 listid=(Integer) obj[0];
				 deptnamee=String.valueOf(obj[1]);
				 docsubject=String.valueOf(obj[2]);
				 roomno=(Integer) obj[3];
				 rackno=(Integer) obj[4];
				 locationcode=String.valueOf(obj[5]);
				 boxno=String.valueOf(obj[6]);
				 fileno=String.valueOf(obj[7]);
				 totalcover_no=(Integer) obj[8];
				 shelf_no=String.valueOf(obj[9]);
				 sub_list_id=String.valueOf(obj[10]);
				 dept_id=(Integer) obj[11];
				 sub_dept_id=(Integer) obj[12];
				 doc_year_from=(Integer) obj[13];
				 doc_year_to=(Integer) obj[14];
				 remark=String.valueOf(obj[15]);
				 
			}
			
		f_roomno="R"+String.valueOf(roomno);
		f_rack_no=f_roomno+"_"+"RACK"+String.valueOf(rackno);
		
			
			 System.out.println("listid "+listid);
			 System.out.println("deptnamee "+deptnamee);
			 System.out.println("docsubject "+docsubject);
			 System.out.println("roomno "+roomno);
			 System.out.println("rackno "+rackno);
			 System.out.println("locationcode "+locationcode);
			 System.out.println("boxno "+boxno);
			 System.out.println("fileno "+fileno);
			 System.out.println("totalcover_no "+totalcover_no);
			 System.out.println("f_roomno "+f_roomno);
			 System.out.println("f_rack_no "+f_rack_no);
			 System.out.println("Shelf_no "+shelf_no);
			
		/////////// create folders /////////////////
			 
			 if(f_roomno.equals("R1"))
			 {
			 
			 folder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no;
			 
			 Path folder_path=Paths.get(folder);
			 
			 /////if Rack Directory Not Exists. /////////
			 if(!Files.exists(folder_path))
					 {
				 
				 Files.createDirectories(folder_path);
				 System.out.println("Rack Directory created");
				
				 
				 /////check Location directory////
				 locationcode1=f_rack_no+"_SHELF_"+shelf_no;
				 subfolder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\"+locationcode1;
				 Path path1=Paths.get(subfolder);
				 
				/////if Location Directory Not Exists. /////////
				 if(!Files.exists(path1))
				 {
					 Files.createDirectories(path1);
					 System.out.println("Location Directory created");
					 
					 /////check internal sub directory////
					 internalsubfolder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\"+locationcode1+"\\"+"B_"+boxno;
					 
			
					 Path path2=Paths.get(internalsubfolder);
					 
					/////if Box Directory Not Exists. /////////
					 if(!Files.exists(path2))
					 {
						 Files.createDirectories(path2);
						 System.out.println("Box Directory created");
						 UPLOAD_DIRECTORY=internalsubfolder+"//";
					 }
					 else
					 {
						 System.out.println("Box Directory Alredy exists");
						 UPLOAD_DIRECTORY=internalsubfolder+"//";
					 }
					/////internal sub directory ends here////
					
				 }
				 else
				 {
					
					 
					 System.out.println("LocationCode Directory alredy exists");
					 internalsubfolder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\"+locationcode1+"\\"+"B_"+boxno;
					 Path path2=Paths.get(subfolder);
					 
					////if Box Directory not present /////////	 
					 if(!Files.exists(path2))
					 {
						 Files.createDirectories(path2);
						 System.out.println("Box Sub Directory created");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
					 else
					 {
						 System.out.println("Box Sub Directory Alredy Exist");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
				 }
				 
				 /////sub directory ends here////
				 
				 
					 }
			 else
			 {
				 System.out.println("Rack Directory alredy exists");
				 
				 locationcode1=f_rack_no+"_SHELF_"+shelf_no;
				 subfolder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\"+locationcode1;
				 Path path1=Paths.get(subfolder);
				 
				
			////if location code folder not present /////////	 
				 if(!Files.exists(path1))
				 {
					 Files.createDirectories(path1);
					 System.out.println("Locationcode Directory created");
					 
					 /////check internal sub directory////
					 internalsubfolder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\"+locationcode1+"\\"+"B_"+boxno;
					 
				
					 Path path2=Paths.get(internalsubfolder);
					 
					 /////if box directory not present ////////////
					 if(!Files.exists(path2))
					 {
						 Files.createDirectories(path2);
						 System.out.println("Box Directory created");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
					 else
					 {
						 System.out.println("Box Directory Alredy exists");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
					/////internal sub directory ends here////
					
				 }
				 else
				 {
					 System.out.println("LocationCode Directory alredy exists");
					 internalsubfolder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\"+locationcode1+"\\"+"B_"+boxno;
					 Path path2=Paths.get(subfolder);
					 
					////if Box Directory not present /////////	 
					 if(!Files.exists(path2))
					 {
						 Files.createDirectories(path2);
						 System.out.println("Box Sub Directory created");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
					 else
					 {
						 System.out.println("Box Directory Alredy Exist");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
				 }
				 
			 }
			 
			 
			 }
			 
			 
		/*	 if(f_roomno.equals("R1"))
			 {
			 
			 folder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no;
			 
			 Path folder_path=Paths.get(folder);
			 if(!Files.exists(folder_path))
					 {
				 
				 Files.createDirectories(folder_path);
				 System.out.println("Directory created");
				// UPLOAD_DIRECTORY="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\";
				 
				 /////check sub directory////
				 locationcode1=f_rack_no+"_SHELF_"+shelf_no;
				 subfolder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\"+locationcode1;
				 
				// subfolder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\"+locationcode;
				 Path path1=Paths.get(subfolder);
				 if(!Files.exists(path1))
				 {
					 Files.createDirectories(path1);
					 System.out.println("Sub Directory created");
					 
					 /////check internal sub directory////
					 internalsubfolder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\"+locationcode1+"\\"+"B_"+boxno; 
					 
					// internalsubfolder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\"+locationcode+"\\"+"B_"+boxno;
					 Path path2=Paths.get(internalsubfolder);
					 if(!Files.exists(path2))
					 {
						 Files.createDirectories(path2);
						 System.out.println("Internal Sub Directory created");
						 UPLOAD_DIRECTORY=internalsubfolder+"//";
					 }
					 else
					 {
						 System.out.println("Internal Sub Directory Alredy exists");
						 UPLOAD_DIRECTORY=internalsubfolder+"//";
					 }
					/////internal sub directory ends here////
					
				 }
				 else
				 {
					 System.out.println("Sub Directory alredy exists");
				 }
				 
				 /////sub directory ends here////
				 
				 
					 }
			 else
			 {
				 System.out.println("Directory alredy exists");
				 subfolder="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\"+locationcode;
				 Path path1=Paths.get(subfolder);
				 if(!Files.exists(path1))
				 {
					 Files.createDirectories(path1);
					 System.out.println("Sub Directory created");
					
				 }
				 else
				 {
					 System.out.println("Sub Directory alredy exists");
				 }
				 
			 }
			 }
			 
			 */
			///////////////checking for ROOM 2 ///////////// 
		/*	 if(f_roomno.equals("R2"))
			 {
			 
			 folder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no;
			 
			 Path folder_path=Paths.get(folder);
			 if(!Files.exists(folder_path))
					 {
				 
				 Files.createDirectories(folder_path);
				 System.out.println("Directory created");
				// UPLOAD_DIRECTORY="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\";
				 subfolder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no+"\\"+locationcode;
				 Path path1=Paths.get(subfolder);
				 if(!Files.exists(path1))
				 {
					 Files.createDirectories(path1);
					 System.out.println("Sub Directory created");
					
				 }
				 else
				 {
					 System.out.println("Sub Directory alredy exists");
				 }
				 
				 
					 }
			 else
			 {
				 System.out.println("Directory alredy exists");
				 subfolder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no+"\\"+locationcode;
				 Path path1=Paths.get(subfolder);
				 if(!Files.exists(path1))
				 {
					 Files.createDirectories(path1);
					 System.out.println("Sub Directory created");
					
				 }
				 else
				 {
					 System.out.println("Sub Directory alredy exists");
				 }
				 
			 }
			 }
			 */
			 
			 
			 
			 
			 if(f_roomno.equals("R2"))
			 {
			 
			 folder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no;
			 
			 Path folder_path=Paths.get(folder);
			 
			 /////if Rack Directory Not Exists. /////////
			 if(!Files.exists(folder_path))
					 {
				 
				 Files.createDirectories(folder_path);
				 System.out.println("Rack Directory created");
				// UPLOAD_DIRECTORY="D:\\UP_ARCHIVES\\R1\\"+f_rack_no+"\\";
				 
				 /////check Location directory////
				 locationcode1=f_rack_no+"_SHELF_"+shelf_no;
				 subfolder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no+"\\"+locationcode1;
				 Path path1=Paths.get(subfolder);
				 
				/////if Location Directory Not Exists. /////////
				 if(!Files.exists(path1))
				 {
					 Files.createDirectories(path1);
					 System.out.println("Location Directory created");
					 
					 /////check internal sub directory////
					 internalsubfolder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no+"\\"+locationcode1+"\\"+"B_"+boxno;
					 
				//	 internalsubfolder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no+"\\"+locationcode+"\\"+"B_"+boxno;
					 Path path2=Paths.get(internalsubfolder);
					 
					/////if Box Directory Not Exists. /////////
					 if(!Files.exists(path2))
					 {
						 Files.createDirectories(path2);
						 System.out.println("Box Directory created");
						 UPLOAD_DIRECTORY=internalsubfolder+"//";
					 }
					 else
					 {
						 System.out.println("Box Directory Alredy exists");
						 UPLOAD_DIRECTORY=internalsubfolder+"//";
					 }
					/////internal sub directory ends here////
					
				 }
				 else
				 {
					
					 
					 System.out.println("LocationCode Directory alredy exists");
					 internalsubfolder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no+"\\"+locationcode1+"\\"+"B_"+boxno;
					 Path path2=Paths.get(internalsubfolder);
					 
					////if Box Directory not present /////////	 
					 if(!Files.exists(path2))
					 {
						 Files.createDirectories(path2);
						 System.out.println("Box Sub Directory created");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
					 else
					 {
						 System.out.println("Box Sub Directory Alredy Exist");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
				 }
				 
				 /////sub directory ends here////
				 
				 
					 }
			 else
			 {
				 System.out.println("Rack Directory alredy exists");
				 
				 locationcode1=f_rack_no+"_SHELF_"+shelf_no;
				 subfolder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no+"\\"+locationcode1;
				 Path path1=Paths.get(subfolder);
				 
				
			////if location code folder not present /////////	 
				 if(!Files.exists(path1))
				 {
					 Files.createDirectories(path1);
					 System.out.println("Locationcode Directory created");
					 
					 /////check internal sub directory////
					 internalsubfolder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no+"\\"+locationcode1+"\\"+"B_"+boxno;
					 
				//	 internalsubfolder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no+"\\"+locationcode+"\\"+"B_"+boxno;
					 Path path2=Paths.get(internalsubfolder);
					 
					 /////if box directory not present ////////////
					 if(!Files.exists(path2))
					 {
						 Files.createDirectories(path2);
						 System.out.println("Box Directory created");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
					 else
					 {
						 System.out.println("Box Directory Alredy exists");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
					/////internal sub directory ends here////
					
				 }
				 else
				 {
					 System.out.println("LocationCode Directory alredy exists");
					 internalsubfolder="D:\\UP_ARCHIVES\\R2\\"+f_rack_no+"\\"+locationcode1+"\\"+"B_"+boxno;
					 Path path2=Paths.get(internalsubfolder);
					 
					////if Box Directory not present /////////	 
					 if(!Files.exists(path2))
					 {
						 Files.createDirectories(path2);
						 System.out.println("Box Sub Directory created");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
					 else
					 {
						 System.out.println("Box Directory Alredy Exist");
						 UPLOAD_DIRECTORY=internalsubfolder+"\\";
					 }
				 }
				 
			 }
			 
			 
			 }
			 
		///////////////////////////////////////////	 
		
		
		ModelAndView mv=new ModelAndView();
		
		
    ServletContext context = session.getServletContext();  
    String path = context.getRealPath(UPLOAD_DIRECTORY);  
    
    String filename = file.getOriginalFilename();  
  
    //System.out.println(path+" "+filename);
    System.out.println(UPLOAD_DIRECTORY+""+filename);     
    doc_path=UPLOAD_DIRECTORY+filename;
    System.out.println("Record id is :"+record_id);
    byte[] bytes = file.getBytes();  
    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
        // new File(path + File.separator + filename)));  
    new File(UPLOAD_DIRECTORY + File.separator + filename)));  
    stream.write(bytes);  
    stream.flush();  
    stream.close();  
   
    /////////////store metadata in postgres /////////////
    try
    {
    	String pdfFileName =file.getOriginalFilename();
    	
    	List<Object[]> list1=amda.set_meta_data(listid,sub_list_id,
    		roomno, dept_id, sub_dept_id, rackno, shelf_no,
    			boxno, fileno, totalcover_no, doc_year_from, doc_year_to,
    			doc_path, docsubject, remark,pdfFileName);
    	
    }
    catch(Exception e)
    {
    e.printStackTrace();	
    }
    
    
    
    //////////store pdf file in mongoDB //////////////
	try {

		Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("uparchives");
		
		DBCollection collection = db.getCollection("legacy_files");

		//String newFileName = "uparchives-image13";
		String newFileName =file.getOriginalFilename();

	//	File imageFile = new File("C:\\Users\\asus\\Desktop\\UPSA Backup\\SMS-5122.PNG");
		File imageFile = new File(doc_path);
		
		// create a "photo" namespace
		GridFS gfsPhoto = new GridFS(db, "legacy_files");

		// get image file from local drive
		GridFSInputFile gfsFile = gfsPhoto.createFile(imageFile);
	//	GridFSInputFile gfsFile = gfsPhoto.createFile(imageFile);

		// set a new filename for identify purpose
		gfsFile.setFilename(newFileName);
		gfsFile.setContentType(file.getContentType());
		gfsFile.put("doc_subject",docsubject);
		gfsFile.put("file_no",fileno);
		gfsFile.put("cover_no",totalcover_no);
		gfsFile.put("doc_record_id",record_id);
		gfsFile.put("path", doc_path);
		

		// save the image file into mongoDB
		gfsFile.save();

	/*	// print the result
		DBCursor cursor = gfsPhoto.getFileList();
		while (cursor.hasNext()) {
			System.out.println(cursor.next());
		
		}
*/
		// get image file by it's filename
	//	GridFSDBFile imageForOutput = gfsPhoto.findOne(newFileName);

		// save it into a new image file
	//	imageForOutput.writeTo("C:\\Users\\asus\\Desktop\\UPSA Backup\\new_video.MKV");

		// remove the image file from mongoDB
	//gfsPhoto.remove(gfsPhoto.findOne(newFileName));

		System.out.println("Done");
       mongo.close();
	} catch (UnknownHostException e) {
		e.printStackTrace();
	} catch (MongoException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	
    /////////////////////////////////////////////////
    
	
	try
	{
		List<Object[]> list2=amda.set_doc_status(record_id);	
	} 
	catch (Exception e) {
		e.printStackTrace();
	}
    
    
    
    mv.setViewName("fileUploadSuccess.jsp");
           
    return mv;  
    } 
	
	
	//////////////////////////////////////
	
	/////////////FETCH META DATA////////////
	
	
	@RequestMapping("/fetchMetaDataDocument")
	public void retrieveDocument(
			@RequestParam("file_name")String file_name,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
		System.out.println("Controller Called");
		System.out.println("fILE nAME IS"+file_name);
		
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        try {

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("uparchives");
			
			DBCollection collection = db.getCollection("legacy_files");
		
			// create a "photo" namespace
			GridFS gfsPhoto = new GridFS(db, "legacy_files");


			// get image file by it's filename
			GridFSDBFile imageForOutput = gfsPhoto.findOne(file_name);
		
			System.out.println("File Name is "+imageForOutput.getFilename());
			
			
			// save it into a new image file
	//File file=new File("..\\src\\main\\webapp\\resources\\temp_pdf_files\\"+imageForOutput.getFilename());
		
		/////Use the below file code only with production environment/////////////	
			 File file=new File("webapps\\up_archives\\resources\\temp_pdf_files\\"+imageForOutput.getFilename());
		//////////////////////////
			System.out.println(file.getAbsolutePath());
			imageForOutput.writeTo(file);
			
			Thread t=new Thread();
			t.sleep(1000);
			
			String file_path="resources/temp_pdf_files/"+file_name;
			
			  Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(file_path);
				out.write(element.toString());

			System.out.println("Done");
mongo.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
        
	}
	
	
	
	//////////
	
	
	@RequestMapping("/removeTempMetaDataDocument")
	public void removeDocument(
			@RequestParam("file_name")String file_name,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
		System.out.println("Remove Controller Called");
		System.out.println("fILE nAME IS"+file_name);
		
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        try {

			


			 File file=new File("webapps\\up_archives\\resources\\temp_pdf_files\\"+file_name);
		//////////////////////////
			file.delete();
	
			
			Thread t=new Thread();
			t.sleep(1000);
			int status=0;
			if(file.exists())
			{
			status=0;
			System.out.println("File Not Removed");
			}
			else
			{
				status=1;
				System.out.println("File Successfully Removed");
			}
			
			  Gson gson = new Gson();
				JsonElement element = gson.toJsonTree(status);
				out.write(element.toString());

			

		} catch (Exception e) {
			e.printStackTrace();
		} 
        
	}
	
	
	//////////////////////////update meta data ////////////////
	
	
	
	@RequestMapping("/updatefile")
	public void updateMetaData(
			@RequestParam("record_id")int record_id,
			@RequestParam("list_id")int list_id,
			@RequestParam("sub_list_id")String sub_list_id,
			@RequestParam("cover_no")int cover_no,
			@RequestParam("file_no")String file_no,
			@RequestParam CommonsMultipartFile file,
			HttpServletRequest request,
			HttpServletResponse response,
			 HttpSession session) throws IOException
	{
		
		
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        AccessMetaDataDAO amda=new AccessMetaDataDAO();
		List<Object[]> list=amda.get_metadata_list_details_by_id(record_id);
		for(Object[] obj:list)
		{
			 listid=(Integer) obj[0];
			 deptnamee=String.valueOf(obj[1]);
			 docsubject=String.valueOf(obj[2]);
			 roomno=(Integer) obj[3];
			 rackno=(Integer) obj[4];
			 locationcode=String.valueOf(obj[5]);
			 boxno=String.valueOf(obj[6]);
			 fileno=String.valueOf(obj[7]);
			 totalcover_no=(Integer) obj[8];
			 shelf_no=String.valueOf(obj[9]);
			 sub_list_id=String.valueOf(obj[10]);
			 dept_id=(Integer) obj[11];
			 sub_dept_id=(Integer) obj[12];
			 doc_year_from=(Integer) obj[13];
			 doc_year_to=(Integer) obj[14];
			 remark=String.valueOf(obj[15]);
			 
		}
		
		ModelAndView mv=new ModelAndView();
		
		
	    ServletContext context = session.getServletContext();  
	    String path = context.getRealPath(doc_path);  
	    String filename = file.getOriginalFilename();  
	  
	    //System.out.println(path+" "+filename);
	    
	    doc_path=doc_path+filename;
	    
	    byte[] bytes = file.getBytes();  
	    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
	        // new File(path + File.separator + filename)));  
	    new File(doc_path + File.separator + filename)));  
	    stream.write(bytes);  
	    stream.flush();  
	    stream.close();  
	   
	    /////////////store metadata in postgres /////////////
	    try
	    {
	    	String pdfFileName =file.getOriginalFilename();
	    	
	    	List<Object[]> list1=amda.update_metadata(record_id, list_id, sub_list_id, file_no, cover_no, doc_path);
	    	
	    }
	    catch(Exception e)
	    {
	    e.printStackTrace();	
	    }
	    
		
     
        
	}
	
	
	
	

}
