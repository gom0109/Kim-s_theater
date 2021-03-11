package myPkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	private static MemberDao instance;
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private MemberDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");// java:/comp/env는 내부적으로 존재하는 폴더 이곳에 초기설정정보(Context.xml)를 집어넣는다.
			DataSource ds = (DataSource) envContext.lookup("jdbc/OracleDB");// Context.xml의 내용중 jdbc/OracleDB 라는 이름을 가진 정보
			conn = ds.getConnection();
			//System.out.println("conn : "+ conn);
		} catch (NamingException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	public static MemberDao getInstance() {
		if(instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}
	
	public MemberBean selectById(String inid){
		MemberBean bean = null;
		String sql = "select * from moviemembers where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, inid);
			rs = ps.executeQuery();
			if(rs.next()) {
				int num =rs.getInt("num");
				String id = rs.getString("id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String email = rs.getString("email");
				int ssn1 =rs.getInt("ssn1");
				int ssn2 =rs.getInt("ssn2");
				bean = new MemberBean(num, id, password, name, birth, email, ssn1, ssn2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return bean;
	}
	public int joinid(MemberBean mbean){
		int cnt=-1;
		String sql = "insert into moviemembers values(moviememberseq.nextval,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mbean.getId());
			ps.setString(2, mbean.getPassword());
			ps.setString(3, mbean.getName());
			ps.setString(4, mbean.getBirth());
			ps.setString(5, mbean.getEmail());
			ps.setInt(6, mbean.getSsn1());
			ps.setInt(7, mbean.getSsn2());
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {			
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return cnt;
	}
	public String loginCheck(String id, String password){
		String tid = null;
		String sql = "select * from moviemembers where id=? and password = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if(rs.next()) {
				tid = rs.getString("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return tid;
	
		
	}
	public int updateid(String id,String password,String email,int ssn1,int ssn2) {
		System.out.println(id);
		System.out.println(password);
		System.out.println(email);
		System.out.println(ssn1);
		System.out.println(ssn2);
		int cnt=-1;
		String sql = "update moviemembers set password = ?, email=?, ssn1=?, ssn2=? where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, email);
			ps.setInt(3, ssn1);
			ps.setInt(4, ssn2);
			ps.setString(5, id);
			cnt= ps.executeUpdate();
			System.out.println(cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {			
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return cnt;
	}
	public int goodBye(String id) {
		int cnt=-1;
		String sql= "delete from moviemembers where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			cnt=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {			
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return cnt;
		
	}
	
	public ArrayList<String> allId() {
		ArrayList<String> list= new ArrayList<String>();
		
		String sql = "select id from moviemembers order by id";
		try {
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				list.add(id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return list;
	}
	
	public ArrayList<MemberBean> selectAll() {
		ArrayList<MemberBean> list = new ArrayList<MemberBean>();
		String sql = "select * from moviemembers";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int num =rs.getInt("num");
				String id = rs.getString("id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String email = rs.getString("email");
				int ssn1 =rs.getInt("ssn1");
				int ssn2 =rs.getInt("ssn2");
				MemberBean bean = new MemberBean(num, id, password, name, birth, email, ssn1, ssn2);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return list;
	}
	
	public String findMember(String name,String email) {
		String id= null;
		String sql = "select id from moviemembers where name =? and email =?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			rs= ps.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return id;
	}
	
	public String findPassword(String name,String id,String email) {
		String password=null;
		String sql = "select password from moviemembers where name =? and id=? and email =?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, id);
			ps.setString(3, email);
			rs = ps.executeQuery();
			if(rs.next()) {
				password = rs.getString("password");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return password;
	}
	

}



































