package food.vo;

public class BrandVo {
	private int brandno;
	private String brandname;

	public int getBrandno() {
		return brandno;
	}

	public void setBrandno(int brandno) {
		this.brandno = brandno;
	}

	public String getBrandname() {
		return brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}

	@Override
	public String toString() {
		return "BrandVo [brandno=" + brandno + ", brandname=" + brandname + "]";
	}
}
