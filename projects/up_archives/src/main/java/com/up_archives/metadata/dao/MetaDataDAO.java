package com.up_archives.metadata.dao;

import java.util.List;

public interface MetaDataDAO {
	
	public List get_metadata_list_details(int deptid);
	
	public List get_metadata_list_details_by_id(int record_id);
	
	public List set_meta_data(
			
			 int p_list_id,
				String p_sub_list_id,
				int p_room_no,
				int p_dept_id,
				int p_sub_dept_id,
				int p_rack_no,
			    String p_shelf_no,
			    String p_box_no,
			    String p_file_no,
			    int p_total_cover_no,
			    int p_doc_year_from,
			    int p_doc_year_to,
			    String p_doc_path,
			    String p_doc_subject,
			    String p_remark,
			    String p_file_name
			    
			
			);
	
	public List set_doc_status(int record_id);
	
	public List show_documnet_metadata();
	
	
	public List update_metadata(
			int p_record_id,
			int p_list_id,
			String p_sub_list_id,
			String p_file_no,
		    int p_total_cover_no,
		    String p_doc_path
			
			);
	
	

}
