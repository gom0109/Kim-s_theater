package myPkg;

public class TheaterBean {
	
	private int num;
	private String location;
	private int multiplexnum;
	private int seatnum;
	
	public TheaterBean() {
		
	}

	public TheaterBean(int num, String location, int multiplexnum, int seatnum) {
		super();
		this.num = num;
		this.location = location;
		this.multiplexnum = multiplexnum;
		this.seatnum = seatnum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getMultiplexnum() {
		return multiplexnum;
	}

	public void setMultiplexnum(int multiplexnum) {
		this.multiplexnum = multiplexnum;
	}

	public int getSeatnum() {
		return seatnum;
	}

	public void setSeatnum(int seatnum) {
		this.seatnum = seatnum;
	}
	
	

}
