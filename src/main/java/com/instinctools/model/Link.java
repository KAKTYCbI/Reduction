package com.instinctools.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;



@Entity()
@Table(name = "links")
public class Link {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(name = "domain")
	private String domain;
	
	@Column(name = "information")
	private String information;
	
	@Column(name = "count")
	private Long count;
	
	@Column(name="tag")
	private String tag1;
	
	@Column(name = "name_link")
	private String nameLink;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn( name = "user_id", nullable = false)
	private UserPrincipal user;
	
	
	@ManyToMany
	@JoinTable(name = "tags_has_links", 
			joinColumns = { 
				@JoinColumn(name = "link_id", nullable = false) }, 
				inverseJoinColumns = { @JoinColumn(name = "tag_id", nullable = false) })
    private List<Tag> tags;
		
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getNameLink() {
		return nameLink;
	}

	public void setNameLink(String nameLink) {
		this.nameLink = nameLink;
	}

	public UserPrincipal getUser() {
		return user;
	}

	public void setUser(UserPrincipal user) {
		this.user = user;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}


	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public String getTag1() {
		return tag1;
	}

	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}


}
