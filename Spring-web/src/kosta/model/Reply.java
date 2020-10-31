package kosta.model;

import java.io.Serializable;

public class Reply implements Serializable {
	private int r_no;
	private String r_title;
	private String r_writer;
	private String r_contents;
	private String r_regdate;
	private int seq;
	
	public Reply() {}

	public Reply(int r_no, String r_title, String r_writer, String r_contents, String r_regdate, int seq) {
		super();
		this.r_no = r_no;
		this.r_title = r_title;
		this.r_writer = r_writer;
		this.r_contents = r_contents;
		this.r_regdate = r_regdate;
		this.seq = seq;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public String getR_contents() {
		return r_contents;
	}

	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}

	public String getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(String r_regdate) {
		this.r_regdate = r_regdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	
}
