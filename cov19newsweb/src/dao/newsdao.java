package dao;
import java.util.List;


import model.news;

public interface newsdao {
	
	public List findNewsBytext(String searchtext);
	public List AllNewsSelect();
	public List showTop();
}
