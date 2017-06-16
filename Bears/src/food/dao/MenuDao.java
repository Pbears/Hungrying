package food.dao;

import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import food.util.ServiceUtil;
import food.vo.MenuVo;
import food.vo.StoreVo;


public class MenuDao {
    private static SqlMapClient sqlMapper;
    static {
        sqlMapper = ServiceUtil.getSqlMap();
    }
    // select * from store;
    public static List<MenuVo>selectMenu() throws Exception{
        return sqlMapper.queryForList("menu.selectMenu");
    }
	public static MenuVo selectOneMenu(String menuname) throws Exception{
		return (MenuVo)sqlMapper.queryForObject("menu.selectOneMenu", menuname);
	}
	
    public static List<MenuVo>searchMenu(HashMap<String,Object>map)throws Exception{
        return sqlMapper.queryForList("menu.searchMenu",map);
    }

    public static int getTotalRow(HashMap<String, Object>map) throws Exception{
          return (Integer)sqlMapper.queryForObject("menu.getTotalRow",map);
    }
	public static void deleteMenu(String menuname) throws Exception{
		sqlMapper.delete("menu.deleteMenu",menuname);
	}
	public static void insertMenu(MenuVo menuVo) throws Exception{
		sqlMapper.insert("menu.insertMenu",menuVo);
	}
	//update
	public static void updateMenu(MenuVo menuVo) throws Exception{
		sqlMapper.update("menu.updateMenu", menuVo);
	}
	public static List<MenuVo>searchBrandNo(int data)throws Exception{
		return sqlMapper.queryForList("menu.searchBrandNo",data);
	}
	
	
}
