package taein.cinema.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/menu")
public class MenuController {
	@RequestMapping("/img")
	public void image(){}
}
