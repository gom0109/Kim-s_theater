package myPkg;

public class EventBean {
	
	private int boardNum;
	private String boardTitle;
	private String 	writedate;
	private int readcount;
	private String bta;
	public EventBean() {
		super();
	}
	public EventBean(int boardNum, String boardTitle, String writedate, int readcount, String bta) {
		super();
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.writedate = writedate;
		this.readcount = readcount;
		this.bta = bta;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
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
	
	
	
}
