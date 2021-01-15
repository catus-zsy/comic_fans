package servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import sql.MGoperate;

@WebServlet("/UploadChapterServlet")
@MultipartConfig // 1.设置Servlet可以处理Multipart请求
public class UploadChapterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 2.获取文件保存的路径
		String savePath = this.getServletContext().getRealPath("Upload");
		System.out.println("savePath:"+savePath);
		// 3.获取form表单上传的多个文件
		List<Part> parts = (List<Part>) request.getParts();
		
		String mgname = request.getParameter("mgname");
		String chapter = request.getParameter("chapter");
		MGoperate op = new MGoperate();
		//4.循环遍历多个文件
		int i = 0;
		for(Part part : parts) {
			// 5.获取原文件名
			/* * 经过过request请求信息的分析， 原文件名在头信息的Content-Disposition中 所以获取Content-Disposition的值如下
			 * form-data; name="photo"; filename="测试文件.txt"*/
			
			String header = part.getHeader("Content-Disposition");
			int start = header.lastIndexOf("=");
			String fName = header.substring(start + 1).replace("\"", "");
			File tempFile =new File(fName.trim());
			String fileName = tempFile.getName();  	
			if(fileName.equals("chapter")||fileName.equals("mgname")) {
				
			}
			else {
				i++;
				String ImgId = mgname+"_"+chapter+"_"+i+".jpg";
				System.out.println("fileName:"+fileName);
				// 6.保存到第二步获取的文件保存路径下
				if (ImgId != null && !"".equals(ImgId)) {
					try {
						//part.write("E:/JAVA/Manga_Read/WebContent/Upload" + "/" + ImgId);//本地开发用这个
						part.write(savePath + "/" + ImgId);//上传到服务器用这个
						op.AddMgContent(ImgId,i,chapter);
						System.out.println("多文件上传成功");
					}
					catch(Exception e) {
						System.out.println("多文件上传失败");
					}
				}
			}
		}
		String mgname_chapter = mgname+"_"+chapter;//感觉这玩意有点滑稽，也可以用chapter和imgid配合检索的方式设置总页数，不过一开始没有设置chapter这个列所以就写成了这样
		op.SetTotalPages(mgname_chapter,i);
		response.sendRedirect("Alter_Manga.jsp");
	}

}
