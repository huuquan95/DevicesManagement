package controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.DeviceDAO;
import dao.EmployeeDAO;
import dao.TeamDAO;

import entities.Team;

@Controller
@RequestMapping(value="/team")
public class TeamController {



	@Autowired
	private TeamDAO mainDAO;
	@Autowired
	private EmployeeDAO employeeDAO;
	@Autowired
	private DeviceDAO deviceDAO;
	@RequestMapping(value="",method=RequestMethod.GET)
	public String home(ModelMap modelMap){
		modelMap.addAttribute("listItems", mainDAO.getItems());
		return "team.index";
	}

	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "team.add";
	}

	@RequestMapping(value="devices/{id}", method=RequestMethod.GET)
	public String devices(ModelMap modelMap,@PathVariable("id") String id){
		modelMap.addAttribute("listItems", deviceDAO.getItemsByEmployee(id));
		String nameEm=employeeDAO.getItem(id).getName();
		modelMap.addAttribute("nameEmDetail", nameEm);
		return "team.devices";
	}
	
	@RequestMapping(value="employee/{id}", method=RequestMethod.GET)
	public String member(ModelMap modelMap,@PathVariable("id") String id){
		modelMap.addAttribute("listItems", employeeDAO.getListByTeam(id));
		String name=mainDAO.getItem(id).getName();
	    modelMap.addAttribute("nameTeamDetail", name);
		return "team.employee";
	}
	
	
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute("objItem") Team objItem,BindingResult bindingResult ){
		if(bindingResult.hasErrors()){
			return "team.add";
		}
		if(mainDAO.checkTeam(objItem.getName())!=null){
			return "redirect:/team/add?check=err";

		}
		if(mainDAO.addItem(objItem)>0){
			return "redirect:/team?msg=add";
		}else{
			return "redirect:/team/add?msg=err";
		}
	}

	@RequestMapping(value="edit/{id}", method=RequestMethod.GET)
	public String edit(ModelMap modelMap,@PathVariable("id") String id){
		modelMap.addAttribute("objItem", mainDAO.getItem(id));
		return "team.edit";
	}


	@RequestMapping(value="edit/{id}", method=RequestMethod.POST)
	public String edit(@PathVariable("id") String id,@Valid @ModelAttribute("objItemUpdate") Team objItemUpdate,BindingResult bindingResult ){
		if(bindingResult.hasErrors()){
			return "team.edit";
		}
		objItemUpdate.setId(id);
		if(mainDAO.editItem(objItemUpdate)>0){
			return "redirect:/team?msg=edit";
		}else{
			return "redirect:/team/edit?msg=err";
		}
	}

	@RequestMapping(value="del/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") String id){
		if(mainDAO.delItem(id)>0){
			return "redirect:/team?msg=del";
		}else{
			return "redirect:/team?msg=err";
		}
	}

}
