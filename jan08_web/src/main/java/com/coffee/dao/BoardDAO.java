package com.coffee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.coffee.db.DBConnection;
import com.coffee.dto.BoardDTO;
import com.coffee.dto.CommentDTO;
import com.coffee.util.Util;

public class BoardDAO extends AbstractDAO {

	public List<BoardDTO> boardList(int page) { // 게시판 첫 화면 나오도록
		List<BoardDTO> list = null;
		// DB 정보
		DBConnection db = DBConnection.getInstance();
		// conn 객체
		Connection con = null;
		// pstmt
		PreparedStatement pstmt = null;
		// ResultSet
		ResultSet rs = null;

		// sql
		String sql = "SELECT * FROM boardview LIMIT ?, 10";

		con = db.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (page - 1) * 10); // 수정해야함.
			rs = pstmt.executeQuery(); // executeQuery() : rs에 담을 결과가 옴.
			list = new ArrayList<BoardDTO>();

			while (rs.next()) {
				BoardDTO e = new BoardDTO();
				e.setNo(rs.getInt(1));
				e.setTitle(rs.getString(2));
				e.setWrite(rs.getString(3));
				e.setDate(rs.getString(4));
				e.setCount(rs.getInt(5));
				e.setComment(rs.getInt("comment"));
				list.add(e); // 위에 list = new ArrayList<BoardDTO>(); 만들어주기
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,pstmt,con); // close() 메소드를 만들어서 한 줄로 처리
		}
		return list;
	}


	public BoardDTO detail(int no) {
		BoardDTO dto = new BoardDTO();
		
		Connection con = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT b.board_no, b.board_title, b.board_content, m.mname as board_write, "
				+ "m.mid, b.board_date, b.board_ip, "
				+ "(SELECT COUNT(*) FROM visitcount WHERE board_no=b.board_no) AS board_count"
				+ " FROM board b JOIN member m ON b.mno=m.mno "
				+ "WHERE b.board_no=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no); // 서블릿에서 int 타입으로 가져왔음.
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getInt("board_no"));
				dto.setTitle(rs.getString("board_title"));
				dto.setContent(rs.getString("board_content"));
				dto.setWrite(rs.getString("board_write"));
				dto.setDate(rs.getString("board_date"));
				dto.setCount(rs.getInt("board_count"));
				dto.setMid(rs.getString("mid"));
				dto.setIp(rs.getString("board_ip"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	
	public int write(BoardDTO dto) {
		int result = 0;
		
		Connection con = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = null;
		// rs 필요없음. 
		String sql = "INSERT INTO board (board_title, board_content, mno, board_ip) "
				+ "VALUES (?, ?, (SELECT mno FROM member WHERE mid=?), ?)"; 
		
		System.out.println("------------"+dto.getMid());
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getMid()); 
			pstmt.setString(4, dto.getIp()); // ip 추가
			
			result = pstmt.executeUpdate(); // 영향받은 행을 result에 저장
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		return result;
	}

	
	// 240116 delete(no)에서 delete(BoardDTO dto)로 타입, 변수 변경
	
	public int delete(BoardDTO dto) {
		int result = 0;
		// conn
		Connection con = DBConnection.getInstance().getConnection();
		// pstmt
		PreparedStatement pstmt = null;
		// sql
		String sql = "UPDATE board SET board_del='0' WHERE board_no=? AND mno=(SELECT mno FROM member WHERE mid=?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			pstmt.setString(2, dto.getMid());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		return result;
	}

	public int update(BoardDTO dto) {
		int result = 0;
		Connection con = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE board SET board_title=?, board_content=? WHERE board_no=? "
				+ "AND mno=(SELECT mno FROM member WHERE mid=?)";
				
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNo());
			pstmt.setString(4, dto.getMid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		return result;

	}


	public int totalCount() {
		int result = 0;
		
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM boardview";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return result;
	}

		// 조회수 올리기
	public void countUp(int no, String mid) {
		
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM visitcount "
				+ "WHERE board_no=? AND mno=(SELECT mno FROM member WHERE mid=?)"; // 조회만 함.

		try {
		   pstmt = con.prepareStatement(sql);
		   pstmt.setInt(1, no);
		   pstmt.setString(2, mid);
		   pstmt.execute();
		   rs = pstmt.executeQuery();
		   
		   if(rs.next()) {
			   int result = rs.getInt(1);
			   if(result == 0) {
				   realCountUp(no, mid);
			   }
		   }
		
		} catch (SQLException e) {
		   e.printStackTrace();
		} finally {
		   close(null, pstmt, con);
		}
	}

		private void realCountUp(int no, String mid) {
			Connection con = db.getConnection();
			PreparedStatement pstmt = null;
			String sql = "INSERT INTO visitcount (board_no, mno) "
					+ "VALUES(?, (SELECT mno FROM member WHERE mid=?))";  // 진짜 조회수 저장
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.setString(2, mid);
				pstmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(null, pstmt, con);
			}
		}

		public List<CommentDTO> commentList(int no) {
			List<CommentDTO> list = new ArrayList<CommentDTO>();
			
			Connection con = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql="SELECT * FROM commentview WHERE board_no=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					CommentDTO dto = new CommentDTO();
					dto.setCno(rs.getInt("cno"));
					dto.setBoard_no(rs.getInt("board_no"));
					dto.setComment(rs.getString("ccomment"));
					dto.setCdate(rs.getString("cdate"));
					dto.setMno(rs.getInt("mno")); // view 만들어서 mname, mid 가져와야 함.
					dto.setMid(rs.getString("mid"));
					dto.setMname(rs.getString("mname"));
					dto.setClike(rs.getInt("clike"));
					dto.setIp(Util.ipMasking(rs.getString("cip")));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs, pstmt, con);
			}
			return list;
		}
}
