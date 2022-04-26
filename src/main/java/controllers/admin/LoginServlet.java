package controllers.admin;
import dao.UserDAO;
import entites.User;
import utils.EncryptUtil;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private UserDAO userDAO;

	public LoginServlet() {
		this.userDAO = new UserDAO();
	}
	protected void doGet(
		HttpServletRequest request,
		HttpServletResponse response
	) throws ServletException, IOException {
		request.setAttribute("view",
				"/views/login.jsp");
			request.getRequestDispatcher("/views/layout.jsp")
			.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = request.getParameter("email"), 
				pwd = request.getParameter("password");

		User user = this.userDAO.findByEmail(email);
		boolean check = EncryptUtil.check(pwd, user.getPassword());
		if (check == true) {	
			session.setAttribute("user", user);
			session.setAttribute("message", "Đăng nhập thành công");
			request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
			
		
		} else {
			session.setAttribute("error1", "Đăng nhập thất bại");
			request.getRequestDispatcher("/views/login.jsp").forward(request, response);
		}
	}
}
