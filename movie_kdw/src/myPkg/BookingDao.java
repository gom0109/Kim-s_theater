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

public class BookingDao {
	private static BookingDao instance;
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private BookingDao() {
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
	public static BookingDao getInstance() {
		if(instance == null) {
			instance = new BookingDao();
		}
		return instance;
	
	}
	
	public int insertBookData(BookingBean bbean) {
		int count = 0;
		String temp = bbean.getSeat();
		String [] seat = temp.split(" ");
		for(int i=0;i<seat.length;i++){
			//System.out.println(seat[i]);
			String sql = "insert into bookingmovie values(bookingmovieseq.nextval,?,?,?,?,?,?,?)";
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, bbean.getId());
				ps.setString(2, bbean.getPaytime());
				ps.setInt(3,bbean.getMnum());
				ps.setString(4, bbean.getBookingDate());
				ps.setString(5, bbean.getTime());
				ps.setString(6, seat[i]);
				ps.setInt(7,bbean.getPrice());
				count += ps.executeUpdate();
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
			
		}
		return count;
	}
	
	public ArrayList<String> getBookedSeat(int num, String bookingDate, String time) {
		ArrayList<String> list= new ArrayList<String>();
		String sql = "select seat from bookingmovie where mnum=? and bookingdate=? and time=?";
		//System.out.println(num);
		//System.out.println(bookingDate);
		//System.out.println(time);
		try {
			ps= conn.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, bookingDate);
			ps.setString(3, time);
			rs = ps.executeQuery();
			while(rs.next()) {
				String seat = rs.getString("seat");
				System.out.println(seat);
				list.add(seat);
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
	
	public ArrayList<BookingBean> getInfoById(String id,String today) {
		ArrayList<BookingBean> list = new ArrayList<BookingBean>();
		String sql = "select * from bookingmovie where id = ? and bookingDate>=? order by bookingDate";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, today);
			rs = ps.executeQuery();
			while(rs.next()) {
				int bookingnum=rs.getInt("bookingnum");
				String paytime = rs.getString("paytime");
				int mnum=rs.getInt("mnum");
				String bookingDate = rs.getString("bookingDate");
				String time = rs.getString("time");
				String seat = rs.getString("seat");
				int price=rs.getInt("price");
				BookingBean bbean = new BookingBean(bookingnum, id, paytime, mnum, bookingDate, time, seat, price);
				list.add(bbean);
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
	public void deleteBookingByMnum(int num) {
		String sql = "delete from bookingmovie where mnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1,num);
			ps.executeUpdate();
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
	}
	
	public int deleteByBookingum(int bookingnum) {
		int cnt =-1;
		String sql ="delete from bookingmovie where bookingnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bookingnum);
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
	
	public void deleteBookingById(String id) {
		String sql = "delete from bookingmovie where id =?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BookingBean> getAllBooking() {
		ArrayList<BookingBean> list = new ArrayList<BookingBean>();
		String sql = "select * from bookingmovie bookingDate order by bookingnum desc";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int bookingnum=rs.getInt("bookingnum");
				String id = rs.getString("id");
				String paytime = rs.getString("paytime");
				int mnum=rs.getInt("mnum");
				String bookingDate = rs.getString("bookingDate");
				String time = rs.getString("time");
				String seat = rs.getString("seat");
				int price=rs.getInt("price");
				BookingBean bbean = new BookingBean(bookingnum, id, paytime, mnum, bookingDate, time, seat, price);
				list.add(bbean);
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
