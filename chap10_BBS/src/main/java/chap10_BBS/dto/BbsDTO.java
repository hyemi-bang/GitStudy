package chap10_BBS.dto;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class BbsDTO {

	private Integer bbsID;
	private String bbsTitle;
	private String userID;
	private Date bbsDate;
	private String bbsContent;
	private Integer bbsAvailable;
	
	public BbsDTO() {}	
	
	public BbsDTO(Integer bbsID, String bbsTitle, String userID, Date bbsDate, String bbsContent,
			Integer bbsAvailable) {
		this.bbsID = bbsID;
		this.bbsTitle = bbsTitle;
		this.userID = userID;
		this.bbsDate = bbsDate;
		this.bbsContent = bbsContent;
		this.bbsAvailable = bbsAvailable;
	}

	public Integer getBbsID() {
		return bbsID;
	}
	public void setBbsID(Integer bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public Date getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
	    // 이때 bbsDate는 문자열 형태로 전달되므로, 필요에 따라 Date로 변환
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    try {
	        this.bbsDate = new java.sql.Date(dateFormat.parse(bbsDate).getTime());
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public Integer getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(Integer bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	
	@Override
	public String toString() {
		return "BbsDTO [bbsID=" + bbsID + ", bbsTitle=" + bbsTitle + ", userID=" + userID + ", bbsDate=" + bbsDate
				+ ", bbsContent=" + bbsContent + ", bbsAvailable=" + bbsAvailable + "]";
	}
	
	
}
