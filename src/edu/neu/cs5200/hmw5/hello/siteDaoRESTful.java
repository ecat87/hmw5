package edu.neu.cs5200.hmw5.hello;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import edu.neu.cs5200.hmw5.dao.siteDao;
import edu.neu.cs5200.hmw5.models.Site;

@Path("/site")
public class siteDaoRESTful {

	//findAllSites
	@GET
	@Path("/")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Site> findAllSites(){
		siteDao dao = new siteDao();
		List<Site> sites = dao.findAllSites();
		return sites;
	}
	
	//findSite
	@GET
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Site findSite(@PathParam("id")Integer siteId){
		siteDao dao = new siteDao();
		return dao.findSite(siteId);
	}
	
	//createSite
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Site> createSite(Site site) {
		siteDao dao = new siteDao();
		List<Site> sites = dao.createSite(site);
		return sites;
	}
	
	//updateSite with a complete record
	//we can use PATCH to update partial fields of the record
	@PUT
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Site> updateSite(@PathParam("id")Integer siteId, Site site){
		siteDao dao = new siteDao();
		dao.updateSite(siteId, site);
		return dao.findAllSites();
	}
	
	//removeSite
	@DELETE
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Site> removeSite(@PathParam("id")Integer siteId){
		siteDao dao = new siteDao();
		List<Site> sites = dao.removeSite(siteId);
		return sites;
	}

}
