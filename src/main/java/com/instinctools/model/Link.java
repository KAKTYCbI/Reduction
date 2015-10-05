package com.instinctools.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity()
@Table(name = "links")
public class Link {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(name = "domain")
	private String domain;
	
	@Column(name = "tag")
	private String tag;
	
	@Column(name = "information")
	private String information;
	
	@Column(name = "count")
	private Long count;
	
	@Column(name = "name_link")
	private String nameLink;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn( name = "user_id", nullable = false)
	private UserPrincipal user;
	
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

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}
    
	
	

}
