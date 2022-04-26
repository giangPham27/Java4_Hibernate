package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entites.Orderdetail;
import utils.JpaUtil;

public class OrderDetailDAO {

	private EntityManager em;
	public OrderDetailDAO() {
		this.em = JpaUtil.getEntityManager();
	}
	
	public List<Orderdetail> findAll() throws Exception {
		try {
			this.em.getTransaction().begin();
			String jpql = "SELECT obj FROM OrderDetail obj";
			TypedQuery<Orderdetail> query = this.em.createQuery(jpql, Orderdetail.class);
			this.em.getTransaction().commit();
			return query.getResultList();	
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	
	public long getTotalOrderDetail() {
		String jpql = "SELECT count(obj.id) FROM OrderDetail obj";
		TypedQuery<Long> query = this.em.createQuery(jpql, Long.class);
		return query.getSingleResult();
	}
	
	public Orderdetail findById(int id) {
		return this.em.find(Orderdetail.class, id);
	}
	
	public Orderdetail create(Orderdetail entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.persist(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	
	public Orderdetail delete(Orderdetail entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.remove(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	
	public Orderdetail update(Orderdetail entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.merge(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	
}
