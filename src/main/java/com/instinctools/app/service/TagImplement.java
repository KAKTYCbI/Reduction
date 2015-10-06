package com.instinctools.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.instinctools.app.repository.dao.TagDao;
import com.instinctools.domain.service.TagService;
import com.instinctools.model.Tag;

@Service()
@Transactional
public class TagImplement implements TagService{

	@Autowired
	private TagDao tagRepository;
	
	@Override
	public void saveTag(Tag tag) {
		tagRepository.saveOrUpdate(tag);
		
	}

	@Override
	public Tag getByName(String name) {
	
		return tagRepository.getByName(name);
	}

}
