package Controllers.Admin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Controllers.HQLSOption;
import Entities.Users;
import Entities.anhSP;
import Entities.loaiSanPham;
import Entities.sanPham;
import Utils.PasswordEncryption;

@MultipartConfig
@WebServlet({ "/admin/dashboard", "/admin/quan-ly-nguoi-dung", "/admin/quan-ly-san-pham",
		"/admin/quan-ly-loai-san-pham", "/admin/quan-ly-loai-san-pham/edit/*", "/admin/quan-ly-loai-san-pham/reset",
		"/admin/quan-ly-loai-san-pham/them-moi", "/admin/quan-ly-loai-san-pham/cap-nhat",
		"/admin/quan-ly-loai-san-pham/delete", "/admin/quan-ly-san-pham/edit/*", "/admin/quan-ly-san-pham/reset",
		"/admin/quan-ly-san-pham/them-moi", "/admin/quan-ly-san-pham/cap-nhat", "/admin/quan-ly-san-pham/delete",
		"/admin/quan-ly-nguoi-dung/edit/*", "/admin/quan-ly-nguoi-dung/reset", "/admin/quan-ly-nguoi-dung/them-moi",
		"/admin/quan-ly-nguoi-dung/cap-nhat", "/admin/quan-ly-nguoi-dung/delete" })
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean statusUpdateTypeP = true;
	private boolean statusProduct = true;
	private boolean statusUser = true;

	public AdminController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String url = "";
		if (uri.contains("quan-ly-nguoi-dung")) {
			if (uri.contains("edit")) {
				statusUser = false;
				getUserEdit(request, response);
			}
			getUsers(request, response);
			url = "/admin_page/UserManage.jsp";
		} else if (uri.contains("admin/dashboard")) {
			getUsers(request, response);
			url = "/admin_page/admin.jsp";
		} else if (uri.contains("quan-ly-san-pham")) {
			if (uri.contains("edit")) {
				getProductEdit(request, response);
				statusProduct = false;
			}
			url = "/admin_page/ProductManage.jsp";
			getProduct(request, response);
			request.setAttribute("getListProductType", HQLSOption.findAllProductType());
		} else if (uri.contains("quan-ly-loai-san-pham")) {
			if (uri.contains("edit")) {
				getType(request, response);
				statusUpdateTypeP = false;
			} else if (uri.contains("reset")) {
				statusUpdateTypeP = true;
			} else if (uri.contains("them-moi")) {
				statusUpdateTypeP = true;
			} else if (uri.contains("cap-nhat")) {
				statusUpdateTypeP = true;
			} else if (uri.contains("delete")) {
				statusUpdateTypeP = true;
			} else {
				statusUpdateTypeP = true;
			}
			getProductType(request, response);
			url = "/admin_page/TypeProductManage.jsp";
		} else {
			url = "/admin_page/admin.jsp";
		}
		request.setAttribute("statusUser", statusUser);
		request.setAttribute("statusProduct", statusProduct);
		request.setAttribute("statusUpdateTypeP", statusUpdateTypeP);
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		if (uri.contains("quan-ly-loai-san-pham")) {
			System.out.println("có vô đây hông 1");
			if (uri.contains("them-moi")) {
				statusUpdateTypeP = true;
				createProductType(request, response);
			} else if (uri.contains("reset")) {
				statusUpdateTypeP = true;
			} else if (uri.contains("cap-nhat")) {
				statusUpdateTypeP = true;
				updateProductType(request, response);
			} else if (uri.contains("delete")) {
				statusUpdateTypeP = true;
				deleteProductType(request, response);
			}
			request.setAttribute("statusUpdateTypeP", statusUpdateTypeP);
			response.sendRedirect(request.getContextPath() + "/admin/quan-ly-loai-san-pham");
		} else if (uri.contains("quan-ly-san-pham")) {
			if (uri.contains("them-moi")) {
				statusProduct = true;
				try {
					createProduct(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else if (uri.contains("reset")) {
				statusProduct = true;
			} else if (uri.contains("cap-nhat")) {
				statusProduct = true;
				updateProduct(request, response);
			} else if (uri.contains("delete")) {
				statusProduct = true;
				deleteProduct(request, response);
			}
			request.setAttribute("statusProduct", statusProduct);
			response.sendRedirect(request.getContextPath() + "/admin/quan-ly-san-pham");
		} else if (uri.contains("quan-ly-nguoi-dung")) {
			if (uri.contains("them-moi")) {
				statusUser = true;
				try {
					createUser(request, response);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			} else if (uri.contains("reset")) {
				statusUser = true;
			} else if (uri.contains("cap-nhat")) {
				statusUser = true;
				try {
					updateUser(request, response);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			} else if (uri.contains("delete")) {
				statusUser = true;
				deleteUser(request, response);
			}
			request.setAttribute("statusUser", statusUser);
			response.sendRedirect(request.getContextPath() + "/admin/quan-ly-nguoi-dung");
		} else {
//			url = "/admin_page/admin.jsp";
		}
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
		int maKH = Integer.parseInt(request.getParameter("maKH"));
		HQLSOption.delete(maKH);
	}

	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		int maKH = Integer.parseInt(request.getParameter("maKH"));
		String hoTen = request.getParameter("hoTen");
		String soDienThoai = request.getParameter("soDienthoai");
		String diaChi = request.getParameter("diaChi");
		String email = request.getParameter("email");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date ngaySinh = format.parse(request.getParameter("ngaySinh"));
		String gioiTinh = request.getParameter("gioiTinh");
		boolean role = Boolean.parseBoolean(request.getParameter("role"));
		Users users = new Users(maKH, hoTen, PasswordEncryption.toSHA1("123123"), gioiTinh, soDienThoai, email, diaChi,
				ngaySinh, role);
		HQLSOption.update(users);
	}

	private void createUser(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		String hoTen = request.getParameter("hoTen");
		String soDienThoai = request.getParameter("soDienthoai");
		String diaChi = request.getParameter("diaChi");
		String email = request.getParameter("email");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date ngaySinh = format.parse(request.getParameter("ngaySinh"));
		String gioiTinh = request.getParameter("gioiTinh");
		boolean role = Boolean.parseBoolean(request.getParameter("role"));
		Users users = new Users(hoTen, PasswordEncryption.toSHA1("123123"), gioiTinh, soDienThoai, email, diaChi,
				ngaySinh, role);
		HQLSOption.create(users);

	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
		String maSP = request.getParameter("maSP");
		HQLSOption.deleteProduct(maSP);
	}

	private void updateProduct(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String maSP = request.getParameter("maSP");
		String tenSP = request.getParameter("productName");
		String giaBan = request.getParameter("productPrice");
		String soLuong = request.getParameter("productAmount");
		String giamGia = request.getParameter("productDiscount");
		String loaiSP = request.getParameter("productType");
		sanPham sp = new sanPham();
		sp.setMaSP(maSP);
		sp.setTenSP(tenSP);
		sp.setGiaBan(Double.parseDouble(giaBan));
		sp.setSoLuong(Integer.parseInt(soLuong));
		sp.setGiamGia(Float.parseFloat(giamGia));
		sp.setLoaiSanPham(HQLSOption.findProductTypeByID(Integer.parseInt(loaiSP)));

		anhSP anhp = new anhSP();
		File dir = new File(request.getServletContext().getRealPath("/resources/img"));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		Part img = request.getPart("productImage");
		File imgFile = new File(dir, maSP + "_" + 1 + "_" + img.getSubmittedFileName());
		img.write(imgFile.getAbsolutePath());
		anhp.setAnhSP(maSP + "_" + 1 + "_" + img.getSubmittedFileName());
		anhp.setSanPham(sp);

		HQLSOption.updateProduct(sp);
		HQLSOption.createProductImage(anhp);

	}

	private void createProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		sanPham sp = new sanPham();
		String maSP = HQLSOption.setExportID("SP", 4);
		String tenSP = request.getParameter("productName");
		String giaBan = request.getParameter("productPrice");
		String soLuong = request.getParameter("productAmount");
		String giamGia = request.getParameter("productDiscount");
		String loaiSP = request.getParameter("productType");
		sp.setMaSP(maSP);
		sp.setTenSP(tenSP);
		sp.setGiaBan(Double.parseDouble(giaBan));
		sp.setSoLuong(Integer.parseInt(soLuong));
		sp.setGiamGia(Float.parseFloat(giamGia));
		sp.setLoaiSanPham(HQLSOption.findProductTypeByID(Integer.parseInt(loaiSP)));

		anhSP anhp = new anhSP();
		File dir = new File(request.getServletContext().getRealPath("/resources/img"));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		Part img = request.getPart("productImage");
		File imgFile = new File(dir, maSP + "_" + 1 + "_" + img.getSubmittedFileName());
		img.write(imgFile.getAbsolutePath());
		anhp.setAnhSP(maSP + "_" + 1 + "_" + img.getSubmittedFileName());
		anhp.setSanPham(sp);

		HQLSOption.createProduct(sp);
		HQLSOption.createProductImage(anhp);

	}

	public void getUsers(HttpServletRequest request, HttpServletResponse response) {
		List<Users> listUsers = HQLSOption.findAll();
		request.setAttribute("listUsers", listUsers);
	}

	public void getProduct(HttpServletRequest request, HttpServletResponse response) {
		List<sanPham> listProduct = HQLSOption.findAllProduct();
		request.setAttribute("listProduct", listProduct);
	}

	public void getProductType(HttpServletRequest request, HttpServletResponse response) {
		List<loaiSanPham> listProductType = HQLSOption.findAllProductType();
		request.setAttribute("listProductType", listProductType);
	}

	public void getType(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
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
			loaiSanPham loaisp = HQLSOption.findProductTypeByID(id);
			if (loaisp != null) {
				request.setAttribute("loaisp", loaisp);
			}
		}
	}

	public void createProductType(HttpServletRequest request, HttpServletResponse response) {
		String typeName = request.getParameter("typeProduct");
		loaiSanPham loaiSanPham = new loaiSanPham();
		loaiSanPham.setTenLoaiSP(typeName);
		HQLSOption.createProductType(loaiSanPham);
	}

	public void updateProductType(HttpServletRequest request, HttpServletResponse response) {
		String typeName = request.getParameter("typeProduct");
		int typeID = Integer.parseInt(request.getParameter("typeID"));
		loaiSanPham loaiSanPham = new loaiSanPham();
		loaiSanPham.setTenLoaiSP(typeName);
		loaiSanPham.setMaLoaiSP(typeID);
		HQLSOption.updateProductType(loaiSanPham);
	}

	public void deleteProductType(HttpServletRequest request, HttpServletResponse response) {
		String typeName = request.getParameter("typeProduct");
		int typeID = Integer.parseInt(request.getParameter("typeID"));
		loaiSanPham loaiSanPham = new loaiSanPham();
		loaiSanPham.setTenLoaiSP(typeName);
		loaiSanPham.setMaLoaiSP(typeID);
		HQLSOption.deleteProductType(loaiSanPham);
	}

	public void getProductEdit(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
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
			sanPham getProductEdit = HQLSOption.findProductByID(id);
			if (getProductEdit != null) {
				request.setAttribute("getProductEdit", getProductEdit);
			}
		}
	}

	public void getUserEdit(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
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
			Users getUserEdit = HQLSOption.edit(id);
			if (getUserEdit != null) {
				request.setAttribute("getUserEdit", getUserEdit);
				System.out.println("ngay sinh " + getUserEdit.getNgaySinh());
			}
		}
	}

	public void handleProductImage(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, SQLException {

	}
}
