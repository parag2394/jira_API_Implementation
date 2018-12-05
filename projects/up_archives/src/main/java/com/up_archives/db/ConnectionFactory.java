package com.up_archives.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class ConnectionFactory {
   
    private static ConnectionFactory instance = new ConnectionFactory();
    public static final String URL = "jdbc:postgresql://localhost:5432/uparchives";
    public static final String USER = "postgres";
    public static final String PASSWORD = "sa123";
    public static final String DRIVER_CLASS = "org.postgresql.Driver";
     
    //private constructor
    private ConnectionFactory() {
        try {
            Class.forName(DRIVER_CLASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
     
    private Connection createConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.out.println("ERROR: Unable to Connect to Database.");
        }
        return connection;
    }  
     
    public static Connection getConnection() {
        return instance.createConnection();
    }
}