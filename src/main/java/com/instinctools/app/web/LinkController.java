package com.instinctools.app.web;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.instinctools.domain.service.LinkService;
import com.instinctools.domain.service.UserService;
import com.instinctools.model.Link;
import com.instinctools.model.UserPrincipal;
import com.instinctools.model.UserRole;


@Controller
@RequestMapping("client")
public class LinkController {

	@Autowired
	private LinkService linkService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = { "/addlink" }, method = { RequestMethod.GET })
	public String addLink(Model model) {
		model.addAttribute("link", new Link());
		return "addlink";
	}
	
	@PreAuthorize("isFullyAuthenticated()")
	@RequestMapping(value = { "/addlink" }, method = { RequestMethod.POST })
	public String addlink(@ModelAttribute("link") Link link,  Model model, HttpSession session, Authentication auth) {
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
		linkService.saveLink(link);
	    return "redirect:/home";
	}

	
	
}
