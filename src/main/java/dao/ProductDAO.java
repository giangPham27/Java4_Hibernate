package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import entites.Product;
import utils.JpaUtil;

public class ProductDAO {
	private EntityManager em;

	public ProductDAO() {
		this.em = JpaUtil.getEntityManager();
	}

	public Product createpro(Product entity) throws Exception {
		try {
			this.em.getTransaction().begin();

			this.em.persist(entity);
			this.em.flush();
			this.em.getTransaction().commit();

			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public List<Product> allpro() {
		String jpql = "SELECT p FROM Product p";
		TypedQuery<Product> query = this.em.createQuery(jpql, Product.class);

		List<Product> result = query.getResultList();

		return result;
	}

	public Product findById(int id) {
		return this.em.find(Product.class, id);
	}

	public Product deletepro(Product entity) throws Exception {
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
	
	public Product updatepro(Product entity) throws Exception {
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
