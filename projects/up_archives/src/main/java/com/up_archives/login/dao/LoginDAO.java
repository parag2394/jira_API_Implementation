package com.up_archives.login.dao;

import java.util.List;

public interface LoginDAO {
	
	public List authenticate_user(String username,String password);

}
