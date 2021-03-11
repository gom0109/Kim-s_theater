package myPkg;

public class JoinlistBean {
	
	private int num;
	private String theater;
	private String title;
	private String director;
	private String actor;
	private String poster;
	private String openDate;
	private String runtime;
	private String location;
	private int multiplexnum;
	private int seatnum;
	
	public JoinlistBean() {
		
	}

	public JoinlistBean(int num, String theater, String title, String director, String actor, String poster,
			String openDate, String runtime, String location, int multiplexnum, int seatnum) {
		super();
		this.num = num;
		this.theater = theater;
		this.title = title;
		this.director = director;
		this.actor = actor;
		this.poster = poster;
		this.openDate = openDate;
		this.runtime = runtime;
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

	public String getTheater() {
		return theater;
	}

	public void setTheater(String theater) {
		this.theater = theater;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
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
