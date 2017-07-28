package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import dao.ContactDAO;
import entities.Account;
import entities.Contact;

@Controller
@RequestMapping(value = "/contact")
public class ContactController {

	@Autowired
	private ContactDAO mainDAO;

	@Autowired
	private AccountDAO accountDAO;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(ModelMap modelMap, HttpSession session) {

		Account objLogin = (Account) session.getAttribute("objLogin");

		if (objLogin.getRole().equals("ADMIN")) {

			modelMap.addAttribute("listItems", mainDAO.getItems());
			modelMap.addAttribute("objLogin", objLogin);

			return "contact.index";
		} else {

			modelMap.addAttribute("listItems", mainDAO.getItems(objLogin.getId()));
			modelMap.addAttribute("objLogin", objLogin);

			return "contact.index";
		}
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpSession session, ModelMap modelMap) {

		return "contact.add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("objItem") Contact contact, BindingResult bindingResult, ModelMap modelMap,
			HttpSession session) {

		if (bindingResult.hasErrors()) {
			return "contact.add";
		}

		String username = (String) session.getAttribute("userLogin");
		Account objAC = accountDAO.getItem(username);
		int idAccount = objAC.getId();
		contact = new Contact(idAccount, contact.getDescription());

		if (mainDAO.addItem(contact) == 1) {

			session.setAttribute("numberOfNewMessages", (int) session.getAttribute("numberOfNewMessages") + 1);
			return "redirect:/contact?msg=add";
		} else {

			return "redirect:/contact?msg=err";
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public void edit(HttpServletRequest request, HttpServletResponse response, @RequestParam("id") int id,
			@RequestParam("status") String status) throws IOException {

		Contact contact = new Contact();
		contact.setId(id);
		contact.setStatus(status);

		if (mainDAO.editItem(contact) == 1) {

			if (status.equals("in progress"))

				response.getWriter().print("<select id=\"status" + id + "\" name=\"status\" onchange=\"changeStatus("
						+ id
						+ ")\" class=\"form-control\" style=\"width: 70%;\"><option value=\"in progress\" selected=\"selected\">inprogress</option><option value=\"resolved\">resolved</option></select>");
			else
				response.getWriter().print("resolved");
		} else {
		}
	}

	@RequestMapping(value = "del/{id}", method = RequestMethod.GET)
	public String del(@PathVariable("id") int id) {

		if (mainDAO.delItem(id) > 0) {
			return "redirect:/contact?msg=del";
		} else {
			return "redirect:/contact?msg=err";
		}
	}
}