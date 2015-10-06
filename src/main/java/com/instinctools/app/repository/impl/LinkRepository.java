package com.instinctools.app.repository.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.instinctools.app.repository.dao.LinkDao;
import com.instinctools.app.repository.hibernate.AbstractHibernateDao;
import com.instinctools.model.Link;
import com.instinctools.model.Tag;
import com.instinctools.model.UserPrincipal;

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
		Criteria criteria = getSession().createCriteria(Link.class).addOrder(Order.desc("id")).setFirstResult(first).setMaxResults(max);
		return (List<Link>) criteria.list();
	}

	@Override
	public Number getSizeAllLink() {
		Criteria criteria = getSession().createCriteria(Link.class).setProjection(Projections.rowCount());
		return (Number) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Link> getLinksByUser(UserPrincipal user, Integer first,
			Integer max) {
		Criteria criteria = getSession().createCriteria(Link.class).add(
				Restrictions.eq("user", user)).addOrder(Order.desc("id")).setFirstResult(first).setMaxResults(max);
		return (List<Link>) criteria.list();
	}

	@Override
	public Number getSizeLinkByUser(UserPrincipal user) {
		Criteria criteria = getSession().createCriteria(Link.class).add(
				Restrictions.eq("user", user)).setProjection(Projections.rowCount());
		return (Number) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Link> getLinksByTag(List<Tag> tag, Integer first, Integer max) {
		Criteria criteria = getSession().createCriteria(Link.class).add(
				Restrictions.eq("tags", tag)).addOrder(Order.desc("id")).setFirstResult(first).setMaxResults(max);
		return (List<Link>) criteria.list();
	}

	@Override
	public Number getSizeLinkByTag(Tag tag) {
		Criteria criteria = getSession().createCriteria(Tag.class).add(
				Restrictions.eq("name", tag.getName())).setProjection(Projections.rowCount());
		return (Number) criteria.uniqueResult();
	}

	
}
