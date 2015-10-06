package com.instinctools.app.repository.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.instinctools.app.repository.dao.TagDao;
import com.instinctools.app.repository.hibernate.AbstractHibernateDao;
import com.instinctools.model.Tag;

@Repository
public class TagRepository extends AbstractHibernateDao<Tag, Long> implements TagDao {

	@Override
	public Tag getByName(String name) {
		Criteria cr = getSession().createCriteria(Tag.class,
				"tags").add(Restrictions.eq("name", name));
		
		return (Tag) cr.uniqueResult();
	}

}
