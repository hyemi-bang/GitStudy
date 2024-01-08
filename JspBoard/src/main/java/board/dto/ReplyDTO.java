package board.dto;

import java.util.Date;

public class ReplyDTO {

	private Integer reply_id; // PK
	private Integer board_id; // FK
	private String reply_writer;
	private String reply_content;
	private String reply_password;
	private Integer good_count;
	private Integer bad_count;
	private Date reply_date;
	
	public ReplyDTO(Integer reply_id, Integer board_id, String reply_writer, String reply_content,
			String reply_password, Integer good_count, Integer bad_count, Date reply_date) {
		this.reply_id = reply_id;
		this.board_id = board_id;
		this.reply_writer = reply_writer;
		this.reply_content = reply_content;
		this.reply_password = reply_password;
		this.good_count = good_count;
		this.bad_count = bad_count;
		this.reply_date = reply_date;
	}
	
	public Integer getReply_id() {
		return reply_id;
	}
	public void setReply_id(Integer reply_id) {
		this.reply_id = reply_id;
	}
	public Integer getBoard_id() {
		return board_id;
	}
	public void setBoard_id(Integer board_id) {
		this.board_id = board_id;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_password() {
		return reply_password;
	}
	public void setReply_password(String reply_password) {
		this.reply_password = reply_password;
	}
	public Integer getGood_count() {
		return good_count;
	}
	public void setGood_count(Integer good_count) {
		this.good_count = good_count;
	}
	public Integer getBad_count() {
		return bad_count;
	}
	public void setBad_count(Integer bad_count) {
		this.bad_count = bad_count;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	
}
