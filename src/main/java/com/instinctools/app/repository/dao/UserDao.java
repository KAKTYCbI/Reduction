package com.instinctools.app.repository.dao;

import com.instinctools.app.repository.base.GenericDao;
import com.instinctools.model.UserPrincipal;

public interface UserDao extends GenericDao<UserPrincipal, Long> {

	UserPrincipal getUser(String login, String password);

	UserPrincipal getUserByID(Long userId);

	UserPrincipal getUserByName(String name);

}
