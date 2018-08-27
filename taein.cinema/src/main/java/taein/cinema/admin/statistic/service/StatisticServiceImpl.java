package taein.cinema.admin.statistic.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import taein.cinema.admin.statistic.domain.LocalReservations;
import taein.cinema.admin.statistic.domain.Search;
import taein.cinema.admin.statistic.dao.StatisticDao;
import taein.cinema.admin.statistic.domain.SexReservations;

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
}
