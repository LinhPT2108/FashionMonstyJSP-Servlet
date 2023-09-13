package Controllers;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.Users;

@WebServlet({ "/user", "/create", "/update", "/delete", "/reset", "/edit/*" })
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Users> users = HQLSOption.findAll();
		request.setAttribute("users", users);
		String queryString = request.getQueryString();
		int id = 0;

		if (queryString != null) {
			String[] params = queryString.split("&");
			for (String param : params) {
				String[] pair = param.split("=");
				String key = URLDecoder.decode(pair[0], "UTF-8");
				String value = URLDecoder.decode(pair[1], "UTF-8");

				if (key.equals("id")) {
					id = Integer.parseInt(value);
					System.out.println("id: " + id);
					break;
				}
			}
			Users user = HQLSOption.edit(id);
			if (user != null) {
				request.setAttribute("disableID", true);
			}

			request.setAttribute("u", user);
		}
		request.getRequestDispatcher("/views/UserForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("create")) {
			String fullname = request.getParameter("fullname");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			boolean admin = Boolean.parseBoolean(request.getParameter("roles"));

//			Users users = new Users(fullname, password, email, admin);
//			HQLSOption.create(users);
			System.out.println("Created !");
		} else if (uri.contains("update")) {
			int id = Integer.parseInt(request.getParameter("username"));
			String fullname = request.getParameter("fullname");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			boolean admin = Boolean.parseBoolean(request.getParameter("roles"));

//			Users users = new Users(id, fullname, password, email, admin);
//			HQLSOption.update(users);
			System.out.println("Cập nhật thành công !");
		} else if (uri.contains("delete")) {
			int id = Integer.parseInt(request.getParameter("username"));
			String fullname = request.getParameter("fullname");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			boolean admin = Boolean.parseBoolean(request.getParameter("roles"));

//			Users users = new Users(id, fullname, password, email, admin);
//			HQLSOption.delete(users);
			System.out.println("Xóa thành công !");
		} else if (uri.contains("reset")) {

		}
		doGet(request, response);
	}

}
