package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.AccountDAO;
import dao.DeviceDAO;
import dao.EmployeeDAO;
import entities.Account;

@Controller
@RequestMapping(value = "/account")
public class AccountController {

	@Autowired
	private AccountDAO mainDAO;
	@Autowired
	private DeviceDAO DeviceDAO;

	

	@ModelAttribute
	public void addCommons(ModelMap modelMap) {

	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(ModelMap modelMap) {
		modelMap.addAttribute("listItems", (mainDAO).getItems());
		return "account.index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		if(mainDAO.getListAdd().size() > 0){
			modelMap.addAttribute("listItem", mainDAO.getListAdd());
			return "account.add";
			
		}else{
			
			return "redirect:/account?msg=notadd";
		}
		
		
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("objItem") Account objItem, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "account.add";
		}
		if (mainDAO.checkAccount(objItem.getUsername()) != null) {
			return "redirect:/admin/cat/add?check=err";

		}
		if (mainDAO.addItem(objItem) > 0) {
			return "redirect:/account?msg=add";
		} else {
			return "redirect:/account?msg=err";
		}
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(ModelMap modelMap, @PathVariable("id") int id) {
		modelMap.addAttribute("objItem", mainDAO.getItem(id));
		System.out.println(mainDAO.getItem(id).getUsername());
		return "account.edit";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@PathVariable("id") int id, @Valid @ModelAttribute("objItem") Account objItem,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "account.edit";
		}
		if (mainDAO.editItem(objItem) > 0) {
			return "redirect:/account?msg=edit";
		} else {
			return "redirect:/account?msg=err";
		}

	}

	@RequestMapping(value = "del/{id}", method = RequestMethod.GET)
	public String del(@PathVariable("id") int id) {
		if (mainDAO.delItem(id) > 0) {
			return "redirect:/account?msg=del";
		} else {
			return "redirect:/account?msg=err";
		}
	}

	@RequestMapping(value = "active", method = RequestMethod.POST)
	public void active(HttpServletRequest request, HttpServletResponse response, @RequestParam("id") int id,
			@RequestParam("enabled") int enabled) throws IOException {
		if (enabled == 1) {
			if (mainDAO.active(id, 0) > 0) {
				response.getWriter()
						.print("<img onclick='return getActive(" + id + "," + 0
								+ ")' height=\"25px\" width=\"25px\" src=\"" + request.getContextPath()
								+ "/templates/img/icons/delete-icon.png\" alt=\"\" />");
			}
		}
		if (enabled == 0) {
			if (mainDAO.active(id, 1) > 0) {
				response.getWriter()
						.print("<img onclick='return getActive(" + id + "," + 1
								+ ")' height=\"25px\" width=\"25px\" src=\"" + request.getContextPath()
								+ "/templates/img/icons/68111340feb.jpg\" alt=\"\" />");
			}
		}

	}

	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String detail(ModelMap modelMap, @PathVariable("id") int id) {
		System.out.println("detail");
		modelMap.addAttribute("objDevice", DeviceDAO.getItems(id));
		return "account.detail";
	}

}
