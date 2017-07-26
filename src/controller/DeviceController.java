package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import dao.AccountDAO;
import dao.CatDAO;
import dao.DeviceDAO;
import entities.Account;
import entities.Devices;

@Controller
@RequestMapping(value = "/device")
public class DeviceController {

	@Autowired
	private DeviceDAO mainDAO;

	@Autowired
	private CatDAO catDAO;

	@Autowired
	private AccountDAO accountDAO;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(ModelMap modelMap) {
		modelMap.addAttribute("listItems", mainDAO.getItems());
		modelMap.addAttribute("mainDAO", mainDAO);
		//System.out.println(mainDAO.getCount("R01"));
		return "device.index";
	}

	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String detail(ModelMap modelMap, @PathVariable("id") String id) {
		modelMap.addAttribute("listAccounts", accountDAO.getItems());
		modelMap.addAttribute("listItemDetails", mainDAO.getItemDetails(id));
		modelMap.addAttribute("idDetail", id);
		return "device.detail";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		modelMap.addAttribute("listCats", catDAO.getItems());
		modelMap.addAttribute("listAccounts", accountDAO.getItems());
		return "device.add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("objItem") Devices objItem, BindingResult bindingResult,
			@RequestParam("filename") CommonsMultipartFile commonsMultipartFile, HttpServletRequest request) {

		 if(bindingResult.hasErrors()){
		 return "device.add";
		 }
		// if(objItem.getIdAccount()==-1){
		// objItem.setIdAccount(1);
		// }
		if (mainDAO.checkDevices(objItem.getId(), objItem.getSeri_number()) != null) {
			return "redirect:/device/add?check=err";
		}

		String filename = commonsMultipartFile.getOriginalFilename();
		if (!filename.isEmpty()) {
			String filePath = request.getServletContext().getRealPath("files");
			File dir = new File(filePath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			filePath = filePath + File.separator + filename;
			File file = new File(filePath);
			try {
				commonsMultipartFile.transferTo(file);
				System.out.println("upload success");
			} catch (IllegalStateException | IOException e) {
				System.out.println("error");
				e.printStackTrace();
			}
		}
		objItem.setPicture(filename);
		if (mainDAO.addItem(objItem) > 0) {
			return "redirect:/device?msg=add";
		} else {
			return "redirect:/device?msg=err";
		}

	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(ModelMap modelMap, @PathVariable("id") String id) {
		modelMap.addAttribute("listCats", catDAO.getItems());
		modelMap.addAttribute("objItem", mainDAO.getItemDetail(id));
		return "device.edit";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@PathVariable("id") String id, @ModelAttribute("objItemUpdate") Devices objItemUpdate,
			@RequestParam("filename") CommonsMultipartFile commonsMultipartFile, HttpServletRequest request) {
		Devices objD = mainDAO.getItemDetail(id);
		objItemUpdate.setId(id);
		String filename = commonsMultipartFile.getOriginalFilename();
		if (!filename.isEmpty()) {
			if (!"".equals(objItemUpdate.getPicture())) {
				System.out.println(request.getServletContext().getRealPath("files"));
				String filePath = request.getServletContext()
						.getRealPath("files" + File.separator + objItemUpdate.getPicture());
				File fileCu = new File(filePath);
				fileCu.delete();
			}
			String filePath = request.getServletContext().getRealPath("files");
			File dir = new File(filePath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			filePath = filePath + File.separator + filename;
			File file = new File(filePath);
			try {
				commonsMultipartFile.transferTo(file);
				System.out.println("upload ok");
			} catch (IllegalStateException | IOException e) {
				System.out.println("error");
				e.printStackTrace();
			}
			objItemUpdate.setPicture(filename);
		} else {
			objItemUpdate.setPicture(objD.getPicture());
		}

		if (mainDAO.editItem(objItemUpdate) > 0) {
			return "redirect:/device?msg=edit";
		} else {
			return "redirect:/device?msg=err";
		}
	}

	@RequestMapping(value = "del/{id}", method = RequestMethod.GET)
	public String del(@PathVariable("id") String id) {
		if (mainDAO.delItem(id) > 0) {
			return "redirect:/device?msg=del";
		} else {
			return "redirect:/device?msg=err";
		}
	}

	@RequestMapping(value = "detail/add/{id}", method = RequestMethod.GET)
	public String add1(@PathVariable("id") String id, ModelMap modelMap) {
		modelMap.addAttribute("iddetail", id);
		modelMap.addAttribute("listAccounts", accountDAO.getItems());
		return "device.detail.add";
	}

	@RequestMapping(value = "detail/add/{id}", method = RequestMethod.POST)
	public String add1(@PathVariable("id") String id, ModelMap modelMap, @ModelAttribute("objItem") Devices objItem) {
		Devices objD = mainDAO.getItemDetail(id);
		modelMap.addAttribute("listAccounts", accountDAO.getItems());
		modelMap.addAttribute("iddetail", id);
		objItem.setId(id);
		objItem.setName(objD.getName());
		objItem.setIdCat(objD.getIdCat());
		objItem.setPicture(objD.getPicture());
		objItem.setMade_in(objD.getMade_in());

		if (mainDAO.checkDevices(objItem.getId(), objItem.getSeri_number()) != null) {
			return "redirect:/device/detail/add/" + id + "?check=err";
		}

		if (mainDAO.addItem(objItem) > 0) {
			return "redirect:/device/detail/" + id + "?msg=add";
		} else {
			return "redirect:/device/detail/" + id + "?msg=err";
		}
	}

	@RequestMapping(value = "detail/edit/{seri_number}", method = RequestMethod.GET)
	public String edit1(@PathVariable("seri_number") String seri_number, ModelMap modelMap) {
		modelMap.addAttribute("listAccounts", accountDAO.getItems());
		modelMap.addAttribute("objDeviceEdit", mainDAO.getItem(seri_number));
		Devices objD = mainDAO.getItem(seri_number);
		String id = objD.getId();
		modelMap.addAttribute("iddetail", id);
		return "device.detail.edit";
	}

	@RequestMapping(value = "detail/edit/{seri_number}", method = RequestMethod.POST)
	public String edit1(@PathVariable("seri_number") String seri_number, ModelMap modelMap,
			@ModelAttribute("objDeviceEdit") Devices objDeviceEdit) {
		modelMap.addAttribute("listAccounts", accountDAO.getItems());
		Devices objD = mainDAO.getItem(seri_number);
		String id = objD.getId();
		modelMap.addAttribute("iddetail", id);
		if (mainDAO.editItem1(objDeviceEdit) > 0) {
			return "redirect:/device/detail/" + id + "?msg=edit";
		} else {
			return "redirect:/device/detail/" + id + "?msg=err";
		}
	}

	@RequestMapping(value = "detail/del/{seri_number}", method = RequestMethod.GET)
	public String del1(@PathVariable("seri_number") String seri_number) {
		Devices objD = mainDAO.getItem(seri_number);
		String id = objD.getId();
		if (mainDAO.delItem(seri_number) > 0) {
			return "redirect:/device/detail/" + id + "?msg=del";
		} else {
			return "redirect:/device/detail/" + id + "?msg=err";
		}
	}

	@RequestMapping(value = "/change", method = RequestMethod.POST)
	public void change(@PathParam("aidAccount") int aidAccount, @PathParam("aseri") String aseri, ModelMap modelMap,
			HttpServletResponse response) throws IOException {
		System.out.println(aidAccount + "  " + aseri);
		Devices objItem = mainDAO.getItem(aseri);
		mainDAO.changeAccount(aseri, aidAccount); 
		String selected = "";
		String result = "";
		String rs = "";
		for (Account objAccount : accountDAO.getItems()) {
			if (objAccount.getId() == objItem.getIdAccount()) {
				selected = "selected='selected'";
			} else {
				selected = "";
			}
			rs += "<option " + selected + " value=\"" + objAccount.getId() + "\">" + objAccount.getUsername()
					+ "</option>";
		}
		result = "<select onchange=\"return Change(" + aidAccount + ",'" + aseri
				+ "')\" name=\"idAccount\" class=\"form-control select\">"
				+  rs + "</select>" ;
		response.getWriter().print(result);
	}

}
