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

	// select * from foodorder
	public static List<OrderVo> selectAllOrder() throws Exception {
		return sqlMapper.queryForList("order.selectAllOrder");
	}
	// �ѻ���� �ֹ��� �ֹ�����
	public static OrderVo selectOrder(String ordernumber) throws Exception {
		return (OrderVo)sqlMapper.queryForObject("order.selectOrder", ordernumber);
	}
	
	public static List<OrderVo> selectMemberOrder(String memberid) throws Exception {
		return sqlMapper.queryForList("order.selectMemberOrder", memberid);
	}

	public static List<OrderVo> searchOrder(HashMap<String, Object> map) throws Exception {
		return sqlMapper.queryForList("order.searchOrder", map);
	}

	public static int getTotalRow(HashMap<String, Object> map) throws Exception {
		return (Integer) sqlMapper.queryForObject("order.getTotalRow", map);
	}

	public static void deleteOrder(String ordernumber) throws Exception {
		sqlMapper.delete("order.deleteOrder", ordernumber);
	}

}
