package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.impl.newsdaoimpl;
import model.news;

/**
 * Servlet implementation class ShowALLNewsServlet
 */
@WebServlet("/ShowAllNewsServlet")
			  
public class ShowAllNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAllNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int countPerPage=10;
		int pageCount;
		HttpSession session=request.getSession();
		String pageIndex=request.getParameter("pageIndex");
		if(pageIndex==null) {
			pageIndex="1";
		}//System.out.print(pageIndex);
		newsdaoimpl newsdao=new newsdaoimpl();
		List list = newsdao.AllNewsSelect();
		List hotlist=newsdao.showTop();
		System.out.print(list.size());
		if(list.size()%countPerPage==0)
		{
			pageCount=list.size()/countPerPage;
		}
		else {
			pageCount=list.size()/countPerPage+1;
		}
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("newscount",list.size());
		int currentPageIndex=Integer.parseInt(pageIndex);
		//if(currentPageIndex>pageCount)
		if(currentPageIndex>pageCount)  currentPageIndex=pageCount;
	    List pageNews=new ArrayList();
	    for(int i=0;i<list.size();i++) {
	    	if(i>=(currentPageIndex-1)*countPerPage&&i<(currentPageIndex)*countPerPage)
	    	{
	    		pageNews.add(list.get(i));
	    	}
	    }	
	    session.setAttribute("pageNews", pageNews);
	    session.setAttribute("hotlist", hotlist);
	    session.setAttribute("currentPageIndex", currentPageIndex);
	    String mainPage="news3.jsp";
		//request.setAttribute("list", list);
		request.setAttribute("mainPage", mainPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher("news3.jsp");
		dispatcher.forward(request, response);
	}

	}

