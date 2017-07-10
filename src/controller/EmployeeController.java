package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/employee")
public class EmployeeController {

	@RequestMapping(value="",method=RequestMethod.GET)
	public String home(){
		return "employee.index";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "employee.add";
	}
}
