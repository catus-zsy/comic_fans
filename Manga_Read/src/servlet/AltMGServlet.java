package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sql.MGoperate;

/**
 * Servlet implementation class AltMGServlet
 */
@WebServlet("/AltMGServlet")
public class AltMGServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltMGServlet() {
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
		String chgnm = request.getParameter("chgnm");
		String chglk = request.getParameter("chglk");
		String chgcf = request.getParameter("chgcf");
		
		String prenm = request.getParameter("prenm");
		
		System.out.println("修改后名称:"+chgnm);
		System.out.println("修改后链接:"+chglk);
		System.out.println("修改后分类:"+chgcf);
		System.out.println("修改前名称:"+prenm);
		
		
		MGoperate op = new MGoperate();
		if(chgnm!=null&&chgnm!="") {
			op.AlterMg(chgnm, prenm, 1);
		}
		else if(chglk!=null&&chglk!="") {
			op.AlterMg(chglk, prenm, 2);
		}
		else if(chgcf!=null&&chgcf!="") {
			op.AlterMg(chgcf, prenm, 3);
		}
		else {
			System.out.println("未进行修改");
		}
		
		response.sendRedirect("Alter_Manga.jsp");
	}

}
