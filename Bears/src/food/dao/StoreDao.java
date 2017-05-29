package food.dao;

import java.util.HashMap;
import java.util.List;
import com.ibatis.sqlmap.client.SqlMapClient;
import food.util.ServiceUtil;
import food.vo.StoreVo;

public class StoreDao {
	private static SqlMapClient sqlMapper;
	static {
		sqlMapper = ServiceUtil.getSqlMap();
	}
	// select * from store;
	public static List<StoreVo> selectStore() throws Exception{
		return sqlMapper.queryForList("store.selectStore");
	}
	
	public static List<StoreVo> searchStore(HashMap<String,Object>map)throws Exception{
        return sqlMapper.queryForList("store.searchStore",map);
	}
	
	public static int getTotalRow(HashMap<String, Object>map) throws Exception{
	      return (Integer)sqlMapper.queryForObject("store.getTotalRow", map);
	   }
}
