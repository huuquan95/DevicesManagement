package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.AccountDAO;
import dao.CatDAO;
import dao.DeviceDAO;
import dao.HistoryDAO;
import entities.History;

@Controller
@RequestMapping(value = "/history")
public class HistoryController {

	@Autowired
	private HistoryDAO hisDAO;
	
	@Autowired
	private CatDAO catDAO;
	
	@Autowired
	private DeviceDAO devDAO;
	
	@Autowired
	private AccountDAO accDAO;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}
	
	@ModelAttribute
	public void addCommons(ModelMap modelMap){
		 modelMap.addAttribute("listItems", hisDAO.getItemsAccount());
		 modelMap.addAttribute("listDevice", hisDAO.getItemsDevice());
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(HttpSession session, ModelMap modelMap) {
		String username = (String) session.getAttribute("userLogin");
		if("admin".equalsIgnoreCase(accDAO.checkAccount(username).getRole())){
			session.setAttribute("check", true);
		}
		modelMap.addAttribute("listHis", hisDAO.getItems());
		return "history.index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		return "history.add";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("objHis") History objHis ,BindingResult bindingResult, ModelMap modelMap) {
		if(bindingResult.hasErrors()) {
			return "history.add";
		}
		if(hisDAO.checkValid(objHis.getSeri_number(), objHis.getId_Equipment()) == null) {
			modelMap.addAttribute("check","error");
			return "history.add";
		}
		if(hisDAO.addItems(objHis) > 0){
			return "redirect:/history?msg=add";
		}
		return "redirect:/history?msg=error";
	}
	
	@RequestMapping(value = "/del/{idHis}", method = RequestMethod.GET)
	public String del(@PathVariable("idHis") int idHis) {
		if(hisDAO.delItem(idHis) > 0){
			return "redirect:/history?msg=del";
		}
		return "redirect:/history?msg=error";
	}
	
	@RequestMapping(value = "/detail/{idHis}", method = RequestMethod.GET)
	public String detail(@PathVariable("idHis") int idHis, ModelMap modelMap) {
		modelMap.addAttribute("listDev", devDAO.getItems());
		modelMap.addAttribute("listCat", catDAO.getItems());
		modelMap.addAttribute("listAcc", accDAO.getItems());
		modelMap.addAttribute("objHisDetail", hisDAO.getDetail(idHis));
		return "history.detail";
	}
	
	@RequestMapping(value = "/update/{idHis}", method = RequestMethod.POST)
	public String update(@PathVariable("idHis") int idHis, @ModelAttribute("objHis") History objHis) {
		objHis.setId(idHis);
		if(hisDAO.updateItems(objHis) > 0){
			return "redirect:/history?msg=edit";
		}
		return "redirect:/history?msg=error";
	}
}
