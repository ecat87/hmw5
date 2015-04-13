package edu.neu.cs5200.hmw5.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.hmw5.models.Site;

public class siteDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("hmw5");
	EntityManager em = factory.createEntityManager();
	
	//createSite
	public List<Site> createSite(Site site) {
		em.getTransaction().begin();
		em.persist(site);
		Query query = em.createQuery("select site from Site site");
		em.getTransaction().commit();
		return (List<Site>)query.getResultList();
	}

	//findSite
	public Site findSite(Integer siteId){
		return em.find(Site.class, siteId);
	}
	
	//findAllSites
	public List<Site> findAllSites(){
		Query query = em.createQuery("select site from Site site");//object-oriented psedo-sql
		return (List<Site>)query.getResultList();
	}
	
	//updateSite
	public List<Site> updateSite(Integer siteId, Site site){
		em.getTransaction().begin();
		site.setId(siteId);
		em.merge(site);
		Query query = em.createQuery("select site from Site site");
		em.getTransaction().commit();
		return (List<Site>)query.getResultList();
	}
	//removeSite
	public List<Site> removeSite(Integer siteId){
		em.getTransaction().begin();
		Site site = em.find(Site.class, siteId);
		em.remove(site);
		em.getTransaction().commit();
		Query query = em.createQuery("select site from Site site");
		return (List<Site>)query.getResultList();
	}
	
}
