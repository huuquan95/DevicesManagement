package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/team")
public class TeamController {

	@RequestMapping(value="",method=RequestMethod.GET)
	public String home(){
		return "team.index";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "team.add";
	}
	
}
