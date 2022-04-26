package entites;

import java.io.Serializable;
import javax.persistence.*;

import entites.*;


/**
 * The persistent class for the orderdetail database table.
 * 
 */
@Entity
@NamedQuery(name="Orderdetail.findAll", query="SELECT o FROM Orderdetail o")
public class Orderdetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	@Column(name="so_luong")
	private int soLuong;
	
	@ManyToOne
	private Product product;

	@ManyToOne
	private Order order;

	public Orderdetail() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSoLuong() {
		return this.soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

}