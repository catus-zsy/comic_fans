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
@MultipartConfig // 1.����Servlet���Դ���Multipart����
public class UploadChapterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 2.��ȡ�ļ������·��
		String savePath = this.getServletContext().getRealPath("Upload");
		System.out.println("savePath:"+savePath);
		// 3.��ȡform���ϴ��Ķ���ļ�
		List<Part> parts = (List<Part>) request.getParts();
		
		String mgname = request.getParameter("mgname");
		String chapter = request.getParameter("chapter");
		MGoperate op = new MGoperate();
		//4.ѭ����������ļ�
		int i = 0;
		for(Part part : parts) {
			// 5.��ȡԭ�ļ���
			/* * ������request������Ϣ�ķ����� ԭ�ļ�����ͷ��Ϣ��Content-Disposition�� ���Ի�ȡContent-Disposition��ֵ����
			 * form-data; name="photo"; filename="�����ļ�.txt"*/
			
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
				// 6.���浽�ڶ�����ȡ���ļ�����·����
				if (ImgId != null && !"".equals(ImgId)) {
					try {
						//part.write("E:/JAVA/Manga_Read/WebContent/Upload" + "/" + ImgId);//���ؿ��������
						part.write(savePath + "/" + ImgId);//�ϴ��������������
						op.AddMgContent(ImgId,i,chapter);
						System.out.println("���ļ��ϴ��ɹ�");
					}
					catch(Exception e) {
						System.out.println("���ļ��ϴ�ʧ��");
					}
				}
			}
		}
		String mgname_chapter = mgname+"_"+chapter;//�о��������е㻬����Ҳ������chapter��imgid��ϼ����ķ�ʽ������ҳ��������һ��ʼû������chapter��������Ծ�д��������
		op.SetTotalPages(mgname_chapter,i);
		response.sendRedirect("Alter_Manga.jsp");
	}

}
