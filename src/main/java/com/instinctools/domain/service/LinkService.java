package com.instinctools.domain.service;

import java.util.List;

import com.instinctools.model.Link;

public interface LinkService {
	
	void saveLink(Link link);
	
	Link getLinkByLinkName(String linkName);
	
	List<Link> getLinks(Integer first,Integer max);
	
	Number getSizeAllLink();

}
