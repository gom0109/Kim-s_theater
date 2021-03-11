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

import com.oreilly.servlet.MultipartRequest;

public class MovieDao {
	private static MovieDao instance;
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private MovieDao() {
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
	public static MovieDao getInstance() {
		if(instance == null) {
			instance = new MovieDao();
		}
		return instance;
	}
	
	public int insertMovie(MovieBean mbean) {
		int cnt=-1;
		String sql = "insert into dkmovie values(dkmovieseq.nextval,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mbean.getTheater());
			ps.setString(2, mbean.getTitle());
			ps.setString(3, mbean.getDirector());
			ps.setString(4, mbean.getActor());
			ps.setString(5, mbean.getPoster());
			ps.setString(6, mbean.getOpenDate());
			ps.setString(7, mbean.getCloseDate());
			ps.setString(8, mbean.getRuntime());
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
	public ArrayList<MovieBean> getAllMovie() {
		ArrayList<MovieBean>list = new ArrayList<MovieBean>();
		String sql = "select * from dkmovie";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int movienum = rs.getInt("movienum");
				String theater = rs.getString("theater");
				String title = rs.getString("title");
				String director = rs.getString("director");
				String actor = rs.getString("actor");
				String poster = rs.getString("poster");
				String openDate = rs.getString("openDate");
				String closeDate = rs.getString("closeDate");
				String runtime = rs.getString("runtime");
				
				MovieBean mbean = new MovieBean(movienum,theater, title, director, actor, poster, openDate,closeDate, runtime);
				list.add(mbean);
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
	
	public int deleteMovieByNum(int movienum) {
		int cnt=-1;
		String sql = "delete from dkmovie where movienum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, movienum);
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
	public MovieBean getMovieByNum(int movienum) {
		MovieBean mbean = null;
		String sql = "select * from dkmovie where movienum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, movienum);
			rs = ps.executeQuery();
			if(rs.next()) {
				
				String theater = rs.getString("theater");
				String title = rs.getString("title");
				String director = rs.getString("director");
				String actor = rs.getString("actor");
				String poster = rs.getString("poster");
				String openDate = rs.getString("openDate");
				String closeDate = rs.getString("closeDate");
				String runtime = rs.getString("runtime");
				
				mbean = new MovieBean(movienum,theater, title, director, actor, poster, openDate,closeDate, runtime);
				
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
		return mbean;
	}
	
	
	public int updateMovie(MovieBean mbean) {
		int cnt=-1;
		String sql = "update dkmovie set theater=? , title=? ,director=? , actor=? , poster=? , openDate=?,closeDate=?, runtime=? where movienum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mbean.getTheater());
			ps.setString(2, mbean.getTitle());
			ps.setString(3, mbean.getDirector());
			ps.setString(4, mbean.getActor());
			ps.setString(5, mbean.getPoster());
			ps.setString(6, mbean.getOpenDate());
			ps.setString(7, mbean.getCloseDate());
			ps.setString(8, mbean.getRuntime());
			ps.setInt(9, mbean.getMovienum());
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
	
	
	
	
	public MovieBean getMovieByTitle(String title) {
		MovieBean mbean =null;
		String sql = "select * from dkmovie where title = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			rs = ps.executeQuery();
			if(rs.next()) {
				int num = rs.getInt("num");
				String theater = rs.getString("theater");
				
				String director = rs.getString("director");
				String actor = rs.getString("actor");
				String poster = rs.getString("poster");
				String openDate = rs.getString("openDate");
				String closeDate = rs.getString("closeDate");
				String runtime = rs.getString("runtime");
				
				mbean = new MovieBean(num,theater, title, director, actor, poster, openDate,closeDate, runtime);
				
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
		//System.out.println(mbean.getTheater());
		return mbean;
	}
	
	
	public ArrayList<JoinlistBean> getAllInfoByLocation(String loc) {
		ArrayList<JoinlistBean> list = new ArrayList<JoinlistBean>();
		//System.out.println(loc);
		String sql = "select * from dkmovie mv inner join dktheater th on mv.theater = th.num where location = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, loc);
			rs = ps.executeQuery();
			while(rs.next()) {
				int movienum = rs.getInt("movienum");
				String theater = rs.getString("theater");
				String title = rs.getString("title");
				String director = rs.getString("director");
				String actor = rs.getString("actor");
				String poster = rs.getString("poster");
				String openDate = rs.getString("openDate");
				
				String runtime = rs.getString("runtime");
				String location = rs.getString("location");
				int multiplexnum = rs.getInt("multiplexnum");
				int seatnum = rs.getInt("seatnum");
				JoinlistBean jlb = new JoinlistBean(movienum,theater, title, director, actor, poster, openDate, runtime,  location, multiplexnum, seatnum);
				//System.out.println(jlb.getTitle());
				list.add(jlb);				
				//System.out.println("@@@"+num);
				//System.out.println(theater);
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
	
	public void deleteMovieByTheater(String num) {
		String sql ="delete from dkmovie where theater = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
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
	
	public ArrayList<JoinlistBean> getCurrentInfoByLocation(String loc, String today) {
		ArrayList<JoinlistBean> list = new ArrayList<JoinlistBean>();
		//System.out.println(loc);
		String sql = "select * from dkmovie mv inner join dktheater th on mv.theater = th.num where location = ? and opendate<=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, loc);
			ps.setString(2, today);
			rs = ps.executeQuery();
			while(rs.next()) {
				int movienum = rs.getInt("movienum");
				String theater = rs.getString("theater");
				String title = rs.getString("title");
				String director = rs.getString("director");
				String actor = rs.getString("actor");
				String poster = rs.getString("poster");
				String openDate = rs.getString("openDate");
				String runtime = rs.getString("runtime");
				String location = rs.getString("location");
				int multiplexnum = rs.getInt("multiplexnum");
				int seatnum = rs.getInt("seatnum");
				JoinlistBean jlb = new JoinlistBean(movienum,theater, title, director, actor, poster, openDate, runtime,  location, multiplexnum, seatnum);
				//System.out.println(jlb.getTitle());
				list.add(jlb);				
				//System.out.println("@@@"+num);
				//System.out.println(theater);
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
	public ArrayList<JoinlistBean> getFutureInfoByLocation(String loc, String today) {
		ArrayList<JoinlistBean> list = new ArrayList<JoinlistBean>();
		//System.out.println(loc);
		String sql = "select * from dkmovie mv inner join dktheater th on mv.theater = th.num where location = ? and opendate>?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, loc);
			ps.setString(2, today);
			rs = ps.executeQuery();
			while(rs.next()) {
				int movienum = rs.getInt("movienum");
				String theater = rs.getString("theater");
				String title = rs.getString("title");
				String director = rs.getString("director");
				String actor = rs.getString("actor");
				String poster = rs.getString("poster");
				String openDate = rs.getString("openDate");
				String runtime = rs.getString("runtime");
				String location = rs.getString("location");
				int multiplexnum = rs.getInt("multiplexnum");
				int seatnum = rs.getInt("seatnum");
				JoinlistBean jlb = new JoinlistBean(movienum,theater, title, director, actor, poster, openDate, runtime,  location, multiplexnum, seatnum);
				//System.out.println(jlb.getTitle());
				list.add(jlb);				
				//System.out.println("@@@"+num);
				//System.out.println(theater);
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
	
	public JoinlistBean getAllInfoByMovieNum(int movienum) {
		JoinlistBean jlb = null;
		
		//System.out.println(loc);
		String sql = "select * from dkmovie mv inner join dktheater th on mv.theater = th.num where movienum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, movienum);
			rs = ps.executeQuery();
			if(rs.next()) {
				
				String theater = rs.getString("theater");
				String title = rs.getString("title");
				String director = rs.getString("director");
				String actor = rs.getString("actor");
				String poster = rs.getString("poster");
				String openDate = rs.getString("openDate");
				String runtime = rs.getString("runtime");
				String location = rs.getString("location");
				int multiplexnum = rs.getInt("multiplexnum");
				int seatnum = rs.getInt("seatnum");
				jlb = new JoinlistBean(movienum,theater, title, director, actor, poster, openDate, runtime,  location, multiplexnum, seatnum);
				//System.out.println(jlb.getTitle());
								
				//System.out.println("@@@"+num);
				//System.out.println(theater);
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
		
		return jlb;
		
		
	}
	
	public int insertPreview(String theater,String title,String link) {
		int cnt=-1;
		String sql ="insert into dkmoviepreview values(dkmoviepreviewseq.nextval,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, theater);
			ps.setString(2, title);
			ps.setString(3, link);
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
	
	public String getlink(String title,String theater) {
		String link ="";
		String sql = "select * from dkmoviepreview where title=? and theater=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, theater);
			rs = ps.executeQuery();
			if(rs.next()) {
				link = rs.getString("link");
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
		
		return link;
	}
	
	public ArrayList<String> getLinkCount() {
		ArrayList<String>list = new ArrayList<String>();
		String sql = "select link from dkmoviepreview";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String link = rs.getString("link");
				list.add(link);
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
		//System.out.println(list.size());
		return list;
	}
	public void deleteLink(String theater,String title){
		String sql = "delete from dkmoviepreview where theater=? and title=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, theater);
			ps.setString(2, title);
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
	
	
}




























