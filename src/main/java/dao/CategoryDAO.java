package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entites.Category;
import utils.JpaUtil;

public class CategoryDAO {
	private EntityManager em;

	public CategoryDAO() {
		this.em = JpaUtil.getEntityManager();
	}
	
	
	public Category updatecate(Category entity) throws Exception {
		try {
			this.em.getTransaction().begin();

			this.em.merge(entity);
			this.em.flush();
			this.em.getTransaction().commit();

			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	public Category deletecate(Category entity) throws Exception {
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
	public Category createcate(Category entity) throws Exception {
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
	public List<Category> allcate() {
		String jpql = "SELECT o FROM Category o";
		TypedQuery<Category> query = this.em.createQuery(jpql, Category.class);

		List<Category> result1 = query.getResultList();

		return result1;
	}

	public Category findById(int id) {
		return this.em.find(Category.class, id);
	}
}
