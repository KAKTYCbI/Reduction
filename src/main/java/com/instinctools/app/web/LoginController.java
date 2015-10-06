package com.instinctools.app.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
import com.instinctools.model.UserRole;

@Controller
@RequestMapping("")
public class LoginController {

	@Autowired
	private LinkService linkService;
	
	@Autowired
	private TagService tagService;
	
	@Autowired
	private UserService userService;
	

	@RequestMapping(value = { "", "/", "/login" }, method = { RequestMethod.GET })
	public String login() {
		return "login";
	}

	@RequestMapping(value = { "/access-denied" }, method = { RequestMethod.GET })
	public String denied() {
		return "denied";
	}
	
	@RequestMapping(value = { "/registration" }, method = { RequestMethod.GET })
	public String registration(Model model) {
		model.addAttribute("user", new UserPrincipal());
		return "registration";
	}
	
	@RequestMapping(value = { "/guesthome" }, method = { RequestMethod.GET })
	public ModelAndView guestHome(@RequestParam(value = "page", required = false) Integer page, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(page==null) page = 1;
		Integer pageSize = 3;
		Integer startPage = page;
		Integer endPage = page + 5;
		Number size1 = linkService.getSizeAllLink();
		int size = Integer.parseInt(size1.toString());
		Integer lastPage = (size+(pageSize-1)) / pageSize;
		if(endPage >= lastPage) endPage = lastPage;
		if(endPage >= 5 && (endPage - startPage) < 5) startPage = endPage -5;
		mav.addObject("page", page);
		mav.addObject("startpage", startPage);
		mav.addObject("endpage", endPage);
		mav.addObject("links", linkService.getLinks((page-1)*pageSize,pageSize));
		mav.setViewName("guesthome");
		return mav;
	}
	
	@RequestMapping(value = { "/{x}" }, method = { RequestMethod.GET })
	public String  redirectLink(@PathVariable String x) {
		Link link = linkService.getLinkByLinkName(x);
		if (link!=null)
		{
		link.setCount(link.getCount()+1); 
		linkService.saveLink(link);
		return "redirect:http://"+link.getDomain();
		}
		else
		{
			return "redirect:/login";
		}
	}
	
	
	@RequestMapping(value = { "/info/{x}" }, method = { RequestMethod.GET })
	public String  infoLink(Model model, @PathVariable String x, HttpSession session) {
		Link link = linkService.getLinkByLinkName(x);
		model.addAttribute("link",link);
        session.invalidate();
	
		return "infoguest";
	}
	
	@RequestMapping(value = { "/search/{x}" }, method = { RequestMethod.GET })
	public ModelAndView  searchLink(@PathVariable String x, @RequestParam(value = "page", required = false) Integer page) {
		ModelAndView mav = new ModelAndView();
		Tag tag = tagService.getByName(x);
		mav.addObject("links",tag.getLinks());
		mav.setViewName("searchguest");
		return mav;
	}
	
	@RequestMapping(value = { "/registration" }, method = { RequestMethod.POST })
	public String registration(@ModelAttribute("user") UserPrincipal user,  Model model, HttpSession session) {

		UserPrincipal user2 = userService.getUserByName(user.getName());
        if (user2 == null){
        user.setRole(UserRole.CLIENT);	
		userService.saveUser(user);
        }
	    return "login";
	}

	@RequestMapping(value = "/login/failure", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {

		model.addAttribute("error", "dsjkfhdskjfhdskjfhjds");
		return "login";

	}

	@RequestMapping(value = "/login", method = { RequestMethod.POST })
	public ModelAndView login(
			@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password,
			HttpServletRequest request, HttpSession session) {

		ModelAndView mav = new ModelAndView();

		UserPrincipal user = userService.getUserByName(username);

		System.out.println("user: " + user.getClass().getCanonicalName());
		System.out.println("role: " + user.getRole().toString());

		session.setAttribute("user", user);
		mav.addObject("user", user);
		mav.setViewName("client.home");

		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {

		ModelAndView model = new ModelAndView();
		model.setViewName("login");

		session.setAttribute("user", null);
		session.invalidate();

		return model;
	}
	@PreAuthorize("isFullyAuthenticated()") 
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView  getHome(@RequestParam(value = "page", required = false) Integer page, HttpSession session, Authentication auth){
		ModelAndView mav = new ModelAndView();
		UserPrincipal user = userService.getUserByName(auth.getName());
		if(page==null) page = 1;
		Integer pageSize = 3;
		Integer startPage = page;
		Integer endPage = page + 5;
		Number size1 = linkService.getSizeLinkByUser(user);
		int size = Integer.parseInt(size1.toString());
		Integer lastPage = (size+(pageSize-1)) / pageSize;
		if(endPage >= lastPage) endPage = lastPage;
		if(endPage >= 5 && (endPage - startPage) < 5) startPage = endPage -5;
		mav.addObject("page", page);
		mav.addObject("startpage", startPage);
		mav.addObject("endpage", endPage);
		mav.addObject("user",user);
		mav.addObject("links", linkService.getLinksByUser(user, (page-1)*pageSize,pageSize));
		mav.setViewName("home");
		return mav;
	}

	
}