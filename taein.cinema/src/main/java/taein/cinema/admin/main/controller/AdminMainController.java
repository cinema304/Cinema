package taein.cinema.admin.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/main")
public class AdminMainController {
	@RequestMapping("/main")
	public void now(){}
	
}
