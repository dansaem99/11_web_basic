package _04_AJAX;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxEx05")
public class AjaxEx05 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("04_jQuery/chapter04_AJAX/ajaxEx05.jsp");
		dis.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		String isLogin = "fail";
		if (id.equals("admin") && passwd.equals("admin")) {
			isLogin = "success";
		}
		
		PrintWriter pw = response.getWriter();
		pw.print(isLogin);
		
	}

}
