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

import dao.PositionDAO;
import entities.Position;


@Controller
@RequestMapping(value="/position")
public class PositionController {

	@Autowired
	private PositionDAO mainDAO;


	@RequestMapping(value="",method=RequestMethod.GET)
	public String home(ModelMap modelMap){
		modelMap.addAttribute("listItems", mainDAO.getItems());
		return "position.index";
	}

	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "position.add";
	}


	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute("objItem") Position objItem,BindingResult bindingResult ){
		if(bindingResult.hasErrors()){
			return "position.add";
		}
		if(mainDAO.checkPos(objItem.getNamePos())!=null){
			return "redirect:/position/add?check=err";

		}
		if(mainDAO.addItem(objItem)>0){
			return "redirect:/position?msg=add";
		}else{
			return "redirect:/position/add?msg=err";
		}
	}

	@RequestMapping(value="edit/{id}", method=RequestMethod.GET)
	public String edit(ModelMap modelMap,@PathVariable("id") int id){
		modelMap.addAttribute("objItem", mainDAO.getItem(id));
		return "position.edit";
	}


	@RequestMapping(value="edit/{id}", method=RequestMethod.POST)
	public String edit(@PathVariable("id") int id,@Valid @ModelAttribute("objItemUpdate") Position objItemUpdate,BindingResult bindingResult ){
		if(bindingResult.hasErrors()){
			return "position.edit";
		}
		objItemUpdate.setId(id);
		if(mainDAO.editItem(objItemUpdate)>0){
			return "redirect:/position?msg=edit";
		}else{
			return "redirect:/position/edit?msg=err";
		}
	}

	@RequestMapping(value="del/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id){
		if(mainDAO.delItem(id)>0){
			return "redirect:/position?msg=del";
		}else{
			return "redirect:/postion?msg=err";
		}
	}

}
