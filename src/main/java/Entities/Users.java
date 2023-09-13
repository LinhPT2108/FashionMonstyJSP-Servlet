package Entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Users {
	private int maKH;
	private String hoTen;
	private String matKhau;
	private String gioiTinh;
	private String soDienThoai;
	private String email;
	private String diaChi;
	private Date ngaySinh;
	private boolean role = false;

	public Users() {
		super();
	}

	public Users(int maKH, String hoTen, String matKhau, String email) {
		super();
		this.maKH = maKH;
		this.hoTen = hoTen;
		this.matKhau = matKhau;
		this.email = email;
	}

	public Users( String hoTen, String matKhau, String gioiTinh, String soDienThoai, String email,
			String diaChi, Date ngaySinh, boolean role) {
		super();
		this.hoTen = hoTen;
		this.matKhau = matKhau;
		this.gioiTinh = gioiTinh;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.diaChi = diaChi;
		this.ngaySinh = ngaySinh;
		this.role = role;
	}

	public Users(int maKH, String hoTen, String matKhau, String gioiTinh, String soDienThoai, String email,
			String diaChi, Date ngaySinh, boolean role) {
		super();
		this.maKH = maKH;
		this.hoTen = hoTen;
		this.matKhau = matKhau;
		this.gioiTinh = gioiTinh;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.diaChi = diaChi;
		this.ngaySinh = ngaySinh;
		this.role = role;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getMaKH() {
		return maKH;
	}

	public void setMaKH(int maKH) {
		this.maKH = maKH;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public boolean isRole() {
		return role;
	}

	public void setRole(boolean role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return this.getHoTen();
	}
}
