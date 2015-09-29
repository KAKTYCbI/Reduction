package com.instinctools.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.instinctools.app.repository.dao.LinkDao;
import com.instinctools.domain.service.LinkService;
import com.instinctools.model.Link;
import com.instinctools.model.UserPrincipal;

@Service()
@Transactional
public class LinkImplement implements LinkService{

	@Autowired
	private LinkDao linkRepository;
	
	@Override
	public void saveLink(Link link) {
		linkRepository.saveOrUpdate(link);
		
	}

	@Override
	public Link getLinkByLinkName(String linkName) {
		Link link=linkRepository.getLingByLinkName(linkName);
		return link;
	}

	@Override
	public List<Link> getLinks(Integer first, Integer max) {
		List<Link> links = linkRepository.getLinks(first, max);
		return links;
	}

	@Override
	public Number getSizeAllLink() {
		return linkRepository.getSizeAllLink();
	}

	@Override
	public List<Link> getLinksByUser(UserPrincipal user, Integer first,
			Integer max) {
		List<Link> links = linkRepository.getLinksByUser(user, first, max);
		return links;
	}

	@Override
	public Number getSizeLinkByUser(UserPrincipal user) {
		
		return linkRepository.getSizeLinkByUser(user);
	}

}
