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
import dao.ProductDAO;
import entites.Category;
import entites.Product;

@WebServlet({
	"/admin/products/index",
	"/admin/products/create",
	"/admin/products/store",
	"/admin/products/edit",
	"/admin/products/update",
	"/admin/products/delete",
	"/admin/products/show",
})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;
	private CategoryDAO categoryDAO;

	public ProductServlet() {
		super();

		this.productDAO = new ProductDAO();
		this.categoryDAO = new CategoryDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		List<Product> pro = this.productDAO.allpro();
		request.setAttribute("pro", pro);
		request.setAttribute("view", "/views/admin/products/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> dm = this.categoryDAO.allcate();
		request.setAttribute("dm", dm);
		request.setAttribute("view", "/views/admin/products/create.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		try {
			Product entity = new Product();
			BeanUtils.populate(entity, request.getParameterMap());

			String categoryIdStr = request.getParameter("category_id");  
			int id = Integer.parseInt(categoryIdStr);
			Category categoryId = this.categoryDAO.findById(id); 
			entity.setCategoryId(categoryId);  
			this.productDAO.createpro(entity);
			session.setAttribute("message", "Thêm mới thành công");
			response.sendRedirect("/Assignment_Java4" + "/admin/products/index"); 
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Thêm mới thất bại");
			response.sendRedirect("/Assignment_Java4" + "/admin/products/create");
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		Product entity = this.productDAO.findById(id); 
		request.setAttribute("product", entity);

		request.setAttribute("view", "/views/admin/products/edit.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		Product entity = this.productDAO.findById(id);
		try {
			this.productDAO.deletepro(entity);
			session.setAttribute("message", "Xóa thành công");
			response.sendRedirect("/Assignment_Java4"
				+ "/admin/products/index");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Xóa thất bại");
			response.sendRedirect("/Assignment_Java4"
				+ "/admin/products/index");
		}

	}

	private void show(HttpServletRequest request, HttpServletResponse response) {
		//
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		Product oldValue = this.productDAO.findById(id);

		Product entity = new Product();
		try {
			BeanUtils.populate(entity, request.getParameterMap());
			entity.setCategoryId(oldValue.getCategoryId());
			this.productDAO.updatepro(entity);
			session.setAttribute("message", "Sửa thành công");
			response.sendRedirect("/Assignment_Java4" + "/admin/products/index");

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Sửa thất bại");
			response.sendRedirect("/Assignment_Java4" + "/admin/products/edit");
		}
		
	}
}
