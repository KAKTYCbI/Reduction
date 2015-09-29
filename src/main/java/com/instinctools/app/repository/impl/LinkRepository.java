package com.instinctools.app.repository.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import com.instinctools.app.repository.dao.LinkDao;
import com.instinctools.app.repository.hibernate.AbstractHibernateDao;
import com.instinctools.model.Link;

@Repository
public class LinkRepository extends AbstractHibernateDao<Link, Long> implements LinkDao{

	@Override
	public Link getLingByLinkName(String linkName) {
		Criteria cr = getSession().createCriteria(Link.class,
				"links").add(Restrictions.eq("nameLink", linkName));
		return (Link) cr.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Link> getLinks(Integer first, Integer max) {
		Criteria criteria = getSession().createCriteria(Link.class).setFirstResult(first).setMaxResults(max);
		return (List<Link>) criteria.list();
	}

	@Override
	public Number getSizeAllLink() {
		Criteria criteria = getSession().createCriteria(Link.class).setProjection(Projections.rowCount());
		return (Number) criteria.uniqueResult();
	}

	
}
