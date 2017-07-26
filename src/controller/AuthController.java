package controller;

import java.security.Principal;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.AccountDAO;
import entities.Employee;

@Controller
public class AuthController {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private AccountDAO accountDAO;

	@RequestMapping(value={"/login","/"},method=RequestMethod.GET)
	public String login(Principal principal,ModelMap modelMap){
		if(principal!=null){
			return "redirect:/home";
		}
		return "auth/login";
	}
	
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(){
		return "";
	}
	
	@RequestMapping(value="/403",method=RequestMethod.GET)
	public String er403(){
		return "auth/er403";
	}
    	
	@RequestMapping(value="/forgetpass",method=RequestMethod.GET)
	public String forgetpass(){
		return "auth/forgetpass";
	}
	
	
	@RequestMapping(value="/forgetpass",method=RequestMethod.POST)
	public String forgetpass(@RequestParam("email") String email,ModelMap modelMap){
			System.out.println(email);
	        Employee objE=null;
	        if(accountDAO.getItemByEmail(email) == null){
	        	System.out.println("null");
	        	return "redirect:/forgetpass?msg=wrong";
	        }else{
	        	try{
	        		objE=accountDAO.getItemByEmail(email);
	        		System.out.println(objE.getId());
//	        		Account objAC=accountDAO.getItemByIDEmployee(objE.getId());
//	        		System.out.println(objAC.toString());
	        		String alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()";
	     			int N = alphabet.length();

	    			Random r = new Random();
	    			StringBuffer output = new StringBuffer();
	    			for (int i = 0; i < 6; i++) {
	    				output.append(alphabet.charAt(r.nextInt(N)));
	    			}
	    			String new_pass=output.toString(); 
	    	        
	//	   	         creates a simple e-mail object
	
	    			MimeMessage mime=mailSender.createMimeMessage();
	    			MimeMessageHelper email1=new MimeMessageHelper(mime,true);
	    			
//		   	        SimpleMailMessage email1 = new SimpleMailMessage();
		   	        
		   	        email1.setTo(email);
		   	        email1.setSubject("Re_Password");
		   	        email1.setText("<html><body>This is a new password for your account: <h2>"+new_pass +"</h2>You can"
		   	        		+ " click here to try login again <a href=\"http://localhost:8081/devicesManagement/login\">http://localhost:8081/devicesManagement/login</a></body></html>",true);
		        	 if(accountDAO.updatePass(new_pass,objE.getId())>0){
		        		 System.out.println("success");
			        	// sends the e-mail
			        	 mailSender.send(mime);
			        	 return "redirect:/login?new_pass=success";
		        	 }else{
		        		 return "redirect:/forgetpass?msg=wrong";
		        	 }
		        }catch(Exception e){
		        	System.out.println("Error");
		        	return "redirect:/login";
		        }
	        }
	}
	
	@RequestMapping(value="/404",method=RequestMethod.GET)
	public String er404(){
		return "auth/er404";
	}
}
