package chap06.model;

//피자에대한 정보를 담아놓기 위해 이런 타입의 클래스를 만들고 있는것
//데이터 클래스(모델, dto, vo ,...)라고 한다.
//컬렉션(리스트 등)과 함께 사용하면서 데이터를 담아놓기 위한 용도의 클래스 
public class PizzaOrder {

	String size;
	int qty;
	
	
	public PizzaOrder(String size, int qty) {
		
		this.qty = qty;
		this.size = size;
	}
	
	public String getSize() {
		return size;
	}
	
	public int getQty() {
		return qty;
	}
	
	@Override
	public String toString() {
		return String.format("<li>%s,%d판</li>",size,qty);
	}
}
