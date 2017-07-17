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

import dao.CatDAO;
import dao.DeviceDAO;
import entities.Cat;

@Controller
@RequestMapping(value="/cat")
public class CatController {
	
	@Autowired
	private CatDAO mainDAO;
	
	@Autowired
	private DeviceDAO deviceDAO;

	@RequestMapping(value="",method=RequestMethod.GET)
	public String home(ModelMap modelMap){
		modelMap.addAttribute("listItems", mainDAO.getItems());
		return "cat.index";
	}
	
	@RequestMapping(value="detail/{id}", method=RequestMethod.GET)
	public String detailbycat(ModelMap modelMap,@PathVariable("id") int id){
		modelMap.addAttribute("listItemsByIdCat", deviceDAO.getItemsByIdCat(id));
		modelMap.addAttribute("deviceDAO", deviceDAO);
		modelMap.addAttribute("objCat", mainDAO.getItem(id));
		return "cat.detail";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "cat.add";
	}
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute("objItem") Cat objItem,BindingResult bindingResult ){
		if(bindingResult.hasErrors()){
			return "cat.add";
		}
		if(mainDAO.checkCat(objItem.getName())!=null){
			return "redirect:/cat/add?check=err";
			
		}
		if(mainDAO.addItem(objItem)>0){
			return "redirect:/cat?msg=add";
		}else{
			return "redirect:/cat?msg=err";
		}
	}
	
	@RequestMapping(value="edit/{id}", method=RequestMethod.GET)
	public String edit(ModelMap modelMap,@PathVariable("id") int id){
		modelMap.addAttribute("objItem", mainDAO.getItem(id));
		return "cat.edit";
	}
	
	@RequestMapping(value="edit/{id}", method=RequestMethod.POST)
	public String edit(@PathVariable("id") int id,@Valid @ModelAttribute("objItemUpdate") Cat objItemUpdate,BindingResult bindingResult ){
		if(bindingResult.hasErrors()){
			return "cat.edit";
		}
		objItemUpdate.setId(id);
		if(mainDAO.editItem(objItemUpdate)>0){
			return "redirect:/cat?msg=edit";
		}else{
			return "redirect:/cat?msg=err";
		}
	}
	
	
	@RequestMapping(value="del/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id){
		deviceDAO.delItemByIDCat(id);
		if(mainDAO.delItem(id)>0){
			return "redirect:/cat?msg=del";
		}else{
			return "redirect:/cat?msg=err";
		}
	}
}
