package Login;

public class userStruct {
	public int key;
	public String user_id;
	public String first_name;
	public String last_name;
	public String gubun;
	
	private String password;
	
	public userStruct(int _key, String _user_id, String _password, String _first_name, String _last_name, String _gubun) {
		key = _key;
		user_id = _user_id;
		password = _password;
		first_name = _first_name;
		last_name = _last_name;
		gubun = _gubun;
	}
	
	public boolean isPassword(String _password) {
		return password.equals(_password);
	}
	
	public String toString() {
		return "key: "+ key + ", userid: " + user_id + ", password: " + password + ", firstname: " + first_name + ", lastname: " + last_name + ", gubun: " + gubun;
	}
	
}
