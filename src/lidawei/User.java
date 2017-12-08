package lidawei;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class User {
	
	Connection con;
	Statement sql;
	ResultSet rs;
	
	public void conSql(){
		
		try {
			//1.使用MySql的JDBC驱动程序 
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			//2.连接数据库
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lidawei?user=root&password=asdfghjkl;'&useUnicode=true&characterEncoding=utf-8");
			//3.创建Statement对象
			sql = con.createStatement();
			
		}catch (SQLException e1) {
			e1.printStackTrace();
		}
	}
	
	public ResultSet Login(String no,String name) throws SQLException{
		conSql();
		rs = sql.executeQuery("SELECT * FROM t_user");
		return rs; 
	}
	
	private String username;
	private String password;

	public User() {
		username = "";
		password = "";
    }

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
