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
@RequestMapping("/admin/sales")
public class SalesController {
	@Autowired private SalesService salesService;
	
	@RequestMapping("/movieSales")
	public String movieSales(Search search, Model model){
		List<Sales> totSales = salesService.getMovieSales(search);
				
		if(!totSales.isEmpty()){			
			model.addAttribute("totSales", totSales);
			
			if(search.getTimeStart() == null && search.getTimeEnd() == null){
				model.addAttribute("timeStart", "3개월 전");
				model.addAttribute("timeEnd", "현재일");
			}else{
				model.addAttribute("timeStart", search.getTimeStart());
				model.addAttribute("timeEnd", search.getTimeEnd());
			}
		}else{
			model.addAttribute("errMsg", "해당 검색 내용으로는 매출 데이터가 없습니다.");
		}
		
		return "admin/sales/movieSales";
	}
	
	@RequestMapping("/cinemaSales")
	public String cinemaSales(Search search, Model model){
		List<Sales> totSales = salesService.getCinemaSales(search);
		
		System.out.println(totSales);
		
		if(!totSales.isEmpty()){			
			model.addAttribute("totSales", totSales);
			
			if(search.getTimeStart() == null && search.getTimeEnd() == null){
				model.addAttribute("timeStart", "3개월 전");
				model.addAttribute("timeEnd", "현재일");
			}else{
				model.addAttribute("timeStart", search.getTimeStart());
				model.addAttribute("timeEnd", search.getTimeEnd());
			}
		}else{
			model.addAttribute("errMsg", "해당 검색 내용으로는 매출 데이터가 없습니다.");
		}
		
		return "admin/sales/cinemaSales";
	}
}
