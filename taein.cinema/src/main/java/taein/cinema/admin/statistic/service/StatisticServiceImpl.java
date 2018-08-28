package taein.cinema.admin.statistic.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import taein.cinema.admin.statistic.dao.StatisticDao;
import taein.cinema.admin.statistic.domain.AgeReservations;
import taein.cinema.admin.statistic.domain.GradeReservations;
import taein.cinema.admin.statistic.domain.LocalReservations;
import taein.cinema.admin.statistic.domain.MovieReservations;
import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.domain.SexReservations;
import taein.cinema.admin.statistic.domain.TimeReservations;
import taein.cinema.admin.statistic.domain.UserReservations;

@Service
public class StatisticServiceImpl implements StatisticService{
	@Autowired private StatisticDao statisticDao;
	
	@Override
	@Transactional
	public List<SexReservations> getSexRes(Search search){
		List<SexReservations> userSex = statisticDao.getUserSexRes(search);
		List<SexReservations> notuserSex = statisticDao.getNotUserSexRes(search);
		List<SexReservations> sex =  new ArrayList<>();
		
		if(!userSex.isEmpty() && !notuserSex.isEmpty()){
			String womanStr = userSex.get(0).getSex();
			Integer womanCount = userSex.get(0).getResCount() + notuserSex.get(0).getResCount();
			String manStr = userSex.get(1).getSex();
			Integer manCount = userSex.get(1).getResCount() + notuserSex.get(1).getResCount();
			
			SexReservations woman = new SexReservations();
			woman.setSex(womanStr);
			woman.setResCount(womanCount);
			SexReservations man = new SexReservations();
			man.setSex(manStr);
			man.setResCount(manCount);
			
			sex.add(man);
			sex.add(woman);
		}
		
		return sex;
	}
	
	@Override
	@Transactional
	public List<LocalReservations> getLocalRes(Search search){
		return statisticDao.getLocalRes(search);
	}
	
	@Override
	@Transactional
	public List<AgeReservations> getAgeRes(Search search){
		List<AgeReservations> age = new ArrayList<>();
		List<AgeReservations> tmp = new ArrayList<>();
		List<AgeReservations> tmp2 = new ArrayList<>();
		Integer tmp3 = 0;
		Integer tmp4 = 0;
		
		for(int i=10,j=19; i<100; i+=10,j+=10){
			AgeReservations tmp5 = new AgeReservations();
			search.setAgeSeaStart(i);
			search.setAgeSeaEnd(j);
			
			tmp = statisticDao.getUserAgeRes(search);
			tmp2 = statisticDao.getNotUserAgeRes(search);
			if(tmp != null){
				for(int k=0; k<tmp.size(); k++){
					tmp3 = 0;
					tmp3 += tmp.get(k).getResCount();
				}
			}
			if(tmp2 != null){
				for(int k=0; k<tmp2.size(); k++){
					tmp4 = 0;
					tmp4 += tmp2.get(k).getResCount();
				}
			}
			
			tmp5.setResCount(tmp3 + tmp4);
			tmp5.setAge(i+"대");
			
			if(tmp5.getResCount() > 0){
				age.add(tmp5);
			}
		}
		
		return age;
	}
	
	@Override
	@Transactional
	public List<AgeReservations> getAgeVolRes(Search search){
		switch(search.getAgeSeaStart()){
			case 10: search.setAgeSeaEnd(19); break;
			case 20: search.setAgeSeaEnd(29); break;
			case 30: search.setAgeSeaEnd(39); break;
			case 40: search.setAgeSeaEnd(49); break;
			case 50: search.setAgeSeaEnd(59); break;
			case 60: search.setAgeSeaEnd(69); break;
			case 70: search.setAgeSeaEnd(79); break;
			case 80: search.setAgeSeaEnd(89); break;
			case 90: search.setAgeSeaEnd(99); 
		}
		
		List<AgeReservations> tmp = new ArrayList<>();
		List<AgeReservations> tmp2 = new ArrayList<>();
		Integer tmp3 = 0;
		Integer tmp4 = 0;
		AgeReservations tmp5 = new AgeReservations();
		List<AgeReservations> age = new ArrayList<>();
		
		tmp = statisticDao.getUserAgeRes(search);
		tmp2 = statisticDao.getNotUserAgeRes(search);
		if(tmp != null){
			for(int k=0; k<tmp.size(); k++){
				tmp3 += tmp.get(k).getResCount();
			}
		}
		if(tmp2 != null){
			for(int k=0; k<tmp2.size(); k++){
				tmp4 += tmp2.get(k).getResCount();
			}
		}
		
		tmp5.setResCount(tmp3 + tmp4);
		tmp5.setAge(search.getAgeSeaStart()+"대");
		
		if(tmp5.getResCount() > 0){
			age.add(tmp5);
		}
		
		return age;
	}
	
	@Override
	@Transactional
	public List<TimeReservations> getTimeRes(Search search){
		return statisticDao.getTimeRes(search);
	}
	
	@Override
	@Transactional
	public List<MovieReservations> getMovieRes(Search search){
		return statisticDao.getMovieRes(search);
	}
	
	@Override
	@Transactional
	public List<UserReservations> getUserRes(Search search){
		UserReservations tmp1 = statisticDao.getUserRes(search);
		tmp1.setUser("회원");
		UserReservations tmp2 = statisticDao.getNotUserRes(search);
		tmp2.setUser("비회원");
		UserReservations tmp3 = new UserReservations();
		
		List<UserReservations> userVol = new ArrayList<>();
		
		if(!tmp1.getResCount().trim().equals("0") || !tmp2.getResCount().trim().equals("0")){
			userVol.add(tmp1);
			userVol.add(tmp2);
		}

		return userVol;
	}
	
	@Override
	@Transactional
	public List<GradeReservations> getGradeRes(Search search){
		return statisticDao.getGradeRes(search);
	}
}
