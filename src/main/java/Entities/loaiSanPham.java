package Entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class loaiSanPham {
	private int maLoaiSP;
	private String tenLoaiSP;

	private List<sanPham> sanPham;

	public loaiSanPham(int maLoaiSP, String tenLoaiSP) {
		super();
		this.maLoaiSP = maLoaiSP;
		this.tenLoaiSP = tenLoaiSP;
	}

	public loaiSanPham() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getMaLoaiSP() {
		return maLoaiSP;
	}

	public void setMaLoaiSP(int maLoaiSP) {
		this.maLoaiSP = maLoaiSP;
	}

	public String getTenLoaiSP() {
		return tenLoaiSP;
	}

	public void setTenLoaiSP(String tenLoaiSP) {
		this.tenLoaiSP = tenLoaiSP;
	}

	@OneToMany(mappedBy = "loaiSanPham")
	public List<sanPham> getSanPham() {
		return sanPham;
	}

	public void setSanPham(List<sanPham> sanPham) {
		this.sanPham = sanPham;
	}

}
