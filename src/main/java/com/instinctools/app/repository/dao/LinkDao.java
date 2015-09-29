package com.instinctools.app.repository.dao;

import java.util.List;

import com.instinctools.app.repository.base.GenericDao;
import com.instinctools.model.Link;
import com.instinctools.model.UserPrincipal;

public interface LinkDao extends GenericDao<Link, Long>{

  Link getLingByLinkName(String linkName);
  
  List<Link> getLinks(Integer first, Integer max);
  
  List<Link> getLinksByUser(UserPrincipal user, Integer first, Integer max);
  
  Number getSizeLinkByUser(UserPrincipal user);
  
  Number getSizeAllLink();
}
