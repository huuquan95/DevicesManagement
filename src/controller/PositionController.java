package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/position")
public class PositionController {

	@RequestMapping(value="",method=RequestMethod.GET)
	public String home(){
		return "position.index";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "position.add";
	}
}
