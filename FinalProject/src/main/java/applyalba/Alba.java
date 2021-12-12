package applyalba;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Login.HandleLogin;
import Login.userStruct;
import post.PostStruct;

public class Alba {
	public Alba() {
	}

	static public boolean isappliedAlba(String postkey, String employeekey) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn
					.prepareStatement("SELECT * FROM apply WHERE apply.post_key=? and apply.user_key=?");
			pst.setString(1, postkey);
			pst.setString(2, employeekey);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				pst.close();
				return true;
			} else {
				pst.close();
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	static public boolean applyAlba(String postkey, String employeekey) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("INSERT INTO apply(post_key, user_key) VALUES (?, ?)");
			pst.setString(1, postkey);
			pst.setString(2, employeekey);
			pst.execute();
			pst.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	static public ArrayList<userStruct> getapplyList(String postkey) {
		try {
			ArrayList<userStruct> ps = new ArrayList<userStruct>();
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM apply WHERE apply.post_key=?");
			pst.setString(1, postkey);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				userStruct us_temp = HandleLogin.MatchKey(Integer.toString(rs.getInt("user_key")));
				if (us_temp == null) {
					return new ArrayList<userStruct>();
				}
				ps.add(us_temp);
			}
			pst.close();
			return ps;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<userStruct>();
	}
}
