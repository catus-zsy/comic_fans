package servlet;

 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import sql.MGoperate;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
/**
 * @author Created by Chimomo
 */
@WebServlet("/UploadMGServlet")
@MultipartConfig
public class UploadMGServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ������request.getPart()���������Ϊphoto���ϴ�������
        // Ҳ������request.getParts()��������ϴ����������ļ��ϴ�����Ȼ��ͨ��ѭ���ֱ���ÿһ���ϴ����ļ���
        Part part = request.getPart("photo");//index.jsp��ı���name��photo
        if (part != null && part.getSubmittedFileName().length() > 0) {
            /*�����Ϣ����*/
    		MGoperate op = new MGoperate();
    		String name = request.getParameter("name");
    		String introduce = request.getParameter("introduce");
    		String classify = request.getParameter("classify");
    		String author = request.getParameter("author");
    		String state = request.getParameter("state");
    		String grade = request.getParameter("grade");
    		String theme = request.getParameter("theme");
    		String area = request.getParameter("area");
    		op.AddMg(name, introduce, classify, author, state, grade, theme, area);//�����ｫ������ӵ������ݿ�
        	
            // ��ServletContext�����getRealPath()��������ϴ��ļ��еľ���·����
            String savePath = request.getServletContext().getRealPath("/Upload");
            System.out.println("savePath:"+savePath);
            String cd = part.getHeader("Content-Disposition");
            //��ȡ��ͬ���͵��ļ���Ҫ�����ж�
            String fName = cd.substring(cd.lastIndexOf("=")+2, cd.length()-1);
            
            //fName��Ҫ�ϴ����ļ��ľ���·����,fileName���ļ���
            File tempFile =new File( fName.trim());              
            //String fileName = tempFile.getName();  	
            String fileName = name+".jpg";
            
            // Servlet 3.1�淶�п�����Part�����getSubmittedFileName()��������ϴ����ļ�����
            // ���õ�������Ϊ�ϴ����ļ�����������������ͬ���ļ����໥���ǣ���
            
            //��һ��˫�������������Ҫ�ϴ������ļ��У���Ϊ�Ǳ������Կ�����ô����Ҫ�Ǿ���·���Ļ���savePath����ʱ����̫���������������Ҫ��ôд·��
            //part.write("E:/JAVA/Manga_Read/WebContent/Upload" + "/" + fileName);//���ؿ��������
            part.write(savePath + "/" + fileName);//�ϴ��������������
            //System.out.println(savePath+":"+fileName);
            //PrintWriter out = response.getWriter();
			//out.print("<script>alert('"+savePath+"')</script>");	//����ת����ʹ������Ч
    		
        } else {
        	System.out.println("�ϴ�ʧ��");
        }
        
		// ��ת�ص��ϴ�ҳ�档
        request.getRequestDispatcher("Admin_start.jsp").forward(request, response);   
    }
}