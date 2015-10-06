package com.instinctools.app.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.instinctools.domain.service.LinkService;
import com.instinctools.domain.service.TagService;
import com.instinctools.domain.service.UserService;
import com.instinctools.model.Link;
import com.instinctools.model.Tag;
import com.instinctools.model.UserPrincipal;


@Controller
@RequestMapping("client")
public class LinkController {

	@Autowired
	private LinkService linkService;
	
	@Autowired
	private TagService tagService;
	
	@Autowired
	private UserService userService;
	
	@PreAuthorize("isFullyAuthenticated()")
	@RequestMapping(value = { "/addlink" }, method = { RequestMethod.GET })
	public ModelAndView addLink(Model model,  Authentication auth) {
		ModelAndView mav = new ModelAndView();
		UserPrincipal user = userService.getUserByName(auth.getName());
		mav.addObject("user", user);
		mav.addObject("link", new Link());
		mav.setViewName("addlink");
		return mav;
	}
	
	@PreAuthorize("isFullyAuthenticated()")
	@RequestMapping(value = { "/addlink" }, method = { RequestMethod.POST })
	public String addlink(@ModelAttribute("link") Link link, Model model, HttpSession session, Authentication auth) {
		UserPrincipal user = userService.getUserByName(auth.getName());
        link.setUser(user);
        link.setCount(0l);
        Boolean enabled = false;
        Random random = new Random();
        Integer tmp = null;
        while (enabled==false)
        {
        	tmp = random.nextInt(32000); 
            Link link1= linkService.getLinkByLinkName(tmp.toString());
            if (link1 == null)
            {
            	enabled = true;
            }
        }
        link.setNameLink(tmp.toString());
        List<Tag> tags1 = new ArrayList<Tag>();
        String[] tags = link.getTag1().split(", ");
        for(int i=0;i<tags.length;i++)
        {
        	Tag tag1 = tagService.getByName(tags[i]);
        	if (tag1 == null)
        	{
        		Tag tag2 = new Tag();
        	    tag2.setName(tags[i]);
        	    tagService.saveTag(tag2);
        	    tag2 = tagService.getByName(tags[i]); 
        	    tags1.add(tag2);
    		
        	}
        	else
        	{
        		tags1.add(tag1);
        	}
        }
        link.setTags(tags1);
		linkService.saveLink(link);
	    return "redirect:/home";
	}
	
	@PreAuthorize("isFullyAuthenticated()")
	@RequestMapping(value = { "/info/{x}" }, method = { RequestMethod.GET })
	public String  infoLink(Model model, @PathVariable String x, Authentication auth) {
		UserPrincipal user = userService.getUserByName(auth.getName());
		Link link = linkService.getLinkByLinkName(x);
		model.addAttribute("link",link);
        model.addAttribute("user", user);  
	
		return "info";
	}
	
	@PreAuthorize("isFullyAuthenticated()")
	@RequestMapping(value = { "/update/{x}" }, method = { RequestMethod.GET })
	public String  updateLink(Model model, @PathVariable String x, Authentication auth) {
		UserPrincipal user = userService.getUserByName(auth.getName());
		Link link = linkService.getLinkByLinkName(x);
		model.addAttribute("link",link);
        model.addAttribute("user", user);  
	
		return "update";
	}
	
	@PreAuthorize("isFullyAuthenticated()")
	@RequestMapping(value = { "/update/{x}" }, method = { RequestMethod.POST })
	public String  updateLink(@RequestParam(value = "domain", required = false) String domain,
			@RequestParam(value = "information", required = false) String information,
			@RequestParam(value = "tag1", required = false) String tag3,
			Model model, @PathVariable String x, Authentication auth, HttpSession session) {
		UserPrincipal user = userService.getUserByName(auth.getName());
		Link link = linkService.getLinkByLinkName(x);
		link.setDomain(domain);
		link.setInformation(information);
		link.setTag1(tag3);
		List<Tag> tags1 = new ArrayList<Tag>();
        String[] tags = link.getTag1().split(", ");
        for(int i=0;i<tags.length;i++)
        {
        	Tag tag1 = tagService.getByName(tags[i]);
        	if (tag1 == null)
        	{
        		Tag tag2 = new Tag();
        	    tag2.setName(tags[i]);
        	    tagService.saveTag(tag2);
        	    tag2 = tagService.getByName(tags[i]); 
        	    tags1.add(tag2);
    		
        	}
        	else
        	{
        		tags1.add(tag1);
        	}
        }
        link.setTags(tags1);
		linkService.saveLink(link);    
		model.addAttribute("link",link);
        model.addAttribute("user", user);  
	
		return "update";
	}
	
	@PreAuthorize("isFullyAuthenticated()")
	@RequestMapping(value = { "/search/{x}" }, method = { RequestMethod.GET })
	public ModelAndView  searchLink(@PathVariable String x, @RequestParam(value = "page", required = false) Integer page,Authentication auth) {
		UserPrincipal user = userService.getUserByName(auth.getName());
		ModelAndView mav = new ModelAndView();
		Tag tag = tagService.getByName(x);
		mav.addObject("links",tag.getLinks());
		mav.addObject("user", user);
		mav.setViewName("search");
		return mav;
	}
}
