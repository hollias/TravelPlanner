package controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Board;
import model.Hot;
import model.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import dao.BoardDao;
import service.BoardService;
import service.RailnoService;
import utils.WebConstants;

@Controller
public class BoardController {

	// private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private BoardService bs;
	@Autowired
	private BoardDao bd;
	@Autowired
	private RailnoService rs;
	
	@RequestMapping(value = "boardAuto")
	public String boardAuto(){
		bd.boardList();
		return "main";
	}
	@RequestMapping(value = "boardlist")
	public String home(HttpSession session,Model model, Board board) {
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		int count = bs.countBoardList(board);
		board.setTotalItemCount(count);
		List<Board> list =  bs.getBoardList(board);
		board.setItemPerPage(10);
		model.addAttribute("list",list);
		return "board/list";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write(HttpSession session,Model model) {
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		return "board/write";
	}
	
	@RequestMapping(value = "writeSubmit", method = RequestMethod.POST)
	public String writeSubmit(HttpSession session,Model model, Board board) {
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		if(board.getMemberid() == ""){
			board.setMemberid("guest");
		}
		board.setContent(board.getContent().replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
		bs.insertBoardItem(board);
		return "redirect:view.do?boardid="+board.getBoardid();
	}
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String view(HttpSession session,Model model, Board board) {
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		bs.hitUpdateBoard(board.getBoardid());
		model.addAttribute("item", bs.getBoardItem(board));
		return "board/view";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(HttpSession session,Model model, Board board, Hot hot) {
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		model.addAttribute("item", bs.getBoardItem(board));
		model.addAttribute("modify", "true");
		return "board/write";
	}
	
	@RequestMapping(value = "modifySubmit", method = RequestMethod.POST)
	public String modifySubmit(HttpSession session,Model model, Board board) {
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		board.setContent(board.getContent().replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
		bs.updateBoardItem(board);
		return "redirect:view.do?boardid="+board.getBoardid();
	}
	
	@RequestMapping(value = "fileUpload", method = RequestMethod.POST)
	public String fileUpload(Model model, MultipartRequest multipartRequest, HttpServletRequest request) throws IOException{
		MultipartFile imgfile = multipartRequest.getFile("Filedata");
		Calendar cal = Calendar.getInstance();
		String fileName = imgfile.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		String replaceName = cal.getTimeInMillis() + fileType;  
		String path = request.getSession().getServletContext().getRealPath("/")+File.separator+"resources/upload";
		FileUpload.fileUpload(imgfile, path, replaceName);
		model.addAttribute("path", path);
		model.addAttribute("filename", replaceName);
		return "board/file_upload";
	}
	@RequestMapping(value = "boardDel" ,  method = RequestMethod.POST)
	public String boardDel(HttpSession session,Model model, Board board){
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		bs.deleteBoardItem(board);
		return "board/list";
	}
}
