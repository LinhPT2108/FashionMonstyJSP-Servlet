package Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class anhSP {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String anhSP;

	@ManyToOne
	@JoinColumn(name = "maSP")
	private sanPham sanpham;

	public anhSP(int id, String anhSP, sanPham sanPham) {
		super();
		this.id = id;
		this.anhSP = anhSP;
		this.sanpham = sanPham;
	}

	public anhSP() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAnhSP() {
		return anhSP;
	}

	public void setAnhSP(String anhSP) {
		this.anhSP = anhSP;
	}

	public sanPham getSanPham() {
		return sanpham;
	}

	public void setSanPham(sanPham sanPham) {
		this.sanpham = sanPham;
	}

}
