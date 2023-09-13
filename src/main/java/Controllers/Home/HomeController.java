package Controllers.Home;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controllers.HQLSOption;
import Entities.anhSP;
import Entities.sanPham;
import Utils.Login;

@WebServlet("/trang-chu")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

	public HomeController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("trang-chu")) {
			request.setAttribute("Quans", (List<sanPham>) getListProduct(1));
			request.setAttribute("AoThuns", (List<sanPham>) getListProduct(2));
			request.setAttribute("GiayS", (List<sanPham>) getListProduct(3));
			session = request.getSession();
			Login.isLogin = session.getAttribute("username") == null ? false : true;
			request.getRequestDispatcher("/component/index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public List<sanPham> getListProduct(int typeID) {
		List<sanPham> listP = HQLSOption.findProductByType(typeID);
		return listP;
	}
}
