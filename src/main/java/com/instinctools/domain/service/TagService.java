package com.instinctools.domain.service;

import com.instinctools.model.Tag;

public interface TagService {
	
	void saveTag(Tag tag);
	
	Tag getByName(String name);
	
	

}
