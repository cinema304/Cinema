package taein.cinema.admin.sales.dao.mapper;

import java.util.List;

import taein.cinema.admin.sales.domain.Sales;
import taein.cinema.admin.sales.domain.Search;

public interface SalesMapper {
	List<Sales> getMovieSales(Search saerch); 
	List<Sales> getCinemaSales(Search saerch);
}
