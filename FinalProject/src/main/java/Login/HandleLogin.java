package Login;
import java.sql.DriverManager;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class HandleLogin {
	public HandleLogin() {}
	
	static public userStruct MatchLogin(String username, String password) {
		String _username = username;
		String _password = password;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("SELECT users.key,users.user_id,users.password,users.first_name,users.last_name,gubuns.gubun from users JOIN gubuns ON users.gubun=gubuns.key where users.user_id=? and users.password=?");
			pst.setString(1, _username);
			pst.setString(2, _password);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				userStruct us = new userStruct(rs.getInt("key"), rs.getString("user_id"), rs.getString("password"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("gubun"));
				return us;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
