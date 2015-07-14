package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import model.Hot;
import model.Member;
import model.Planner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.MapService;
import service.RailnoService;
import utils.WebConstants;

@Controller
public class MainControllers {
	@Autowired
	private RailnoService rs;
	@Autowired
	private MapService ms;
	@RequestMapping(value="main")
	public String main(HttpSession session ,Model model,Hot hot){
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		List<Hot> hotlist = rs.hotlist(hot);
		model.addAttribute("hotlist",hotlist);
		List<Planner> pl = ms.mainMap();
		model.addAttribute("pl",pl);
		return "main";
	}
	@RequestMapping(value="map")
	public String map(){
		return "map";
	}
	@RequestMapping(value="mainBanner")
	public String mainBanner(Model model , Hot hot){

		return "mainBanner";
	}
}
