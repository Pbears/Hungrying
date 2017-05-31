package food.vo;

public class MenuByStoreVo {
	private String mbsno;
	private String storename;
	private String menuname;

	public String getMbsno() {
		return mbsno;
	}

	public void setMbsno(String mbsno) {
		this.mbsno = mbsno;
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

	@Override
	public String toString() {
		return "MenuByStoreVo [mbsno=" + mbsno + ", storename=" + storename + ", menuname=" + menuname + "]";
	}
}
