package myPkg;

public class MemberBean {
	private int num;
	private String id;
	private String password;
	private String name;
	private String birth;
	private String email;
	private int ssn1;
	private int ssn2;
	
	public MemberBean() {
		
	}

	public MemberBean(int num, String id, String password, String name, String birth, String email, int ssn1,
			int ssn2) {
		super();
		this.num = num;
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.ssn1 = ssn1;
		this.ssn2 = ssn2;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getSsn1() {
		return ssn1;
	}

	public void setSsn1(int ssn1) {
		this.ssn1 = ssn1;
	}

	public int getSsn2() {
		return ssn2;
	}

	public void setSsn2(int ssn2) {
		this.ssn2 = ssn2;
	}
	
	
	

}
