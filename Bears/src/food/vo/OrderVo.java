package food.vo;

public class OrderVo {
	private int orderno;
	private String storename;
	private String menuname;
	private int price;
	private int quantity;
	private int mbsno;
	private String id;
	private String address;
	private String tel;
	private String name;
	private String info;

	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getMbsno() {
		return mbsno;
	}

	public void setMbsno(int mbsno) {
		this.mbsno = mbsno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Override
	public String toString() {
		return "OrderVo [orderno=" + orderno + ", storename=" + storename + ", menuname=" + menuname + ", price="
				+ price + ", quantity=" + quantity + ", mbsno=" + mbsno + ", id=" + id + ", address=" + address
				+ ", tel=" + tel + ", name=" + name + ", info=" + info + "]";
	}
}
