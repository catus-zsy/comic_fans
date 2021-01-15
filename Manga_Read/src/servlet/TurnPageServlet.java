package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import sql.MGoperate;

/**
 * Servlet implementation class TurnPageServlet
 */
@WebServlet("/TurnPageServlet")
public class TurnPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TurnPageServlet() {
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
		
		String porn = request.getParameter("porn");
		String mgname = request.getParameter("mgname");
		String mgchpt = request.getParameter("mgchpt");
		String mgpage = request.getParameter("mgpage");
		String mgtopg = request.getParameter("mgtopg");
		
		int page = Integer.parseInt(mgpage);
		int total = Integer.parseInt(mgtopg);

		if(porn.equals("next")) {
			if(page<total) {
				page++;
				mgpage = page + "";
				session.setAttribute("mgname", mgname);
				session.setAttribute("mgchpt", mgchpt);
				session.setAttribute("mgpage", mgpage);
			}
			else if(page==total) {
				int chapter = Integer.parseInt(mgchpt);
				chapter++;
				mgchpt = chapter + "";
				mgpage = page + "";
				session.setAttribute("mgname", mgname);
				session.setAttribute("mgchpt", mgchpt);
				session.setAttribute("mgpage", "1");
			}
			else {
				System.out.println("翻页时出了别的状况");
			}
		}
		else if(porn.equals("previous")) {
			if(page>1) {
				page--;
				mgpage = page + "";
				session.setAttribute("mgname", mgname);
				session.setAttribute("mgchpt", mgchpt);
				session.setAttribute("mgpage", mgpage);
			}
			else {
				session.setAttribute("mgname", mgname);
				session.setAttribute("mgchpt", mgchpt);
				session.setAttribute("mgpage", mgpage);
			}
		}
		
		response.sendRedirect("MangaContentPage.jsp");
	}

}
