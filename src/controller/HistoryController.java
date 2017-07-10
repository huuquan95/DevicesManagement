package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/history")
public class HistoryController {

	@RequestMapping(value="",method=RequestMethod.GET)
	public String home(){
		return "history.index";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "history.add";
	}
}
