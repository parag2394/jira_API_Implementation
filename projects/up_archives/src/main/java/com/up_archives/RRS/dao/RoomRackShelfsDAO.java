package com.up_archives.RRS.dao;

import java.util.List;

public interface RoomRackShelfsDAO {
	
	public List getRoomRackShelfs();
	public void updateRoomRackShelfs(int r_id,int room_no,int rack_no,int total_shelf,int total_box_in_single_shelfs);
	public void deleteRoomRackShelfs(int r_id);
	public int get_availableRacks(int roomnum);
	public void generateLocationCode(int totalsubshelf,int totalshelf,int roomnum,int racknum);

}
