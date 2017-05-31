package food.vo;

public class MenuVo {
	private String menuname;
	private int brandno;
	private int price;
	private String info;
	private String picture;

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public int getBrandno() {
		return brandno;
	}

	public void setBrandno(int brandno) {
		this.brandno = brandno;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "MenuVo [menuname=" + menuname + ", brandno=" + brandno + ", price=" + price + ", info=" + info
				+ ", picture=" + picture + "]";
	}
}
