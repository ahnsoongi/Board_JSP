package ch13.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ch13.model.BoardDBBean;
import ch13.model.BoardDataBean;
import ch13.model.LoginDataBean;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("*.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		System.out.println("############ sgahn uri:" + uri);
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);
		System.out.println("############ sgahn action:" + action);
		String viewPage = null;
		if(action.equals("write.do")) {
			
			viewPage = "writeForm.jsp";
		}
		if(action.equals("writePro.do")) {
			
			String filename = "";
			String realFolder = "";	//웹 어플리케이션상의 절대 경로

			//파일이 업로드되는 폴더를 지정한다
			String saveFolder = "/fileSave";
			String encType = "utf-8";
			int maxSize = 5*1024*1024;

			ServletContext context = getServletContext();
			realFolder = context.getRealPath(saveFolder);

			MultipartRequest multi = null;
			try{
				
				multi = new MultipartRequest (request,realFolder,
						maxSize,encType,new DefaultFileRenamePolicy());
				
				Enumeration<?> params = multi.getParameterNames();
				
				
				
				

				
				Enumeration<?> files = multi.getFileNames();
				
				while(files.hasMoreElements()){
					String name = (String)files.nextElement();
					
					filename = multi.getFilesystemName(name);
				}
				
				BoardDataBean article = new BoardDataBean();
				
				article.setNum(Integer.parseInt(multi.getParameter("num")));
				article.setWriter(multi.getParameter("writer"));
				article.setSubject(multi.getParameter("subject"));
				article.setEmail(multi.getParameter("email"));
				article.setContent(multi.getParameter("content"));
				article.setPasswd(multi.getParameter("passwd"));
				article.setRef(Integer.parseInt(multi.getParameter("ref")));
				article.setRe_step(Integer.parseInt(multi.getParameter("re_step")));
				article.setRe_level(Integer.parseInt(multi.getParameter("re_level")));
				
				article.setReg_date(new Timestamp(System.currentTimeMillis()) );
				article.setIp(request.getRemoteAddr());
				article.setFilename(filename);
				
				BoardDBBean dbPro = BoardDBBean.getInstance();
				dbPro.insertArticle(article);
				
			}catch(IOException ioe){
				System.out.println(ioe);
			}catch(Exception ex){
				System.out.println(ex);
			}
			
			viewPage = "writePro.jsp";
		}
		if(action.equals("list.do")) {
			
			viewPage = "list.jsp";
		}
		if(action.equals("content.do")) {
			
			viewPage = "content.jsp";
		}
		
		if(action.equals("delete.do")) {
			
			viewPage = "deleteForm.jsp";
		}
		if(action.equals("deletePro.do")) {
			int check = 0;
			
			String pageNum = request.getParameter("pageNum");
			String id = request.getParameter("id");
			String passwd = "";
			
			try {
				
				int num = Integer.parseInt(request.getParameter("num"));
				passwd = request.getParameter("passwd");
				
				BoardDBBean dbPro = BoardDBBean.getInstance();
				check = dbPro.deleteArticle(num, passwd);
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("id", id);
			request.setAttribute("passwd", passwd);
			request.setAttribute("check", check);
			
			viewPage = "deletePro.jsp";
		}
		
		if(action.contentEquals("loginPro.do")) {
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			//PrintWriter out = response.getWriter();
			try {
				BoardDBBean dbPro = BoardDBBean.getInstance();
				String pwd = dbPro.checkIdPw(id);
				if (pwd == null) {
					// id를 찾을 수 없음
					request.setAttribute("checkId", -1);
					viewPage = "login.jsp";
				} else if (passwd.equals(pwd)) {
					// id, passwd 동일, 로그인 성공
					request.setAttribute("checkId", 0);
					request.getSession().setAttribute("id", id);
					request.getSession().setAttribute("email", email);
					request.getSession().setAttribute("passwd", passwd);
					viewPage = "list.do";
				} else {
					// passwd 가 틀림
					request.setAttribute("checkId", 1);
					viewPage = "login.jsp";		
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(action.equals("member_insForm.do")) {
			
			viewPage = "member_insForm.jsp";
		}
		if(action.equals("member_insPro.do")) {
			
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String tel = request.getParameter("tel");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			int result = 0;
			

			try{
			
			LoginDataBean article = new LoginDataBean();
			
			article.setId(id);
			article.setPasswd(passwd);
			article.setTel(tel);
			article.setName(name);
			article.setEmail(email);
			article.setReg_date(new Timestamp(System.currentTimeMillis()));
			
				/*
				 * if(id != null & passwd != null & tel != null & name != null & email != null){
				 * result = 1; }
				 */
				
			
			BoardDBBean dbPro = BoardDBBean.getInstance();
			result = dbPro.insertLogin(article);

			}catch(Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("result", result);
			request.setAttribute("id", id);
			request.setAttribute("passwd", passwd);
			request.setAttribute("email", email);
			
			viewPage = "member_insPro.jsp";
		}
		
		
		if(action.equals("update.do")) {
			
			viewPage = "updateForm.jsp";
		}
		if(action.equals("updatePro.do")) {
			int check = 0;
			String pageNum = request.getParameter("pageNum");
			String passwd = request.getParameter("passwd");
			String realFolder = "";	//웹 어플리케이션상의 절대 경로

			//파일이 업로드되는 폴더를 지정한다
			String saveFolder = "/fileSave";
			String encType = "utf-8";
			int maxSize = 5*1024*1024;

			ServletContext context = getServletContext();
			realFolder = context.getRealPath(saveFolder);

			MultipartRequest multi = null;
			
			
			try {
				
				
				multi = new MultipartRequest (request,realFolder,
						maxSize,encType,new DefaultFileRenamePolicy());
				
				BoardDataBean article = new BoardDataBean();
				article.setWriter(multi.getParameter("writer"));
				article.setEmail(multi.getParameter("email"));
				article.setSubject(multi.getParameter("subject"));
				article.setPasswd(multi.getParameter("passwd"));
				article.setContent(multi.getParameter("content"));
				article.setNum(Integer.parseInt(multi.getParameter("num")));
				
				BoardDBBean dbPro = BoardDBBean.getInstance();
				
				check = dbPro.updateArticle(article);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("pageNum", pageNum);

			request.setAttribute("check", check);
			viewPage = "updatePro.jsp";
		}
		RequestDispatcher rDis = request.getRequestDispatcher(viewPage);
		rDis.forward(request, response);
		
	}

}
