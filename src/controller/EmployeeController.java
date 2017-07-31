package controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import dao.AccountDAO;
import dao.EmployeeDAO;
import dao.PositionDAO;
import dao.TeamDAO;
import entities.Account;
import entities.Employee;
import utils.RenameFileLibrary;

@Controller
@RequestMapping(value = "/employee")
public class EmployeeController {
	@Autowired
	private EmployeeDAO employeeDAO;
	
	@Autowired
	private PositionDAO positionDAO;
	
	@Autowired
	private TeamDAO teamDAO;
	
	@Autowired 
	private AccountDAO accountDAO;
	
	@Autowired
	private RenameFileLibrary renameFileLibrary;
	
	// cấu hình dữ liệu của web theo hướng mà bạn muốn mà
	// không cần controller.
	// sẽ nạp dòng lệnh này vào các anotation khác.
	// phương thức initBinder không có kiểu trả về
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}
	
	@ModelAttribute
	public void addCommons(ModelMap modelMap){
		modelMap.addAttribute("listTeam", teamDAO.getItems());
		modelMap.addAttribute("listPosition", positionDAO.getItems());
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(ModelMap modelMap,HttpSession session) {
		String username = (String) session.getAttribute("userLogin");
		if("admin".equalsIgnoreCase(accountDAO.checkAccount(username).getRole())){
			session.setAttribute("check", true);
		}
		String idObjLogin = accountDAO.getItem(username).getId_Employee();
		modelMap.addAttribute("idObjLogin", idObjLogin);
		modelMap.addAttribute("listItems", employeeDAO.getList());
		return "employee.index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap modelMap, HttpSession session) {
		//check role access.
		String username = (String) session.getAttribute("userLogin");
		if("admin".equalsIgnoreCase(accountDAO.checkAccount(username).getRole())){
				return "employee.add";
		}else {
			return "redirect:/employee?msg=wrong";
		}
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("objEmployee") Employee objEmployee, BindingResult bindingResult,
			@RequestParam("img") CommonsMultipartFile multipartFile, HttpServletRequest request) {
		if (bindingResult.hasErrors()) {
			return "employee.add";
		}
		if (!employeeDAO.checkID(objEmployee.getId())) {
			return "redirect:/employee?msg=exist";
		}
		// xử lý img
		objEmployee.setPicture(multipartFile.getOriginalFilename());
		String fileName = multipartFile.getOriginalFilename();
		if (!"".equals(fileName)) {
			// upload file
			// rename name file picture
			String fileRename = renameFileLibrary.renameFile(multipartFile.getOriginalFilename());
			objEmployee.setPicture(fileRename);
			String filePath = request.getServletContext().getRealPath("files");
			System.out.println(filePath);

			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdir();
			}
			File fileUpload = new File(filePath + File.separator + fileRename);
			try {
				multipartFile.transferTo(fileUpload);
				System.out.println("upload file success");
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				System.out.println("Loi upload");
			}
		}
		if (employeeDAO.addItem(objEmployee) > 0) {
			return "redirect:/employee?msg=add";
		}
		return "redirect:/employee/error";
	}

	@RequestMapping(value = "/del/{id}", method = RequestMethod.GET)
	public String del(@PathVariable("id") String id, HttpServletRequest request, HttpSession session) {
		//check role access.
		String username = (String) session.getAttribute("userLogin");
		if(!"admin".equalsIgnoreCase(accountDAO.checkAccount(username).getRole())){
			return "redirect:/employee?msg=wrong";
		} else {
			if(id.equalsIgnoreCase(accountDAO.checkAccount(username).getId_Employee())){
				return "redirect:/employee?msg=wrong";
			}else {
				// delete file img
				String picture = employeeDAO.getItem(id).getPicture();
				final String path = request.getServletContext().getRealPath("files");
				if (!"".equals(picture)) {
					String urlFile = path + File.separator + picture;
					File delFile = new File(urlFile);
					delFile.delete();
				}
				if (employeeDAO.delItem(id) > 0) {
					return "redirect:/employee?msg=del";
				} else {
					return "redirect:/employee?msg=error";
				}
			}
		}
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") String id, ModelMap modelMap, HttpSession session) {
		String username = (String) session.getAttribute("userLogin");
		if("admin".equalsIgnoreCase(accountDAO.checkAccount(username).getRole())){
				modelMap.addAttribute("objEmployee", employeeDAO.getItem(id));
				return "employee.edit";
		}else {
			if(id.equals(accountDAO.getItem(username).getId_Employee())) {
				modelMap.addAttribute("objEmployee", employeeDAO.getItem(id));
				return "employee.edit";
			}else 
				return "redirect:/employee?msg=wrong";
		}
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public String edit(@PathVariable("id") String id,@Valid @ModelAttribute("objEmployee") Employee objEmployee, BindingResult bindingResult, @RequestParam("filename") CommonsMultipartFile commonsMultipartFile, 
			HttpServletRequest request,HttpSession session,Principal principal) {
		// change picture and update it
		String user=(String)session.getAttribute("userLogin");
		Account objLogin = (Account) session.getAttribute("objLogin");

		if(bindingResult.hasErrors()){
			return "employee.edit";
		}
		objEmployee.setId(id);
		// del picture old, rename file img
		if (!"".equals(commonsMultipartFile.getOriginalFilename())) {
			// delete picture old
			final String path = request.getServletContext().getRealPath("files");
			String fileNameOld = employeeDAO.getItem(id).getPicture();
			if (!"".equals(fileNameOld)) {
				String urlFile = path + File.separator + fileNameOld;
				File delFile = new File(urlFile);
				delFile.delete();
			}

			// upload file img
			objEmployee.setPicture(commonsMultipartFile.getOriginalFilename());
			String fileName = commonsMultipartFile.getOriginalFilename();
			if (!"".equals(fileName)) {
				// rename name file picture
				String fileRename = renameFileLibrary.renameFile(commonsMultipartFile.getOriginalFilename());
				objEmployee.setPicture(fileRename);
				String filePath = request.getServletContext().getRealPath("files");
				System.out.println(filePath);

				File file = new File(filePath);

				if (!file.exists()) {
					file.mkdir();
				}

				File fileUpload = new File(filePath + File.separatorChar + fileRename);
				
				try {
					commonsMultipartFile.transferTo(fileUpload);
					System.out.println("upload file success");
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					System.out.println("Loi upload");
				}
			}
		} else {
			// keep picture old
			objEmployee.setPicture(employeeDAO.getItem(id).getPicture());
		}

		if (employeeDAO.editItem(objEmployee) > 0) {
			if((employeeDAO.getItem(id).getId()).equals(objLogin.getId_Employee())){
				session.removeAttribute("objLogin");
				session.setAttribute("objLogin",accountDAO.getItem(user));
				accountDAO.getItem(user).getPicture();
			}
			return "redirect:/employee?msg=edit";
		} else {
			return "redirect:/employee?msg=error";
		}
	}
}
