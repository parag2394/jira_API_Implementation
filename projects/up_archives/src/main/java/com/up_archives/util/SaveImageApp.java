package com.up_archives.util;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.UnknownHostException;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;

/**
 * Java MongoDB : Save image example
 * 
 */

public class SaveImageApp {
	@SuppressWarnings("deprecation")
	public static void main(String[] args) {

	/*	try {

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("uparchives");
			
			DBCollection collection = db.getCollection("legacy_files");

			//String newFileName = "uparchives-image13";
			String newFileName = "upsa_video_file1";

		//	File imageFile = new File("C:\\Users\\asus\\Desktop\\UPSA Backup\\SMS-5122.PNG");
			File imageFile = new File("C:\\Users\\asus\\Desktop\\UPSA Backup\\Sartaj Virk - Channa _ Latest Punjabi Song 2015 _ Lyrics - Garry Sandhu - YouTube.MKV");
			
			// create a "photo" namespace
			GridFS gfsPhoto = new GridFS(db, "legacy_files");

			// get image file from local drive
			GridFSInputFile gfsFile = gfsPhoto.createFile(imageFile);
		//	GridFSInputFile gfsFile = gfsPhoto.createFile(imageFile);

			// set a new filename for identify purpose
			gfsFile.setFilename(newFileName);
			gfsFile.setContentType("pdf");
			gfsFile.put("doc_id", 1);
			
		

			// save the image file into mongoDB
			gfsFile.save();

			// print the result
			DBCursor cursor = gfsPhoto.getFileList();
			while (cursor.hasNext()) {
				System.out.println(cursor.next());
			
			}

			// get image file by it's filename
			GridFSDBFile imageForOutput = gfsPhoto.findOne(newFileName);

			// save it into a new image file
		//	imageForOutput.writeTo("C:\\Users\\asus\\Desktop\\UPSA Backup\\new_video.MKV");

			// remove the image file from mongoDB
		//gfsPhoto.remove(gfsPhoto.findOne(newFileName));

			System.out.println("Done");

		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (MongoException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
*/
		
		try {

			Mongo mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("uparchives");
			
			DBCollection collection = db.getCollection("legacy_files");

			//String newFileName = "uparchives-image13";
			String newFileName = "October_2018_MPR_RAVI.pdf";

		//	File imageFile = new File("C:\\Users\\asus\\Desktop\\UPSA Backup\\SMS-5122.PNG");
		//	File imageFile = new File("C:\\Users\\asus\\Desktop\\UPSA Backup\\Sartaj Virk - Channa _ Latest Punjabi Song 2015 _ Lyrics - Garry Sandhu - YouTube.MKV");
			
			// create a "photo" namespace
			GridFS gfsPhoto = new GridFS(db, "legacy_files");

			// get image file from local drive
	//		GridFSInputFile gfsFile = gfsPhoto.createFile(imageFile);
		//	GridFSInputFile gfsFile = gfsPhoto.createFile(imageFile);

			// set a new filename for identify purpose
	//		gfsFile.setFilename(newFileName);
	//		gfsFile.setContentType("pdf");
	//		gfsFile.put("doc_id", 1);
			
		

			// save the image file into mongoDB
	//		gfsFile.save();

			// print the result
			DBCursor cursor = gfsPhoto.getFileList();
			while (cursor.hasNext()) {
				System.out.println(cursor.next());
			
			}

			// get image file by it's filename
			GridFSDBFile imageForOutput = gfsPhoto.findOne(newFileName);
			
			System.out.println("File Name is"+imageForOutput.getFilename());
			// save it into a new image file
			File file=new File(".\\src\\main\\webapp\\resources\\temp_pdf_files\\"+imageForOutput.getFilename());
			System.out.println(file.getAbsolutePath());
			imageForOutput.writeTo(file);
			
	//	imageForOutput.writeTo("\\resources\\temp_pdf_files\\"+newFileName);
				;
			// remove the image file from mongoDB
		//gfsPhoto.remove(gfsPhoto.findOne(newFileName));

			System.out.println("Done");
mongo.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
	}
	
}

