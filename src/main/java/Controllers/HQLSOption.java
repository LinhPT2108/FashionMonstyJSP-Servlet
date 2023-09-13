package Controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Entities.Users;
import Entities.anhSP;
import Entities.loaiSanPham;
import Entities.sanPham;
import Utils.HibernateUtils;

public class HQLSOption {
	public static void main(String[] args) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

//					create(session);
//					update(session);
//					delete(session);
//					findAll(session);
//					findByRole(session, true);
//					findByKeyword(session, "Nguyen Van Teo");
//					findOne(session, "5", "123124");
					findPage(session, 3, 5);

					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {

		}
	}

	public static void create(Users user) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();
					System.out.println("Day là dang ký " + user.getMaKH());
					session.persist(user);
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void createProductType(loaiSanPham loaiSanPham) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();
					System.out.println("Tên loại ssan pham " + loaiSanPham.getTenLoaiSP());
					session.persist(loaiSanPham);
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void createProduct(sanPham sp) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();
					session.persist(sp);
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void createProductImage(anhSP anh) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();
					session.persist(anh);
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void update(Users user) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					Users u = session.find(Users.class, user.getMaKH());
					u.setHoTen(user.getHoTen());
					u.setEmail(user.getEmail());
					u.setMatKhau(user.getMatKhau());
					u.setRole(user.isRole());
					u.setDiaChi(user.getDiaChi());
					u.setGioiTinh(user.getGioiTinh());
					u.setNgaySinh(user.getNgaySinh());
					u.setSoDienThoai(user.getSoDienThoai());
					session.merge(u);

					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {

		}

	}

	public static void updateProductType(loaiSanPham loaiSanPham) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					loaiSanPham loaisp = session.find(loaiSanPham.class, loaiSanPham.getMaLoaiSP());
					loaisp.setMaLoaiSP(loaiSanPham.getMaLoaiSP());
					loaisp.setTenLoaiSP(loaiSanPham.getTenLoaiSP());
					session.merge(loaisp);

					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
		}
	}

	public static void updateProduct(sanPham sp) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					sanPham sanpham = session.find(sanPham.class, sp.getMaSP());
					sanpham.setMaSP(sp.getMaSP());
					sanpham.setTenSP(sp.getTenSP());
					sanpham.setGiaBan(sp.getGiaBan());
					sanpham.setSoLuong(sp.getSoLuong());
					sanpham.setGiamGia(sp.getGiamGia());
					sanpham.setLoaiSanPham(sp.getLoaiSanPham());
					session.merge(sanpham);

					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {

		}
	}

	public static void updateProductImage(anhSP anh) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					anhSP asp = session.find(anhSP.class, anh.getId());
					asp.setAnhSP(anh.getAnhSP());
					asp.setSanPham(anh.getSanPham());
					session.merge(asp);
					
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {

		}

	}

	public static void delete(int maKH) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					Users u = session.find(Users.class, maKH);
					session.remove(u);

					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {

		}
	}

	public static void deleteProduct(String idProduct) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					sanPham sp = session.find(sanPham.class, idProduct);
					session.remove(sp);

					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {

		}
	}

	public static void deleteProductType(loaiSanPham loaiSanPham) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					loaiSanPham loaisp = session.find(loaiSanPham.class, loaiSanPham.getMaLoaiSP());
					session.remove(loaisp);

					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {

		}
	}

	public static List<Users> findAll() {
		List<Users> listUser = null;
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					String jpql = "Select o from Users o";
					TypedQuery<Users> query = session.createQuery(jpql, Users.class);
					listUser = query.getResultList();
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {

		}
		return listUser;
	}

	public static List<sanPham> findAllProduct() {
		List<sanPham> listProduct = null;
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					String jpql = "SELECT o FROM sanPham o ORDER BY o.maSP ASC";
					TypedQuery<sanPham> query = session.createQuery(jpql, sanPham.class);
					listProduct = query.getResultList();
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
		}
		return listProduct;
	}

	public static List<loaiSanPham> findAllProductType() {
		List<loaiSanPham> listProductType = null;
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					String jpql = "Select o from loaiSanPham o";
					TypedQuery<loaiSanPham> query = session.createQuery(jpql, loaiSanPham.class);
					listProductType = query.getResultList();
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
		}
		return listProductType;
	}

	public static List<sanPham> findProductByType(int typeID) {
		List<Entities.sanPham> ListP = null;
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					String jpql = "FROM sanPham p WHERE p.loaiSanPham.maLoaiSP = :typeID";
					TypedQuery<sanPham> query = session.createQuery(jpql, sanPham.class);
					query.setParameter("typeID", typeID);
					ListP = query.getResultList();
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ListP;
	}

	public static sanPham findProductByID(String id) {
		sanPham sp = null;
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					String jpql = "FROM sanPham p WHERE p.maSP = :id";
					TypedQuery<sanPham> query = session.createQuery(jpql, sanPham.class);
					query.setParameter("id", id);
					sp = query.getSingleResult();
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sp;

	}

	public static loaiSanPham findProductTypeByID(int id) {
		loaiSanPham lsp = null;
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					String jpql = "FROM loaiSanPham p WHERE p.maLoaiSP = :id";
					TypedQuery<loaiSanPham> query = session.createQuery(jpql, loaiSanPham.class);
					query.setParameter("id", id);
					lsp = query.getSingleResult();
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lsp;

	}

	public static void findByRole(boolean role) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();
					String jpql = "Select o from Users o Where o.admin=:role";
					TypedQuery<Users> query = session.createQuery(jpql, Users.class);
					query.setParameter("role", role);
					List<Users> listUser = query.getResultList();
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {

		}

	}

	public static void findByKeyword(String name) {
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					String jpql = "Select o From Users o Where o.fullname Like ?0";
					TypedQuery<Users> query = session.createQuery(jpql, Users.class);
					query.setParameter(0, name);
					List<Users> listUser = query.getResultList();
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
		}

	}

	public static Users findOneByEmail(String email) {
		Users user = null;
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					String jpql = "Select o From Users o Where o.email=:e";
					TypedQuery<Users> query = session.createQuery(jpql, Users.class);
					query.setParameter("e", email);
					user = query.getSingleResult();

					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
			user = null;
//			e.printStackTrace();
		}
		return user;
	}

	public static Users findOne(String email, String password) {

		Users user = null;
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					String jpql = "Select o From Users o Where o.email=:email AND o.matKhau=:pw";
					TypedQuery<Users> query = session.createQuery(jpql, Users.class);
					query.setParameter("email", email);
					query.setParameter("pw", password);
					user = query.getSingleResult();

					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public static Users edit(int username) {
		Users user = null;
		try {
			SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
			if (sessionFactory != null) {
				Session session = sessionFactory.openSession();
				try {
					Transaction tr = session.beginTransaction();

					String jpql = "Select o From Users o Where o.maKH=:id";
					TypedQuery<Users> query = session.createQuery(jpql, Users.class);
					query.setParameter("id", username);
					user = query.getSingleResult();
					tr.commit();
				} finally {
					session.close();
				}
			}
		} catch (Exception e) {
		}
		return user;

	}

	private static void findPage(Session session, int page, int size) {
		String jpql = "Select o from Users o";
		TypedQuery<Users> query = session.createQuery(jpql, Users.class);
		query.setFirstResult(page * size);
		query.setMaxResults(size);
		List<Users> listUser = query.getResultList();
	}

	public static String setExportID(String type, int len) throws SQLException {
		List<sanPham> idp = findAllProduct();
		List<String> ids = new ArrayList<String>();
		System.out.println("so luong" + idp.size());
		if (idp != null) {
			for (int i = 0; i < idp.size(); i++) {
				ids.add(idp.get(i).getMaSP());
			}
		}
		String id = null;
		int i = 0;
		if (ids == null) {
			id = type + "00000001";
		} else {
			for (String s : ids) {
				String dx = type;
				int index = Integer.parseInt(s.substring(type.length()));
				if (i < index) {
					i = index;
				}

				String lenID = String.valueOf(index + 1);
				if (lenID.length() < len) {
					while (lenID.length() < len) {
						lenID = "0" + lenID;
					}
				}
				id = dx + lenID;
			}

		}

		return id;
	}
}
