package utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtil {
	/*
	 * Không đặt static em & emf
	 * https://stackoverflow.com/a/8621429
	 * https://stackoverflow.com/a/54722284/5938111
	 */

	public static EntityManagerFactory getEMFactory() {
		EntityManagerFactory factory =
			Persistence.createEntityManagerFactory("Assignment_Java4");
		return factory;
	}

	public static EntityManager getEntityManager() {
		EntityManager em =
			JpaUtil.getEMFactory().createEntityManager();
		return em;
	}
}
