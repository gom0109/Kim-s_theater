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

public class TheaterDao {
	private static TheaterDao instance;
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private TheaterDao() {
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
	public static TheaterDao getInstance() {
		if(instance == null) {
			instance = new TheaterDao();
		}
		return instance;
	}
	public int insertData(TheaterBean tbean) {
		int cnt=-1;
		String sql = "insert into dktheater values(dktheaterseq.nextval,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, tbean.getLocation());
			ps.setInt(2, tbean.getMultiplexnum());
			ps.setInt(3, tbean.getSeatnum());
			cnt= ps.executeUpdate();
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
	
	public ArrayList<TheaterBean> getAllTheater() {
		ArrayList<TheaterBean> list = new ArrayList<TheaterBean>();
		String sql = "select * from dktheater order by num";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String location = rs.getString("location");
				int multiplexnum = rs.getInt("multiplexnum");
				int seatnum = rs.getInt("seatnum");
				TheaterBean tbean = new TheaterBean(num,location,multiplexnum,seatnum);
				list.add(tbean);
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
			}
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return list;
	}
	public ArrayList<TheaterBean> getAllByLocation(String location) {
		ArrayList<TheaterBean> list = new ArrayList<TheaterBean>();
		String sql = "select * from dktheater where location=? order by multiplexnum"  ;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, location);
			rs = ps.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				
				int multiplexnum = rs.getInt("multiplexnum");
				int seatnum = rs.getInt("seatnum");
				TheaterBean tbean = new TheaterBean(num,location,multiplexnum,seatnum);
				list.add(tbean);
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
			}
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return list;
	}
	
	public int deleteTheaterByNum(int num) {
		int cnt=-1;
		String sql = "delete from dktheater where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
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
	public TheaterBean getAllByNum(int num) {
		//System.out.println(num);
		TheaterBean tbean = null;
		String sql = "select * from dktheater where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				//System.out.println("aaaaaaaaaa");
				String location = rs.getString("location");		
				int multiplexnum = rs.getInt("multiplexnum");
				int seatnum = rs.getInt("seatnum");
				//System.out.println(location);
				tbean = new TheaterBean(num,location,multiplexnum,seatnum);
				
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
			}
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		//System.out.println(tbean.getLocation());
		return tbean;
		
	}
	
	
	public int updateTheater(TheaterBean tbean) {
		int cnt=-1;
		String sql = "update dktheater set location =?, multiplexnum=?, seatnum=? where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, tbean.getLocation());
			ps.setInt(2, tbean.getMultiplexnum());
			ps.setInt(3, tbean.getSeatnum());
			ps.setInt(4, tbean.getNum());
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
	
	public ArrayList<String> getlocation() {
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select distinct location from dktheater";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("location"));
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
			}
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		return list;
	}
	
}



















