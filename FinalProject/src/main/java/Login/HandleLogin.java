package Login;
import java.sql.DriverManager;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class HandleLogin {
	public HandleLogin() {
		
	}
	
	public ArrayList MatchLogin(String id, String password) {
		ArrayList loginList = new ArrayList();
		String username = id;
		String _password = password;
		String SQLQuery = "SELECT * FROM Login WHERE login=?";
		String firstName;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("SELECT user_name,password,fisrt_name from users where user_name=? and password=?");
			pst.setString(1, username);
			pst.setString(2, _password);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				firstName = rs.getString("first_name");
			} else {
				firstName = "";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return loginList;
	}
}
