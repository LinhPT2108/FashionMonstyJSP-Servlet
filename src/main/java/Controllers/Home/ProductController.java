package Controllers.Home;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controllers.HQLSOption;
import Entities.sanPham;

@WebServlet("/san-pham")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("Quans", getListProduct(1));
		request.setAttribute("AoThuns", getListProduct(2));
		request.setAttribute("GiayS", getListProduct(3));
		request.getRequestDispatcher("/component/product.jsp").forward(request, response);
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
