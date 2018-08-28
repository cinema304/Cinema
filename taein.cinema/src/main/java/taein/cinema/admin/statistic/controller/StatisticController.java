package taein.cinema.admin.statistic.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import taein.cinema.admin.statistic.domain.AgeReservations;
import taein.cinema.admin.statistic.domain.GradeReservations;
import taein.cinema.admin.statistic.domain.LocalReservations;
import taein.cinema.admin.statistic.domain.MovieReservations;
import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.domain.SexReservations;
import taein.cinema.admin.statistic.domain.TimeReservations;
import taein.cinema.admin.statistic.domain.UserReservations;
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
	
	@RequestMapping("/ageVol")
	public String ageVol(Search search, Model model){
		List<AgeReservations> ageVol = statisticService.getAgeRes(search);
		
		if(!ageVol.isEmpty()){			
			model.addAttribute("ageVol", ageVol);
			
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
		
		return "admin/statistic/ageVol";
	}
	
	@RequestMapping(value="/ageVol", method=RequestMethod.POST)
	public String ageVolSea(Search search, Model model){
		List<AgeReservations> ageVol = new ArrayList<>();
		
		if(search.getAgeSeaStart() > 0){
			ageVol = statisticService.getAgeVolRes(search);
		}else{
			ageVol = statisticService.getAgeRes(search);
		}
		
		if(!ageVol.isEmpty()){
			model.addAttribute("ageVol", ageVol);
			
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
		
		return "admin/statistic/ageVol";
	}
	
	@RequestMapping("/timeVol")
	public String timeVol(Search search, Model model){
		List<TimeReservations> timeVol = statisticService.getTimeRes(search);
		
		if(!timeVol.isEmpty()){			
			model.addAttribute("timeVol", timeVol);
			
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
		
		return "admin/statistic/timeVol";
	}
	
	@RequestMapping("/movieVol")
	public String movieVol(Search search, Model model){
		List<MovieReservations> movieVol = statisticService.getMovieRes(search);
		
		if(!movieVol.isEmpty()){			
			model.addAttribute("movieVol", movieVol);
			
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
		
		return "admin/statistic/movieVol";
	}
	
	@RequestMapping("/userVol")
	public String userVol(Search search, Model model){
		List<UserReservations> userVol = statisticService.getUserRes(search);
		
		if(!userVol.isEmpty()){			
			model.addAttribute("userVol", userVol);
			
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
		
		return "admin/statistic/userVol";
	}
	
	@RequestMapping("/gradeVol")
	public String gradeVol(Search search, Model model){
		List<GradeReservations> gradeVol = statisticService.getGradeRes(search);
		
		if(!gradeVol.isEmpty()){			
			model.addAttribute("gradeVol", gradeVol);
			
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
		
		return "admin/statistic/gradeVol";
	}
}
