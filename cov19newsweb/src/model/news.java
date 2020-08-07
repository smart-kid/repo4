package model;

public class news {
	String id;
	String title;
	String source;
	String date;
	String abstract_text;
	String imgsrc;
	public news(String id, String title, String source, String date, String abstract_text,String article, String commentcount,
			String sourceurl,String imgsrc) {
		super();
		this.id = id;
		this.title = title;
		this.source = source;
		this.date = date;
		this.abstract_text = abstract_text;
		this.imgsrc = imgsrc;
		this.article = article;
		this.commentcount = commentcount;
		this.sourceurl = sourceurl;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	String article;
	String commentcount;
	String sourceurl;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAbstract_text() {
		return abstract_text;
	}
	public void setAbstract_text(String abstract_text) {
		this.abstract_text = abstract_text;
	}
	public String getArticle() {
		return article;
	}
	public void setArticle(String article) {
		this.article = article;
	}
	public String getCommentcount() {
		return commentcount;
	}
	public void setCommentcount(String commentcount) {
		this.commentcount = commentcount;
	}
	public String getSourceurl() {
		return sourceurl;
	}
	public void setSourceurl(String sourceurl) {
		this.sourceurl = sourceurl;
	}
}
