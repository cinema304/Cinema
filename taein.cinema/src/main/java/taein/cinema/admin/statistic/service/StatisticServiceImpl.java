package taein.cinema.admin.statistic.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.dao.StatisticDao;
import taein.cinema.admin.statistic.domain.Reservations;

@Service
public class StatisticServiceImpl implements StatisticService{
	@Autowired private StatisticDao statisticDao;
	
	@Override
	public List<Reservations> getSexRes(Search search){
		List<Reservations> userSex = statisticDao.getUserSexRes(search);
		List<Reservations> notuserSex = statisticDao.getNotUserSexRes(search);
		List<Reservations> sex =  new ArrayList<>();
		
		if(!userSex.isEmpty()){
			String womanStr = userSex.get(0).getSex();
			Integer womanCount = userSex.get(0).getResCount() + notuserSex.get(0).getResCount();
			String manStr = userSex.get(1).getSex();
			Integer manCount = userSex.get(1).getResCount() + notuserSex.get(1).getResCount();
			
			Reservations woman = new Reservations();
			woman.setSex(womanStr);
			woman.setResCount(womanCount);
			Reservations man = new Reservations();
			man.setSex(manStr);
			man.setResCount(manCount);
			
			sex.add(man);
			sex.add(woman);
		}
		
		return sex;
	}
	

}
