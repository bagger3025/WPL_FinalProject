package post;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Post {
	public Post() {}
	
	static public boolean doPost(int writer_id, String title, String content, String money) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("INSERT INTO post(writer_key, title, contents, money) VALUES (?, ?, ?, ?)");
			pst.setString(1, Integer.toString(writer_id));
			pst.setString(2, title);
			pst.setString(3, content);
			pst.setString(4,  money);
			pst.execute();
			pst.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	static public ArrayList<PostStruct> getPost(int writer_id){
		ArrayList<PostStruct> ps = new ArrayList<PostStruct>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM post WHERE writer_key=?");
			pst.setString(1, Integer.toString(writer_id));
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				PostStruct temp = new PostStruct(rs.getInt("key"), rs.getInt("writer_key"), rs.getString("title"), rs.getString("contents"), rs.getBoolean("finished"), rs.getInt("money"));
				ps.add(temp);
			}
			pst.close();
			return ps;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<PostStruct>();
	}
	
	static public ArrayList<PostStruct> getPostAll(){
		ArrayList<PostStruct> ps = new ArrayList<PostStruct>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM post");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				PostStruct temp = new PostStruct(rs.getInt("key"), rs.getInt("writer_key"), rs.getString("title"), rs.getString("contents"), rs.getBoolean("finished"), rs.getInt("money"));
				ps.add(temp);
			}
			pst.close();
			return ps;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<PostStruct>();
	}
	
	static public ArrayList<PostStruct> getUnfinished(){
		ArrayList<PostStruct> ps = new ArrayList<PostStruct>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM post WHERE post.finished=0");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				PostStruct temp = new PostStruct(rs.getInt("key"), rs.getInt("writer_key"), rs.getString("title"), rs.getString("contents"), rs.getBoolean("finished"), rs.getInt("money"));
				ps.add(temp);
			}
			pst.close();
			return ps;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<PostStruct>();
	}

	static public PostStruct getPostFromKey(String key) {
		PostStruct ps = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM post WHERE post.key=?");
			pst.setString(1, key);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				ps = new PostStruct(rs.getInt("key"), rs.getInt("writer_key"), rs.getString("title"), rs.getString("contents"), rs.getBoolean("finished"), rs.getInt("money"));
			} else {
				System.out.println("ps is null, couldn't find the post");
			}
			pst.close();
			return ps;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	static public boolean FinishPost(String key) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebDB?user=root&password=root!");
			PreparedStatement pst = conn.prepareStatement("UPDATE post SET post.finished=1 WHERE(post.key=?)");
			pst.setString(1, key);
			pst.execute();
			pst.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
