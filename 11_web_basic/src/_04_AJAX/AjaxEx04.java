package _04_AJAX;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxEx04")
public class AjaxEx04 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("04_jQuery/chapter04_AJAX/ajaxEx04.jsp");
		dis.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		//System.out.println(id);
		
		String isDuple = "N";
		String[] userList = {"user1" , "user2" , "user3" , "user4" , "user5"};
		for (int i = 0; i < userList.length; i++) {
			if (id.equals(userList[i])) {
				isDuple = "Y";
			}
		}
		
		PrintWriter pw = response.getWriter();
		pw.print(isDuple); // ajax에 success로 들어간다.
	
	}
	
}
