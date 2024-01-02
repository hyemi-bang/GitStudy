package chap07_T.dto;

public class BreadDTO {

	private String bread_name;
	private Integer bread_price;
	
	public BreadDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public BreadDTO(String bread_name) {
		this.bread_name = bread_name;
	}
	
	
	public BreadDTO(String bread_name, Integer bread_price) {
		this.bread_name = bread_name;
		this.bread_price = bread_price;
	}
	
	public String getBread_name() {
		return bread_name;
	}
	public void setBread_name(String bread_name) {
		this.bread_name = bread_name;
	}
	public Integer getBread_price() {
		return bread_price;
	}
	public void setBread_price(Integer bread_price) {
		this.bread_price = bread_price;
	}
	
	
}
