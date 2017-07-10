package controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuthController {
	
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(Principal principal,ModelMap modelMap){
		if(principal!=null){
			return "redirect:/home";
		}
		return "auth/login";
	}
	
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(){
		return "";
	}
	
	@RequestMapping(value="/403",method=RequestMethod.GET)
	public String er403(){
		return "auth/er403";
	}
}
