package Controllers.Home;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.net.ssl.SSLContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controllers.HQLSOption;
import Entities.Cart;
import Entities.Users;
import Entities.sanPham;
import MailService.MainMessage;
import MailService.ModelMessage;
import Utils.CookieUtils;
import Utils.Login;
import Utils.PasswordEncryption;

@WebServlet({ "/tai-khoan/dang-ky", "/tai-khoan/dang-nhap", "/tai-khoan/dang-xuat", "/tai-khoan/quen-mat-khau",
		"/tai-khoan/doi-mat-khau", "/tai-khoan/cap-nhat-thong-tin", "/tai-khoan/gio-hang", "/tai-khoan/them-vao-gio/*",
		"/tai-khoan/xoa-khoi-gio/*" })
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	HttpSession session;
	Users getUser;

	public AccountController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String url = "/component/index.jsp";
		String userCook = CookieUtils.get("username", request);
		String pass = CookieUtils.get("password", request);
		request.setAttribute("username", userCook);
		request.setAttribute("password", pass);
		if (uri.contains("dang-xuat")) {
			session = request.getSession();
			session.removeAttribute("username");
			session.removeAttribute("password");
			session.invalidate();
			Login.isLogin = false;
			response.sendRedirect(request.getContextPath() + "/tai-khoan/dang-nhap");
		} else if (uri.contains("them-vao-gio")) {
			addProductToCart(request, response);
			response.sendRedirect(request.getContextPath() + "/tai-khoan/gio-hang");
		} else if (uri.contains("xoa-khoi-gio")) {
			deleteProductToCart(request, response);
			response.sendRedirect(request.getContextPath() + "/tai-khoan/gio-hang");
		} else if (uri.contains("gio-hang")) {
			url = "/component/cart.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		} else {
			if (uri.contains("dang-nhap")) {
				url = "/component/login.jsp";
			} else if (uri.contains("dang-ky")) {
				url = "/component/register.jsp";
			} else if (uri.contains("quen-mat-khau")) {
				url = "/component/forgetPassword.jsp";
			} else if (uri.contains("doi-mat-khau")) {
				url = "/component/changePassword.jsp";
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		if (uri.contains("dang-nhap")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String remember = request.getParameter("remember");
			Users user = HQLSOption.findOne(username, PasswordEncryption.toSHA1(password));
			if (user != null) {
				session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				session.setAttribute("getUser", user);
				int hours = (remember == null) ? 0 : 30 * 24;
				CookieUtils.add("username", username, hours, response);
				CookieUtils.add("password", password, hours, response);
				Login.isLogin = true;
				response.sendRedirect(request.getContextPath() + "/trang-chu");
			} else {
				request.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác !");
				request.setAttribute("username", username);
				request.setAttribute("password", password);
				request.getRequestDispatcher("/component/login.jsp").forward(request, response);
			}
		} else if (uri.contains("dang-ky")) {
			String fullname = request.getParameter("fullname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmPassword");
			Users user = HQLSOption.findOneByEmail(email);
			System.out.println("email: " + email);
			System.out.println("result: " + user);
			if (user == null) {
				if (password.matches(confirmPassword)) {
					Users u = new Users();
					u.setEmail(email);
					u.setMatKhau(PasswordEncryption.toSHA1(password));
					u.setHoTen(fullname);
					u.setRole(false);
					u.setGioiTinh(null);
					u.setSoDienThoai(null);
					u.setDiaChi(null);
					u.setNgaySinh(null);
					HQLSOption.create(u);
					response.sendRedirect(request.getContextPath() + "/tai-khoan/dang-nhap");
				} else {
					request.setAttribute("errorPassword", "Mật khẩu không khớp !");
					request.setAttribute("fullname", fullname);
					request.setAttribute("email", email);
					request.setAttribute("password", password);
					request.setAttribute("confirmPassword", confirmPassword);
					request.getRequestDispatcher("/component/register.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("errorEmail", "Mỗi email chỉ được đăng ký cho một tài khoản !");
				request.setAttribute("fullname", fullname);
				request.setAttribute("email", email);
				request.setAttribute("password", password);
				request.setAttribute("confirmPassword", confirmPassword);
				request.getRequestDispatcher("/component/register.jsp").forward(request, response);
			}
		} else if (uri.contains("cap-nhat-thong-tin")) {
			int id = Integer.parseInt(request.getParameter("username"));
			String fullname = request.getParameter("fullname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String soDienThoai = request.getParameter("soDienThoai");
			String diaChi = request.getParameter("diaChi");
			Users users = new Users(id, fullname, PasswordEncryption.toSHA1(password), email);
			users.setDiaChi(diaChi);
			users.setSoDienThoai(soDienThoai);
			session.setAttribute("getUser", users);
			HQLSOption.update(users);
			response.sendRedirect(request.getContextPath() + "/trang-chu");

		} else if (uri.contains("quen-mat-khau")) {
//			getPassword(request, response);
//			response.sendRedirect(request.getContextPath() + "/tai-khoan/dang-nhap");

			boolean success = getPassword(request, response);
			if (success) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println(
						"<script>alert('Lấy lại mật khẩu thành công. Vui lòng kiểm tra lại emai của bạn !'); window.location.href='"
								+ request.getContextPath() + "/tai-khoan/dang-nhap" + "';</script>");
			} else {
				response.sendRedirect(request.getContextPath() + "/tai-khoan/quen-mat-khau");
			}
		} else if (uri.contains("tai-khoan/gio-hang")) {
			addProductToCart(request, response);
		}
	}

	public boolean getPassword(HttpServletRequest request, HttpServletResponse response) {
		boolean result = false;
		String email = request.getParameter("email");
		String newPassword = PasswordEncryption.getRandomString(10);
		MainMessage mainMessage = new MainMessage();
		ModelMessage modelMessage = new ModelMessage(false, "");
		Users user = HQLSOption.findOneByEmail(email);
		if (user != null) {
			try {
				String title = "Lấy lại mật khẩu";
				String body = "Chào bạn, " + "chúng tôi đã đặt lại mật khẩu cho bạn, "
						+ "vui lòng đăng nhập vào website " + "qua mail: " + "<h3>" + email + "</h3>" + "và "
						+ "mật khẩu: " + "<h3>" + newPassword + "</h3>"
						+ "Để bảo mật tài khoản, sau khi đăng nhập vào website, vui lòng đổi mật khẩu mới.";
				mainMessage.setReciver(email);
				mainMessage.setSubject(title);
				mainMessage.setBody(body);
				modelMessage = SendMail(mainMessage.getReciver(), mainMessage.getSubject(), mainMessage.getBody());
				user.setMatKhau(PasswordEncryption.toSHA1(newPassword));
				HQLSOption.update(user);
				result = true;
			} catch (KeyManagementException e) {
				result = false;
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				result = false;
				e.printStackTrace();
			}
		} else {
			result = false;
			modelMessage.setMessage("Tài khoản không tồn tại !");
		}
		request.setAttribute("message", modelMessage.getMessage());
		return result;
	}

	public ModelMessage SendMail(String toEmail, String subject, String body)
			throws KeyManagementException, NoSuchAlgorithmException {
		ModelMessage ms = new ModelMessage(false, "");

		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");

		SSLContext sslContext = SSLContext.getInstance("TLSv1.2");
		sslContext.init(null, null, new SecureRandom());
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Session session = Session.getInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				String username = "linhptpc04737@fpt.edu.vn";
				String password = "oxiatcqzsbjiuncq";
				return new PasswordAuthentication(username, password);
			}
		});

		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress("linhptpc04737@fpt.edu.vn"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			message.setSubject(subject, "utf-8");
			message.setText(body, "utf-8", "html");
			Transport.send(message);
			ms.setSuccess(true);
			ms.setMessage("Đã gửi thành công !");
		} catch (MessagingException e) {
			if (e.getMessage().equals("Invalid Addresses")) {
				ms.setMessage("Kiểm tra lại địa chỉ mail !");
			} else {
				ms.setMessage("Lỗi chưa gửi được mail !");
			}
			e.printStackTrace();
		}
		return ms;
	}

	public void addProductToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
				HttpSession session = request.getSession();
				Cart cart = (Cart) session.getAttribute("cart");
				if (cart == null) {
					cart = new Cart();
				}
				cart.addProduct(sp);

				session.setAttribute("cart", cart);
//		        response.sendRedirect(request.getContextPath() + "/tai-khoan/gio-hang");
			}
		}
	}

	@SuppressWarnings("unchecked")
	public void deleteProductToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
		        HttpSession session = request.getSession();
		        Cart cart = (Cart) session.getAttribute("cart");
		        System.out.println("day la ma sap nah " + sp.getMaSP());
		        if (cart == null) {
		            cart = new Cart();
		        }
		        for (int i = 0; i < cart.getProducts().size(); i++) {
		        	if(cart.getProducts().get(i).getMaSP().equalsIgnoreCase(sp.getMaSP())) {
						cart.getProducts().remove(i);
						break;
					}
				}
		        session.setAttribute("cart", cart);
			}
		}
	}
}
