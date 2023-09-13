package Entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class sanPham {
	@Id
	private String maSP;
	private String tenSP;
	private double giaBan;
	private int soLuong;
	private String moTa;
	private float giamGia;

	@OneToMany(mappedBy = "sanpham",fetch = FetchType.EAGER )
	public List<anhSP> anhsp;
	
	@ManyToOne
	@JoinColumn(name = "maLoaiSP")
	private loaiSanPham loaiSanPham;

	public sanPham(String maSP, String tenSP, double giaBan, int soLuong, String moTa,
			Entities.loaiSanPham loaiSanPham) {
		super();
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.giaBan = giaBan;
		this.soLuong = soLuong;
		this.moTa = moTa;
		this.loaiSanPham = loaiSanPham;
	}

	public sanPham() {
	}
	
	public List<anhSP> getAnhSP() {
		return anhsp;
	}

	public void setAnh(List<anhSP> anhSP) {
		this.anhsp = anhSP;
	}

	public String getMaSP() {
		return maSP;
	}

	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}

	public String getTenSP() {
		return tenSP;
	}

	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}

	public double getGiaBan() {
		return giaBan;
	}

	public void setGiaBan(double giaBan) {
		this.giaBan = giaBan;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public loaiSanPham getLoaiSanPham() {
		return loaiSanPham;
	}

	public void setLoaiSanPham(loaiSanPham loaiSanPham) {
		this.loaiSanPham = loaiSanPham;
	}

	public float getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(float giamGia) {
		this.giamGia = giamGia;
	}

	public List<anhSP> getAnhsp() {
		return anhsp;
	}

	public void setAnhsp(List<anhSP> anhsp) {
		this.anhsp = anhsp;
	}

}
