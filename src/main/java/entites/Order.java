package entites;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import entites.User;
import entites.Orderdetail;


/**
 * The persistent class for the order database table.
 * 
 */
@Entity
@NamedQuery(name="Order.findAll", query="SELECT o FROM Order o")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	@Column(name="order_date")
	private String orderDate;

	@Column(name="order_status")
	private int orderStatus;

	@Column(name="shipping_address")
	private String shippingAddress;
	
	@OneToMany(mappedBy="order")
	private List<Orderdetail> orderDetails;
	
	@ManyToOne
	private User user;

	public Order() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderStatus() {
		return this.orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getShippingAddress() {
		return this.shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

}