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

public class EventDao {
	private static EventDao instance;
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private EventDao() {
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
	public static EventDao getInstance() {
		if(instance == null) {
			instance = new EventDao();
		}
		return instance;
	
	}
	
	public ArrayList<EventBean> getAll() {
		ArrayList<EventBean>list = new ArrayList<EventBean>();
		String sql = "select * from eventboard";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int boardNum = rs.getInt("boardNum");
				String boardTitle=rs.getString("boardTitle");
				String writedate=rs.getString("writedate");
				int readcount = rs.getInt("readcount");
				String bta=rs.getString("bta");
				
				EventBean bbean = new EventBean(boardNum,boardTitle , writedate, readcount, bta);
				list.add(bbean);
			}
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
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	public ArrayList<EventBean> getlist(int start, int end){
		ArrayList<EventBean> list = new ArrayList<EventBean>();
		
		String sql = "select boardNum, boardTitle, writedate, readcount, bta from (select rownum as rank,boardNum, boardTitle, writedate, readcount, bta from (select boardNum, boardTitle, writedate, readcount, bta from eventboard order by boardNum desc)) where rank between ? and ?";	
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				int boardNum = rs.getInt("boardNum");
				String boardTitle=rs.getString("boardTitle");
				String writedate=rs.getString("writedate");
				int readcount = rs.getInt("readcount");
				String bta=rs.getString("bta");
				
				EventBean bbean = new EventBean(boardNum,boardTitle , writedate, readcount, bta);
				list.add(bbean);
			}

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
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	public int insertBoard(String boardTitle ,String writedate ,String bta) {
		int cnt=-1;
		String sql = "insert into eventboard values(eventboardseq.nextval,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, boardTitle);
			ps.setString(2, writedate);
			ps.setInt(3, 0);
			ps.setString(4, bta);
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
	
	public EventBean getUpdateContent(int boardNum) {
		EventBean ebean = null;
		
		String sql = "select * from eventboard where boardNum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardNum);
			rs = ps.executeQuery();
			if(rs.next()) {
				String boardTitle=rs.getString("boardTitle");
				
				String writedate=rs.getString("writedate");
				int readcount = rs.getInt("readcount");
				String bta=rs.getString("bta");
				ebean = new EventBean(boardNum,boardTitle , writedate, readcount, bta);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}return ebean;
	}
	
	public EventBean getevent(int boardNum) {
		EventBean ebean = null;
		String sql2 = "update eventboard set readcount= readcount+1 where boardNum=?";
		String sql = "select * from eventboard where boardNum=?";
		try {
			ps = conn.prepareStatement(sql2);
			ps.setInt(1,boardNum);
			ps.executeUpdate();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardNum);
			rs = ps.executeQuery();
			if(rs.next()) {				
				String boardTitle=rs.getString("boardTitle");
				String writedate=rs.getString("writedate");
				int readcount = rs.getInt("readcount");
				String bta=rs.getString("bta");
				ebean = new EventBean(boardNum,boardTitle , writedate, readcount, bta);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}return ebean;
	}
	
	public int updateEvent(int boardNum,String boardTitle, String bta) {
		int cnt =-1;
		String sql = "update eventboard set boardTitle= ?, bta=? where boardNum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, boardTitle);
			ps.setString(2, bta);
			ps.setInt(3, boardNum);
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
	
	public int deleteEvent(int boardNum) {
		int cnt =-1;
		String sql = "delete from eventboard where boardNum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardNum);
			cnt=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}return cnt;
	}
}




































