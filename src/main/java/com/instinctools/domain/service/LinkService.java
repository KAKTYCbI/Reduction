package com.instinctools.domain.service;

import java.util.List;

import com.instinctools.model.Link;
import com.instinctools.model.UserPrincipal;

public interface LinkService {
	
	void saveLink(Link link);
	
	Link getLinkByLinkName(String linkName);
	
	List<Link> getLinks(Integer first,Integer max);
	
	List<Link> getLinksByUser(UserPrincipal user,Integer first,Integer max);
	
	Number getSizeLinkByUser(UserPrincipal user);
	
	Number getSizeAllLink();

}
