package dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.mysql.jdbc.Connection;

public class DBConnection {
	
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/alacarta";
	private static Connection instance = null;
	
	private DBConnection() {
	}
	
	public static Connection getConnection() throws SQLException {
		if (instance == null) {
			Properties props = new Properties();
			props.put("user", "root");
			props.put("password", "");
			instance = (Connection) DriverManager.getConnection(JDBC_URL, props);
		}
		
		return instance;
	}

}