package com.instinctools.app.repository.impl;

import org.springframework.stereotype.Repository;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.instinctools.app.repository.dao.UserDao;
import com.instinctools.app.repository.hibernate.AbstractHibernateDao;
import com.instinctools.model.UserPrincipal;



@Repository
public class UserRepository extends
		AbstractHibernateDao<UserPrincipal, Long> implements UserDao {
	

	public UserPrincipal getUser(String login, String password) {
		Criteria cr = getSession()
				.createCriteria(UserPrincipal.class, "users")
				.add(Restrictions.eq("login", login))
				.add(Restrictions.eq("password", password));
		return (UserPrincipal) cr.uniqueResult();
	}

	@Override
	public UserPrincipal getUserByName(String name) {
		Criteria cr = getSession().createCriteria(UserPrincipal.class,
				"users").add(Restrictions.eq("name", name));
		return (UserPrincipal) cr.uniqueResult();
	}

	@Override
	public UserPrincipal getUserByID(Long userId) {
		Criteria cr = getSession().createCriteria(UserPrincipal.class,
				"users").add(Restrictions.eq("user_id", userId));
		return (UserPrincipal) cr.uniqueResult();
	}

}
