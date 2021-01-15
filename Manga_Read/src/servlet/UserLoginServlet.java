package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.Session;

import sql.Useroperate;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
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
		Useroperate op = new Useroperate();
		
		String name = request.getParameter("UName");
		String password = request.getParameter("UPassword");
		String user = op.CheckUser(name);
		
		if(user!=null) {//����û����Ƿ����
			user = op.CheckPassword(name, password);

			SimpleDateFormat time = new SimpleDateFormat("yyyy-mm-dd");	//�����п��ޣ���Ϊ���� 
			if(user!=null) {//��������Ƿ���ȷ								
				Cookie cookie = new Cookie("UserCookie",user+"#"+time.format(new Date()));//#�������ָ��ַ����ı��
				cookie.setMaxAge(60*60);//����cookie����ʱ�䣬��λ����
				response.addCookie(cookie);//����cookie
				session.setAttribute("msg", "c_02");
			}
			else {//�������
				Cookie cookie = new Cookie("UserCookie",""+"#"+time.format(new Date()));//#�������ָ��ַ����ı��
				cookie.setMaxAge(5);//����cookie����ʱ�䣬��λ����
				response.addCookie(cookie);//����cookie
				session.setAttribute("msg", "e_04");
			}
		}
		else {//�û���������
			SimpleDateFormat time = new SimpleDateFormat("yyyy-mm-dd");	//�����п��ޣ���Ϊ���� 
			Cookie cookie = new Cookie("UserCookie",""+"#"+time.format(new Date()));//#�������ָ��ַ����ı��
			cookie.setMaxAge(5);//����cookie����ʱ�䣬��λ����
			response.addCookie(cookie);//����cookie
			session.setAttribute("msg", "e_03");
		}
		
		response.sendRedirect("index.jsp");
	}

}
