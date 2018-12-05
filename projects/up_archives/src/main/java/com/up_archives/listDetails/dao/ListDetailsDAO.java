package com.up_archives.listDetails.dao;

import java.util.List;

public interface ListDetailsDAO
{
public List getRackCodes();
public List getAllRacksInRoom(int roomnum);
public List getLocationCode(String loactionCode);
public List getAllListDetails();
public List updateListDetails(
	int record_id,
	int dept_id,
	int list_id,
	String doc_subject,
	int doc_year_from,
	int doc_year_to,
	int room_no,
	int rack_no,
	String location_code,
	String box_no,
	String file_no,
	int total_cover_no,
	String remark,
	String shelf_no
		);

public List removeListDetailsEntry(int record_id);

public List getAllListDetailsBySubDept(int dept_id);

   
}
