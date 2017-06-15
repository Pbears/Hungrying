package food.vo;

public class BrandVo {
	private int brandno;
	private String brandname;
	private int count;
	public BrandVo(int brandno, String brandname, int count) {
		super();
		this.brandno = brandno;
		this.brandname = brandname;
		this.count = count;
	}
	public BrandVo() {
		super();
	}
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "BrandVo [brandno=" + brandno + ", brandname=" + brandname + ", count=" + count + "]";
	}
	
	

	
}
