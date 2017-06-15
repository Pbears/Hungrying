package food.dao;

import java.util.HashMap;
import java.util.List;
import com.ibatis.sqlmap.client.SqlMapClient;
import food.util.ServiceUtil;
import food.vo.OrderVo;
import food.vo.StoreVo;

public class OrderDao {
	private static SqlMapClient sqlMapper;
	static {
		sqlMapper = ServiceUtil.getSqlMap();
	}
	
	//select * from foodorder
	public static List<OrderVo> selectAllOrder() throws Exception{
		return sqlMapper.queryForList("order.selectAllOrder");
	}
	
	//한사람이 주문한 주문정보
	public static List<OrderVo> selectMemberOrder(String memberid) throws Exception{
		return sqlMapper.queryForList("order.selectMemberOrder",memberid);
	}
	
}
