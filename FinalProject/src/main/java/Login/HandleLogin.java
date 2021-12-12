package Login;

import java.sql.DriverManager;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class HandleLogin {
	public HandleLogin() {
	}

	static public userStruct MatchLogin(String username, String password) {
		String _username = username;
		String _password = password;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement(
					"SELECT users.key,users.user_id,users.password,users.first_name,users.last_name,gubuns.gubun from users JOIN gubuns ON users.gubun=gubuns.key where users.user_id=? and users.password=?");
			pst.setString(1, _username);
			pst.setString(2, _password);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				userStruct us = new userStruct(rs.getInt("key"), rs.getString("user_id"), rs.getString("password"),
						rs.getString("first_name"), rs.getString("last_name"), rs.getString("gubun"));
				return us;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	static public userStruct MatchID(String username) {
		String _username = username;
		// username should not be empty
		assert (!username.equals(""));

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement(
					"SELECT users.key,users.user_id,users.password,users.first_name,users.last_name,gubuns.gubun from users JOIN gubuns ON users.gubun=gubuns.key where users.user_id=?");
			pst.setString(1, _username);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				userStruct us = new userStruct(rs.getInt("key"), rs.getString("user_id"), rs.getString("password"),
						rs.getString("first_name"), rs.getString("last_name"), rs.getString("gubun"));
				return us;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	static public userStruct MatchKey(String userkey) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement(
					"SELECT users.key,users.user_id,users.password,users.first_name,users.last_name,gubuns.gubun from users JOIN gubuns ON users.gubun=gubuns.key where users.key=?");
			pst.setString(1, userkey);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				userStruct us = new userStruct(rs.getInt("key"), rs.getString("user_id"), rs.getString("password"),
						rs.getString("first_name"), rs.getString("last_name"), rs.getString("gubun"));
				return us;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	static private String getGubun(String gubun) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("SELECT gubuns.key from gubuns WHERE gubuns.gubun=?");
			pst.setString(1, gubun);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return Integer.toString(rs.getInt("key"));
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "-1";
	}

	static public boolean Register(String username, String password, String FirstName, String LastName, String gubun) {
		try {
			String gubunkey = getGubun(gubun);
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement(
					"INSERT INTO users (user_id, password, first_name, last_name, gubun) VALUES (?, ?, ?, ?, ?)");
			pst.setString(1, username);
			pst.setString(2, password);
			pst.setString(3, FirstName);
			pst.setString(4, LastName);
			pst.setString(5, gubunkey);
			pst.execute();
			pst.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
