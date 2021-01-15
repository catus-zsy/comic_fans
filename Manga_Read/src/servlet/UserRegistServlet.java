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

import sql.Useroperate;

/**
 * Servlet implementation class UserRegistServlet
 */
@WebServlet("/UserRegistServlet")
public class UserRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegistServlet() {
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
		int name_length = 0;
		
		String mail = request.getParameter("ReMail");
		String name = request.getParameter("ReName");
		name_length = name.length();
		System.out.println("�û�������:"+name_length);
		String password = request.getParameter("RePassword");
		
		Useroperate op = new Useroperate();

		
		if("error".equals(name)||"����Ա".equals(name)) {
			SimpleDateFormat time = new SimpleDateFormat("yyyy-mm-dd");	//�����п��ޣ���Ϊ���� 
			Cookie cookie = new Cookie("UserCookie",""+"#"+time.format(new Date()));//#�������ָ��ַ����ı��
			cookie.setMaxAge(5);//����cookie����ʱ�䣬��λ����
			response.addCookie(cookie);//����cookie
			session.setAttribute("msg","e_05");
		}
		else if(name_length>=3&&name_length<=20) {
			String RegistResult = op.Regist(mail, password, name);
			if(RegistResult.equals("��������û����Ѵ���")) {
				SimpleDateFormat time = new SimpleDateFormat("yyyy-mm-dd");	//�����п��ޣ���Ϊ���� 
				Cookie cookie = new Cookie("UserCookie",""+"#"+time.format(new Date()));//#�������ָ��ַ����ı��
				cookie.setMaxAge(5);//����cookie����ʱ�䣬��λ����
				response.addCookie(cookie);//����cookie
				session.setAttribute("msg","e_01");
			}
			else if(RegistResult.contentEquals("ע��ɹ�")){
				session.setAttribute("msg","c_01");
			}
		}
		else {
			//�û��������ϳ���Ҫ��
			SimpleDateFormat time = new SimpleDateFormat("yyyy-mm-dd");	//�����п��ޣ���Ϊ���� 
			Cookie cookie = new Cookie("UserCookie",""+"#"+time.format(new Date()));//#�������ָ��ַ����ı��
			cookie.setMaxAge(5);//����cookie����ʱ�䣬��λ����
			response.addCookie(cookie);//����cookie
			session.setAttribute("msg","e_02");
		}
		
		response.sendRedirect("index.jsp");
	}

}
