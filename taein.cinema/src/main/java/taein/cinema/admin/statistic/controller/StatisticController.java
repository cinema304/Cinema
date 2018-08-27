package taein.cinema.admin.statistic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.domain.SexReservations;
import taein.cinema.admin.statistic.domain.LocalReservations;
import taein.cinema.admin.statistic.service.StatisticService;

@Controller
@RequestMapping("/admin/statistic")
public class StatisticController {
	@Autowired private StatisticService statisticService;
	
	@RequestMapping("/sexVol")
	public String sexVol(Search search, Model model){
		List<SexReservations> sexVol = statisticService.getSexRes(search);
		
		if(!sexVol.isEmpty()){
			model.addAttribute("sexVol", sexVol);
			
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
		
		return "admin/statistic/sexVol";
	}
	
	@RequestMapping("/localVol")
	public String localVol(Search search, Model model){
		List<LocalReservations> localVol = statisticService.getLocalRes(search);
		
		System.out.println(search.getLocalSea());
		
		if(!localVol.isEmpty()){			
			model.addAttribute("localVol", localVol);
			
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
		
		return "admin/statistic/localVol";
	}
}
