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



public class BoardDao {
	private static BoardDao instance;
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private BoardDao() {
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
	public static BoardDao getInstance() {
		if(instance == null) {
			instance = new BoardDao();
		}
		return instance;
	
	}
	
	public int insertBoard(BoardBean bbean) {
		int cnt=-1;
		String sql = "insert into dkmovieboard values(dkmovieboardseq.nextval,?,?,?,?,?,?,?,dkmovieboardseq.currval,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bbean.getWriter());
			ps.setString(2, bbean.getBoardTitle());
			ps.setString(3, bbean.getBoardpw());
			ps.setString(4, bbean.getWritedate());
			ps.setInt(5, bbean.getReadcount());
			ps.setString(6, bbean.getBta());
			ps.setInt(7, bbean.getStarPoint());
			ps.setInt(8, bbean.getRe_step());
			ps.setInt(9, bbean.getRe_level());
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
	
	public ArrayList<BoardBean> getAll() {
		ArrayList<BoardBean>list = new ArrayList<BoardBean>();
		String sql = "select * from dkmovieboard";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int boardNum = rs.getInt("boardNum");
				String writer=rs.getString("writer");
				String boardTitle=rs.getString("boardTitle");
				String boardpw=rs.getString("boardpw");
				String writedate=rs.getString("writedate");
				int readcount = rs.getInt("readcount");
				String bta=rs.getString("bta");
				int starPoint = rs.getInt("starPoint");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				BoardBean bbean = new BoardBean(boardNum,writer,boardTitle , boardpw, writedate, readcount, bta,starPoint, ref, re_step, re_level);
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
	
	public ArrayList<BoardBean> getlist(int start, int end){
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		
		String sql = "select boardNum, writer, boardTitle, boardpw, writedate, readcount, bta,starPoint, ref, re_step, re_level from (select rownum as rank, boardNum, writer, boardTitle, boardpw, writedate,readcount,bta,starPoint, ref, re_step, re_level from (select boardNum, writer, boardTitle, boardpw, writedate, readcount, bta,starPoint, ref, re_step, re_level from dkmovieboard order by ref desc, re_step asc)) where rank between ? and ?";	
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				int boardNum = rs.getInt("boardNum");
				String writer=rs.getString("writer");
				String boardTitle=rs.getString("boardTitle");
				String boardpw=rs.getString("boardpw");
				String writedate=rs.getString("writedate");
				int readcount = rs.getInt("readcount");
				String bta=rs.getString("bta");
				int starPoint = rs.getInt("starPoint");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				BoardBean bbean = new BoardBean(boardNum,writer,boardTitle , boardpw, writedate, readcount, bta,starPoint, ref, re_step, re_level);
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
	public BoardBean getContent(int boardNum) {
		BoardBean bbean = null;
		String sql2 = "update dkmovieboard set readcount= readcount+1 where boardNum=?";
		String sql = "select * from dkmovieboard where boardNum=?";
		try {
			ps = conn.prepareStatement(sql2);
			ps.setInt(1,boardNum);
			ps.executeUpdate();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardNum);
			rs = ps.executeQuery();
			if(rs.next()) {				
				String writer=rs.getString("writer");
				String boardTitle=rs.getString("boardTitle");
				String boardpw=rs.getString("boardpw");
				String writedate=rs.getString("writedate");
				int readcount = rs.getInt("readcount");
				String bta=rs.getString("bta");
				int starPoint = rs.getInt("starPoint");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				bbean = new BoardBean(boardNum,writer,boardTitle , boardpw, writedate, readcount, bta,starPoint, ref, re_step, re_level);
				
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
		}return bbean;
	}
	
	public BoardBean getUpdateContent(int boardNum) {
		BoardBean bbean = null;
		
		String sql = "select * from dkmovieboard where boardNum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardNum);
			rs = ps.executeQuery();
			if(rs.next()) {				
				String writer=rs.getString("writer");
				String boardTitle=rs.getString("boardTitle");
				String boardpw=rs.getString("boardpw");
				String writedate=rs.getString("writedate");
				int readcount = rs.getInt("readcount");
				String bta=rs.getString("bta");
				int starPoint = rs.getInt("starPoint");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				bbean = new BoardBean(boardNum,writer,boardTitle , boardpw, writedate, readcount, bta,starPoint, ref, re_step, re_level);
				
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
		}return bbean;
	}
	
	public int updateContent(BoardBean bbean) {
		
		int cnt =-1;
		String sql = "update dkmovieboard set boardTitle=?,  bta=?, starPoint=? where boardNum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bbean.getBoardTitle());
			ps.setString(2, bbean.getBta());
			ps.setInt(3, bbean.getStarPoint());
			ps.setInt(4, bbean.getBoardNum());
			cnt= ps.executeUpdate();
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
	
	public int deleteContent(int boardNum) {
		int cnt =-1;
		String sql = "delete from dkmovieboard where boardNum=?";
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
	public int insertReply(BoardBean bbean) {
		int cnt=-1;
		String sql = "update dkmovieboard set re_step = re_step+1 where ref=? and re_step>? ";
		String sql2 = "insert into dkmovieboard values(dkmovieboardseq.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bbean.getRef());
			ps.setInt(2, bbean.getRe_step());
			ps.executeUpdate();
			ps = conn.prepareStatement(sql2);
			ps.setString(1, bbean.getWriter());
			ps.setString(2, bbean.getBoardTitle());
			ps.setString(3, bbean.getBoardpw());
			ps.setString(4, bbean.getWritedate());
			ps.setInt(5, bbean.getReadcount());
			ps.setString(6, bbean.getBta());
			ps.setInt(7, bbean.getStarPoint());
			ps.setInt(8, bbean.getRef());
			ps.setInt(9, bbean.getRe_step()+1);
			ps.setInt(10, bbean.getRe_level()+1);
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


 





















