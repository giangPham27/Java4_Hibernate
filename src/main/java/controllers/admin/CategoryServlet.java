package controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;


import dao.CategoryDAO;
import dao.UserDAO;
import entites.Category;
import entites.User;

@WebServlet({
	"/admin/categories/index",
	"/admin/categories/create",
	"/admin/categories/store",
	"/admin/categories/edit",
	"/admin/categories/update",
	"/admin/categories/delete",
	"/admin/categories/show",
})
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private CategoryDAO CategoryDAO;   
    public CategoryServlet() {
        super();
        
        this.userDAO = new UserDAO();
		this.CategoryDAO = new CategoryDAO();
    }

	protected void doGet(
		HttpServletRequest request,
		HttpServletResponse response
	) throws ServletException, IOException {
		String uri = request.getRequestURI();

		if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("create")) {
			this.create(request, response);
		} else if (uri.contains("edit")) {
			this.edit(request, response);
		} else if (uri.contains("delete")) {
			this.delete(request, response);
		} else if (uri.contains("show")) {
			this.show(request, response);
		} else {
			// 404
		}
	}

	protected void doPost(
		HttpServletRequest request,
		HttpServletResponse response
	) throws ServletException, IOException {
		String uri = request.getRequestURI();

		if (uri.contains("store")) {
			this.store(request, response);
		} else if (uri.contains("update")) {
			this.update(request, response);
		} else {
			// 404
		}
	}
	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> dm = this.CategoryDAO.allcate();
		request.setAttribute("dm", dm);
		request.setAttribute("view", "/views/admin/categories/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> ds = this.userDAO.all();
		request.setAttribute("ds", ds);
		request.setAttribute("view", "/views/admin/categories/create.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		try {
			Category cate = new Category();
			String ten = request.getParameter("ten");
			String userIdStr = request.getParameter("user_id");
			int id = Integer.parseInt(userIdStr);
			User user = this.userDAO.findById(id);
			String trangThai = request.getParameter("trangThai");
			int trangThaiInt = Integer.parseInt(trangThai);
			cate.setTen(ten);
			cate.setUser(user);
			cate.setTrangThai(trangThaiInt);
			this.CategoryDAO.createcate(cate);
			session.setAttribute("message", "Thêm mới thành công");
			response.sendRedirect("/Assignment_Java4" + "/admin/categories/index");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Thêm mới thất bại");
			response.sendRedirect("/Assignment_Java4" + "/admin/categories/create");
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		Category entity = this.CategoryDAO.findById(id);
		request.setAttribute("category", entity);

		request.setAttribute("view", "/views/admin/categories/edit.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		Category entity = this.CategoryDAO.findById(id);
		try {
			this.CategoryDAO.deletecate(entity);
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("/Assignment_Java4" + "/admin/categories/index");
	}

	private void show(HttpServletRequest request, HttpServletResponse response) {

	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		Category oldValue = this.CategoryDAO.findById(id);

		Category entity = new Category();
		try {
			BeanUtils.populate(entity, request.getParameterMap());
            entity.setUser(oldValue.getUser());
			this.CategoryDAO.updatecate(entity);
			session.setAttribute("message", "Sửa thành công");
			response.sendRedirect("/Assignment_Java4" + "/admin/categories/index"); 
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Sửa thất bại");
			response.sendRedirect("/Assignment_Java4" + "/admin/categories/edit"); 
		}
	}

}
