package myPkg;

public class MovieBean {
	private int movienum;
	private String theater;
	private String title;
	private String director;
	private String actor;
	private String poster;
	private String openDate;
	private String closeDate;
	private String runtime;
	
	
	public MovieBean() {
		
	}


	public MovieBean(int movienum, String theater, String title, String director, String actor, String poster,
			String openDate, String closeDate, String runtime) {
		super();
		this.movienum = movienum;
		this.theater = theater;
		this.title = title;
		this.director = director;
		this.actor = actor;
		this.poster = poster;
		this.openDate = openDate;
		this.closeDate = closeDate;
		this.runtime = runtime;
	}


	public int getMovienum() {
		return movienum;
	}


	public void setMovienum(int movienum) {
		this.movienum = movienum;
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


	public String getCloseDate() {
		return closeDate;
	}


	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}


	public String getRuntime() {
		return runtime;
	}


	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	
	
	

	
	
}
