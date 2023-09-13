package Controllers.Admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controllers.HQLSOption;
import Entities.Users;
import Utils.CookieUtils;
import Utils.PasswordEncryption;

@WebServlet({ "/admin", "/admin/dang-nhap" , "/admin/dang-xuat"})
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

	public LoginAdmin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String userCook = CookieUtils.get("username", request);
		String pass = CookieUtils.get("password", request);
		request.setAttribute("username", userCook);
		request.setAttribute("password", pass);
		if (uri.contains("dang-xuat")) {
			response.sendRedirect(request.getContextPath() + "/admin/dang-nhap");
			session = request.getSession();
			session.removeAttribute("username");
			session.removeAttribute("password");
			session.invalidate();
			System.out.println("Đăng xuất thành công !");
		}else {
			request.getRequestDispatcher("/admin_page/Login_admin.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("dang-nhap")) {
			loginAdmin(request, response);
		}
	}

	public void loginAdmin(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		Users user = HQLSOption.findOne(username, PasswordEncryption.toSHA1(password));
		if (user != null) {
			if (user.isRole()) {
				session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				session.setAttribute("getUser", user);
				int hours = (remember == null) ? 0 : 30 * 24;
				CookieUtils.add("username", username, hours, response);
				CookieUtils.add("password", password, hours, response);
				request.setAttribute("u", user);
				request.setAttribute("username", username);
				response.sendRedirect(request.getContextPath() + "/admin/dashboard");
			} else {
				request.setAttribute("error", "Tài khoản của bạn không có quyền truy cập !");
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.getRequestDispatcher("/admin_page/Login_admin.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác !");
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			request.getRequestDispatcher("/admin_page/Login_admin.jsp").forward(request, response);

		}
	}
}
