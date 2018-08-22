package taein.cinema.admin.sales.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import taein.cinema.admin.sales.domain.Sales;
import taein.cinema.admin.sales.domain.Search;
import taein.cinema.admin.sales.service.SalesService;

@Controller
@RequestMapping("/sales")
public class SalesController {
	@Autowired private SalesService salesService;
	
	@RequestMapping("/movieSales")
	public String movieSales(Search search, Model model){
		List<Sales> totSales = salesService.getMovieSales(search);
		
		for(Sales tmp : totSales){
			System.out.println(tmp);
		}		
		
		model.addAttribute("totSales", totSales);
		
		return "admin/sales/movieSales";
	}
}
