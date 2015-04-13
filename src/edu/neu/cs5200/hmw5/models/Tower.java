package edu.neu.cs5200.hmw5.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.codehaus.jackson.annotate.JsonBackReference;

@Entity
public class Tower {
	@Id
	@SequenceGenerator( name = "mySeq", sequenceName = "MY_SEQ", allocationSize = 1, initialValue = 1 )
	@GeneratedValue(strategy=GenerationType.IDENTITY, generator="mySeq")
	private Integer id;
	private String name;
	private Integer height;
	private String sides;
	
	@OneToMany(mappedBy="tower")
	private List<Equipment> equipments;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JsonBackReference
	@JoinColumn(name="siteId")
	private Site site;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getHeight() {
		return height;
	}
	public void setHeight(Integer height) {
		this.height = height;
	}
	public String getSides() {
		return sides;
	}
	public void setSides(String sides) {
		this.sides = sides;
	}
	public Site getSite() {
		return site;
	}
	public void setSite(Site site) {
		this.site = site;
	}
	public List<Equipment> getEquipments() {
		return equipments;
	}
	public void setEquipments(List<Equipment> equipments) {
		this.equipments = equipments;
	}
	public Tower(Integer id, String name, Integer height, String sides,
			Site site, List<Equipment> equipments) {
		super();
		this.id = id;
		this.name = name;
		this.height = height;
		this.sides = sides;
		this.site = site;
		this.equipments = equipments;
	}
	public Tower() {
		super();
	}
	
}
