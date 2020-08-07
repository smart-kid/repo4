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
 * Servlet implementation class FindNewsServlet
 */
@WebServlet("/FindNewsServlet")
public class FindNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindNewsServlet() {
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
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
         String searchtext=request.getParameter("searchtext");
         //System.out.print(id);
         //int newsid=Integer.parseInt(id);
         //System.out.print(newsid);
         int countPerPage=10;
 		 int searchpageCount;
 		HttpSession session=request.getSession();
 		String searchpageIndex=request.getParameter("searchpageIndex");
 		if(searchpageIndex==null) {
 			searchpageIndex="1";
 		}
         newsdaoimpl newsdao=new newsdaoimpl();
         List searchlist=newsdao.findNewsBytext(searchtext);
         if(searchlist.size()%countPerPage==0)
 		{
        	 searchpageCount=searchlist.size()/countPerPage;
 		}
 		else {
 			searchpageCount=searchlist.size()/countPerPage+1;
 		}
         session.setAttribute("searchtexttext", searchtext);
         session.setAttribute("searchpageCount", searchpageCount);
 		session.setAttribute("searchnewscount",searchlist.size());
 		int searchcurrentPageIndex=Integer.parseInt(searchpageIndex);
		//if(currentPageIndex>pageCount)
		if(searchcurrentPageIndex>searchpageCount)  searchcurrentPageIndex=searchpageCount;
	    List searchpageNews=new ArrayList();
	    for(int i=0;i<searchlist.size();i++) {
	    	if(i>=(searchcurrentPageIndex-1)*countPerPage&&i<(searchcurrentPageIndex)*countPerPage)
	    	{
	    		searchpageNews.add(searchlist.get(i));
	    	}
	    }	
	    session.setAttribute("searchpageNews", searchpageNews);
	    session.setAttribute("searchcurrentPageIndex", searchcurrentPageIndex);
         /*String mainPage = "detail.jsp";
 		 request.setAttribute("mainPage", mainPage);*/
 		 RequestDispatcher dispatcher = request.getRequestDispatcher("showsearch.jsp");
 		 dispatcher.forward(request, response);
 		
	}

}
