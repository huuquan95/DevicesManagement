package controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/home")
public class HomeController {

	@ModelAttribute
	public void addCommons(ModelMap modelMap,Principal principal,HttpSession session){
		if(principal!=null){
			session.setAttribute("username",principal.getName());
		}
		
	}
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String home(){
		return "home.index";
	}
}
