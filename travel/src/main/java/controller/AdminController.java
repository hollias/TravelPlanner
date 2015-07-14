package controller;
import javax.servlet.http.HttpSession;
import model.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import utils.WebConstants;
@Controller
public class AdminController {
	
	@RequestMapping(value="adminMain")
	public String admin(HttpSession session, Model model){
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		return "admin/adminMain";
	}
}