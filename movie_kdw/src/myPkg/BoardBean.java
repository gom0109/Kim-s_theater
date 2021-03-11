package myPkg;

public class BoardBean {
	private int boardNum;
	private String writer;
	private String boardTitle;
	private String boardpw;
	private String writedate;
	private int readcount;
	private String bta;
	private int starPoint;
	private int ref;
	private int re_step;
	private int re_level;
	
	
	
	public BoardBean() {
		super();
	}



	public BoardBean(int boardNum, String writer, String boardTitle, String boardpw, String writedate, int readcount,
			String bta, int starPoint, int ref, int re_step, int re_level) {
		super();
		this.boardNum = boardNum;
		this.writer = writer;
		this.boardTitle = boardTitle;
		this.boardpw = boardpw;
		this.writedate = writedate;
		this.readcount = readcount;
		this.bta = bta;
		this.starPoint = starPoint;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
	}



	public int getBoardNum() {
		return boardNum;
	}



	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getBoardTitle() {
		return boardTitle;
	}



	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}



	public String getBoardpw() {
		return boardpw;
	}



	public void setBoardpw(String boardpw) {
		this.boardpw = boardpw;
	}



	public String getWritedate() {
		return writedate;
	}



	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}



	public int getReadcount() {
		return readcount;
	}



	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}



	public String getBta() {
		return bta;
	}



	public void setBta(String bta) {
		this.bta = bta;
	}



	public int getStarPoint() {
		return starPoint;
	}



	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}



	public int getRef() {
		return ref;
	}



	public void setRef(int ref) {
		this.ref = ref;
	}



	public int getRe_step() {
		return re_step;
	}



	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}



	public int getRe_level() {
		return re_level;
	}



	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	

	


	
	
	
	
}
