package myPkg;

public class BookingBean {

	private int bookingnum;
	private String id;
	private String paytime;
	private int mnum;
	private String bookingDate;
	private String time;
	private String seat;
	private int price;
	
	public BookingBean() {
		
	}

	public BookingBean(int bookingnum, String id, String paytime, int mnum, String bookingDate, String time,
			String seat, int price) {
		super();
		this.bookingnum = bookingnum;
		this.id = id;
		this.paytime = paytime;
		this.mnum = mnum;
		this.bookingDate = bookingDate;
		this.time = time;
		this.seat = seat;
		this.price = price;
	}

	public int getBookingnum() {
		return bookingnum;
	}

	public void setBookingnum(int bookingnum) {
		this.bookingnum = bookingnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPaytime() {
		return paytime;
	}

	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
	
}
