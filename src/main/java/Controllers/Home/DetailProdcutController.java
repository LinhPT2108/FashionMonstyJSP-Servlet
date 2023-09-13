package Controllers.Home;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controllers.HQLSOption;
import Entities.Users;
import Entities.sanPham;

@WebServlet("/san-pham/*")
public class DetailProdcutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DetailProdcutController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String queryString = request.getQueryString();
		String id = "";

		if (queryString != null) {
			String[] params = queryString.split("&");
			for (String param : params) {
				String[] pair = param.split("=");
				String key = URLDecoder.decode(pair[0], "UTF-8");
				String value = URLDecoder.decode(pair[1], "UTF-8");

				if (key.equals("id")) {
					id = value;
					System.out.println("id: " + id);
					break;
				}
			}
			sanPham sp = HQLSOption.findProductByID(id);
			if (sp != null) {
				request.setAttribute("disableID", true);
				request.setAttribute("sp_detail", sp);
			}
		}
		request.getRequestDispatcher("/component/detailProduct.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
