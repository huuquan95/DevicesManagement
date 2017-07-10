package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.AccountDAO;
import dao.ContactDAO;
import entities.Contact;

@Controller
@RequestMapping(value = "/contact")
public class ContactController {

	@Autowired
	private ContactDAO mainDAO;

	@Autowired
	private AccountDAO accountDAO;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(ModelMap modelMap) {

		modelMap.addAttribute("listItems", mainDAO.getItems());
		return "contact.index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpSession session, ModelMap modelMap) {
		String username = (String) session.getAttribute("userInfo");
		modelMap.addAttribute("idAccount", accountDAO.getItem(username).getId());
		return "contact.add";
	}

	@RequestMapping(value = "/add/{idAccount}", method = RequestMethod.POST)
	public String add(@PathVariable("idAccount") int idAccount, @RequestParam("description") String description,
			ModelMap modelMap) {

		Contact contact = new Contact(idAccount, description);

		if (mainDAO.addItem(contact) == 1) {
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

			response.getWriter().print("");

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