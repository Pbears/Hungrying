package food.dao;


import com.ibatis.sqlmap.client.SqlMapClient;

import food.util.ServiceUtil;

public class AdminDao {
	private static SqlMapClient sqlMapper;
	static {
		sqlMapper = ServiceUtil.getSqlMap();
	}

	public static String idCheck(String id) throws Exception {
		return (String)sqlMapper.queryForObject("admin.idCheck",id);
	}
	
	public static String getName(String id)throws Exception{
		return (String)sqlMapper.queryForObject("admin.getName",id);
	}
}
