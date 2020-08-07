package dbcoon;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class Dbconn {

	/**
	 * 数据库连接类
	 * @author DY1101shaoyuxian
	 */
	static String user="root";
	static String password="123456";
	static String url="jdbc:mysql://localhost:3306/cov?useUnicode=true&characterEncoding=utf8";
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConn() {
		Connection con=null;
		try {
			con=DriverManager.getConnection(url,user,password);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	public void closeCon(Connection con) {
		// TODO Auto-generated method stub
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		try {
			Dbconn.getConn();
			System.out.println("数据库连接成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		List list = new ArrayList();
		Connection conn=getConn();
		String sql = "select * from news where title=?";
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1,"直播：河南省新冠肺炎疫情防控专题第二十五场新闻发布会");
			ResultSet rs = psmt.executeQuery();
			// Student(stId,stName,stSex,stAge,stTel,stDept,stAddress)
			while (rs.next()) {
				String id = rs.getString("id");
				String title = rs.getString("title");
				String source = rs.getString("source");
				String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("date"));
				String CommentCount = rs.getString("CommentCount");
				String sourceurl=rs.getString("sourceurl");
				System.out.println(id+","+CommentCount+","+title+","+source+","+date+","+sourceurl);
	}
			System.out.println("jiesu");
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

}
}