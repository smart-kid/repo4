package dao.impl;

import dbcoon.Dbconn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;



import model.news;

import dao.newsdao;
import model.news;

public class newsdaoimpl implements newsdao {
	private Connection conn = Dbconn.getConn();
	private Connection con = Dbconn.getConn();
	public List findNewsBytext(String searchtext) {
		List searchlist = new ArrayList();
		String sql = "select * from news where title like concat('%',?,'%') order by CommentCount desc";
		try {
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, searchtext);
		ResultSet rs = psmt.executeQuery();
		while (rs.next()) {
			String sql2="select * from images where sourceurl=?";
			String newsId = rs.getString("id");
			String newsTitle = rs.getString("title");
			String newsDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("date"));
			String newsSource = rs.getString("source");
			String abstract_text = rs.getString("abstract");
			String newsArticle = rs.getString("article");
			String newsCommentcount = rs.getString("CommentCount");
			String newsSourceurl = rs.getString("sourceurl");
			PreparedStatement psmt2 = con.prepareStatement(sql2);
			psmt2.setString(1,newsSourceurl);
			ResultSet rs2 = psmt2.executeQuery();
			String imgsrc;
			if(rs2.next())
				imgsrc=rs2.getString("imgsrc");
			else
				imgsrc="";
			news news1 = new news(newsId, newsTitle,newsSource,newsDate,abstract_text,newsArticle,newsCommentcount,newsSourceurl,imgsrc);
			searchlist.add(news1);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return searchlist;
}
	public List AllNewsSelect() {
		List list = new ArrayList();
		String sql = "select * from news order by date desc";
		try {
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		while (rs.next()) {
			String sql2="select * from images where sourceurl=?";
			String newsId = rs.getString("id");
			String newsTitle = rs.getString("title");
			String newsDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("date"));
			String newsSource = rs.getString("source");
			String abstract_text = rs.getString("abstract");
			String newsArticle = rs.getString("article");
			String newsCommentcount = rs.getString("CommentCount");
			String newsSourceurl = rs.getString("sourceurl");
			try {
			PreparedStatement psmt2 = con.prepareStatement(sql2);
			psmt2.setString(1, newsSourceurl);
			ResultSet rs2 = psmt2.executeQuery();
			String imgsrc;
			if(rs2.next())
				imgsrc=rs2.getString("imgsrc");
			else
				imgsrc="";
			news news1 = new news(newsId, newsTitle,newsSource,newsDate,abstract_text,newsArticle,newsCommentcount,newsSourceurl,imgsrc);
			list.add(news1);
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return list;
	}
	public List showTop(){
		List list = new ArrayList();
		String sql = "select * from news order by CommentCount desc limit 10";
		try {
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		while (rs.next()) {
			String sql2="select * from images where sourceurl=?";
			String newsId = rs.getString("id");
			String newsTitle = rs.getString("title");
			String newsDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("date"));
			String newsSource = rs.getString("source");
			String abstract_text = rs.getString("abstract");
			String newsArticle = rs.getString("article");
			String newsCommentcount = rs.getString("CommentCount");
			String newsSourceurl = rs.getString("sourceurl");
			try {
			PreparedStatement psmt2 = con.prepareStatement(sql2);
			psmt2.setString(1, newsSourceurl);
			ResultSet rs2 = psmt2.executeQuery();
			String imgsrc;
			if(rs2.next())
				imgsrc=rs2.getString("imgsrc");
			else
				imgsrc="";
			news news1 = new news(newsId, newsTitle,newsSource,newsDate,abstract_text,newsArticle,newsCommentcount,newsSourceurl,imgsrc);
			list.add(news1);
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return list;
	}
}