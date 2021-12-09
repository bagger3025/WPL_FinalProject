package post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class PostContactme {
	public PostContactme() {}
	
	static public boolean post(String title, String message, String userkey) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("INSERT INTO contactme(userkey, title, message) VALUES (?, ?, ?)");
			pst.setString(1, userkey);
			pst.setString(2, title);
			pst.setString(3, message);
			pst.execute();
			pst.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
