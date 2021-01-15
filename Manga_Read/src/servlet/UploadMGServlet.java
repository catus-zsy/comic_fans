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
        // 可以用request.getPart()方法获得名为photo的上传附件；
        // 也可以用request.getParts()获得所有上传附件（多文件上传），然后通过循环分别处理每一个上传的文件。
        Part part = request.getPart("photo");//index.jsp里的表单的name是photo
        if (part != null && part.getSubmittedFileName().length() > 0) {
            /*添加信息部分*/
    		MGoperate op = new MGoperate();
    		String name = request.getParameter("name");
    		String introduce = request.getParameter("introduce");
    		String classify = request.getParameter("classify");
    		String author = request.getParameter("author");
    		String state = request.getParameter("state");
    		String grade = request.getParameter("grade");
    		String theme = request.getParameter("theme");
    		String area = request.getParameter("area");
    		op.AddMg(name, introduce, classify, author, state, grade, theme, area);//在这里将数据添加到了数据库
        	
            // 用ServletContext对象的getRealPath()方法获得上传文件夹的绝对路径。
            String savePath = request.getServletContext().getRealPath("/Upload");
            System.out.println("savePath:"+savePath);
            String cd = part.getHeader("Content-Disposition");
            //截取不同类型的文件需要自行判断
            String fName = cd.substring(cd.lastIndexOf("=")+2, cd.length()-1);
            
            //fName是要上传的文件的绝对路径名,fileName是文件名
            File tempFile =new File( fName.trim());              
            //String fileName = tempFile.getName();  	
            String fileName = name+".jpg";
            
            // Servlet 3.1规范中可以用Part对象的getSubmittedFileName()方法获得上传的文件名，
            // 更好的做法是为上传的文件进行重命名（避免同名文件的相互覆盖）。
            
            //第一个双引号里我填的是要上传到的文件夹，因为是本地所以可以这么做，要是绝对路径的话填savePath，暂时还不太清楚在网络上运行要怎么写路径
            //part.write("E:/JAVA/Manga_Read/WebContent/Upload" + "/" + fileName);//本地开发用这个
            part.write(savePath + "/" + fileName);//上传到服务器用这个
            //System.out.println(savePath+":"+fileName);
            //PrintWriter out = response.getWriter();
			//out.print("<script>alert('"+savePath+"')</script>");	//请求转发会使弹窗无效
    		
        } else {
        	System.out.println("上传失败");
        }
        
		// 跳转回到上传页面。
        request.getRequestDispatcher("Admin_start.jsp").forward(request, response);   
    }
}