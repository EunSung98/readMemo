package books;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class bookDao {
	// DB 연동에 필요한 JDBC 클래스 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void uploadBook(bookDo bdo,String userId) {
		System.out.println("uploadBook() 처리 시작");
		connect_cp();

		String sql = "insert into books(bookName,writer,date,content,memberId)"
		+" values(?,?,?,?,?)";
		
		LocalDate nowTime = LocalDate.now();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bdo.getBookName());
			pstmt.setString(2,bdo.getWriter());
			pstmt.setDate(3,Date.valueOf(nowTime));
			pstmt.setString(4,bdo.getContent());
			pstmt.setString(5,userId);
			pstmt.executeUpdate();
			
			System.out.println("uploadBook() 처리 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnect();
	}
	
	public bookDo goPage(String book,String userId) {
		System.out.println("goPage() 처리 시작");
		connect_cp();
		
		bookDo bdo = new bookDo();
		
		String sql = "select * from books where bookName=? and memberId=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bdo.setBookName(rs.getString(1));
				bdo.setWriter(rs.getString(2));
				bdo.setDate(rs.getTimestamp(3));
				bdo.setContent(rs.getString(4));
				bdo.setMemberId(rs.getString(5));
				System.out.println("goPage() 처리 완료");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disConnect();
		
		return bdo;
	}
	
	public void modifyBook(bookDo bdo,String book,String userId) {
		System.out.println("modifyBook() 처리 시작");
		
		//DB 연결
		connect_cp();
		
		//SQL 처리 루틴
		String sql = "update books set bookName=?,writer=?,date=?,content=? "
				+ "where bookName=? and memberId=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bdo.getBookName());
			pstmt.setString(2,bdo.getWriter());
			pstmt.setDate(3,Date.valueOf(java.time.LocalDate.now()));
			pstmt.setString(4,bdo.getContent());
			pstmt.setString(5, book);
			pstmt.setString(6, userId);
			pstmt.executeUpdate();
			System.out.println("modifyBook() 처리 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disConnect();
	}
	
	public void deleteBook(String book,String userId) {
		System.out.println("deleteBook() 처리 시작");
		connect_cp();

		String sql = "delete from books where bookName=? and memberId=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,book);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
			System.out.println("deleteBook() 처리 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disConnect();
	}
	
	public ArrayList<bookDo> getAll(String userId) {
		System.out.println(" getAll() 처리 시작");
		
		//DB 연결
		connect_cp();
		ArrayList<bookDo> bList = new ArrayList<bookDo>();
		
		//SQL 처리 루틴
		String sql = "select * from books where memberId=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bookDo bdo = new bookDo();
				bdo.setBookName(rs.getString(1));
				bdo.setWriter(rs.getString(2));
				bdo.setDate(rs.getTimestamp(3));
				bdo.setContent(rs.getString(4));
				bdo.setMemberId(rs.getString(5));

				bList.add(bdo);
			}
			System.out.println("getAll() 처리 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disConnect();
		
		return bList;
	}
	
	public void connect_cp() {
		try {
			//context 객체 생성
			Context initctx = new InitialContext();
			//context.xml 접근
			Context envctx = (Context) initctx.lookup("java:/comp/env");
			
			//'jdbc/pool' 이름의 커넥션 풀에 접근
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			//collection pool로부터 collection 하나 빌려오기
			conn = ds.getConnection();
			
			System.out.println("collection pool로부터 디비 연결 성공");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void disConnect() {
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}


