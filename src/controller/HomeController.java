package controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.CatDAO;
import dao.ContactDAO;
import dao.DeviceDAO;
import dao.EmployeeDAO;

@Controller
@RequestMapping(value="/home")
public class HomeController {
	@Autowired 
	private EmployeeDAO employDAO;
	
	@Autowired 
	private ContactDAO contactDAO;
	
	@Autowired 
	private DeviceDAO deviceDAO;
	
	@Autowired 
	private CatDAO catDAO;
	
	
	@ModelAttribute
	public void addCommons(ModelMap modelMap,Principal principal,HttpSession session){
		if(principal!=null){
			session.setAttribute("username",principal.getName());
		}
	}
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String home(ModelMap modelMap){
		modelMap.addAttribute("sizeEmployee", employDAO.getList().size());
		modelMap.addAttribute("numberOfDevices", deviceDAO.getItems().size());
		modelMap.addAttribute("numberOfCat", catDAO.getItems().size());
//		modelMap.addAttribute("sizeMessage", contactDAO.getItems().size());
		return "home.index";
	}
}
