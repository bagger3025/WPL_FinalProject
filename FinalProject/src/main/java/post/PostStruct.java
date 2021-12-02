package post;

public class PostStruct {
	public int key;
	public int writer_key;
	public String title;
	public String contents;
	public boolean finished;
	public PostStruct(int _key, int _writer_key, String _title, String _contents, boolean _finished) {
		key = _key;
		writer_key = _writer_key;
		title = _title;
		contents = _contents;
		finished = _finished;
	}
}
