package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mgclass.Manga_Cover;
import sql.MGoperate;

/**
 * Servlet implementation class SearchMgServlet
 */
@WebServlet("/SearchMgServlet")
public class SearchMgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		MGoperate op = new MGoperate();
		
		String manga = request.getParameter("manga");
		String author = request.getParameter("author");
		String state = request.getParameter("state");
		String classify = request.getParameter("classify");
		String grade = request.getParameter("grade");
		String theme = request.getParameter("theme");
		String area = request.getParameter("area");
		System.out.println("manga:"+manga);
		if(manga==null&&author==null) {	//如果漫画和作者都为null，则判定进行了高级查询
			ArrayList<Manga_Cover> mglist = op.AdvanceSearch(state, classify, grade, theme, area);
			session.setAttribute("mgs", mglist);
		}
		else {
			if(author==null) {
				ArrayList<Manga_Cover> mglist = op.SearchMgname(manga);
				session.setAttribute("mgs", mglist);
			}
			else if(manga==null) {
				ArrayList<Manga_Cover> mglist = op.SearchMgauthor(author);
				session.setAttribute("mgs", mglist);
			}
		}
		
		response.sendRedirect("SearchResult.jsp");
	}

}
