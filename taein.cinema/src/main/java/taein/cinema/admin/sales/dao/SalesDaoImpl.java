package taein.cinema.admin.sales.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import taein.cinema.admin.sales.dao.mapper.SalesMapper;
import taein.cinema.admin.sales.domain.Sales;
import taein.cinema.admin.sales.domain.Search;

@Repository
public class SalesDaoImpl implements SalesDao{
	@Autowired private SalesMapper salesMapper;
	
	public List<Sales> getMovieSales(Search saerch){
		return salesMapper.getMovieSales(saerch);
	}
}
