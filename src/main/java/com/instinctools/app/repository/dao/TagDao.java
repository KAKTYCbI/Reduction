package com.instinctools.app.repository.dao;

import com.instinctools.app.repository.base.GenericDao;
import com.instinctools.model.Tag;

public interface TagDao extends GenericDao<Tag, Long>{
	
	Tag getByName(String name);

}
