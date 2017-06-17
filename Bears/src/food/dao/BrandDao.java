package food.dao;

import java.util.HashMap;
import java.util.List;
import com.ibatis.sqlmap.client.SqlMapClient;
import food.util.ServiceUtil;
import food.vo.BrandVo;
import food.vo.StoreVo;

public class BrandDao {
   private static SqlMapClient sqlMapper;
   static {
      sqlMapper = ServiceUtil.getSqlMap();
   }
   // select * from brand;
      public static List<BrandVo> selectBrand() throws Exception{
         
         
         
         return sqlMapper.queryForList("brand.selectBrand");
      }
   
      public static List<BrandVo> searchBrand(HashMap<String,Object>map)throws Exception{
         
         try {
            if(map.get("query").equals("null")){
               map.put("query", null);
               map.put("data", null);
            }
            
         } catch (Exception e) {
            // TODO: handle exception
          return sqlMapper.queryForList("brand.searchBrand",map);
         }
      
         
           return sqlMapper.queryForList("brand.searchBrand",map);
      }
   
      public static int getTotalRow(HashMap<String, Object>map) throws Exception{
         try {
            if(map.get("Q").equals("null")){
               map.put("D", null);
               map.put("Q", null);
            }
            
         } catch (Exception e) {
            // TODO: handle exception
         return (Integer)sqlMapper.queryForObject("brand.getTotalRow", map);
         }         
         return (Integer)sqlMapper.queryForObject("brand.getTotalRow", map);
      }
      
      
      public static int subGetTotalRow(HashMap<String, Object>map) throws Exception{
	      return (Integer)sqlMapper.queryForObject("brand.subGetTotalRow", map);
	   }
      
      public static List<StoreVo> searchStore(HashMap<String,Object>map)throws Exception{
          return sqlMapper.queryForList("brand.searchStore",map);
  	  }
      
      
      
      public static List<StoreVo> selectStore(HashMap<String,Object>map) throws Exception{
  		return sqlMapper.queryForList("brand.selectStore",map);
  	  }      
      //insert 
      public static void insertBrand(BrandVo brandVo) throws Exception{
         sqlMapper.insert("brand.insertBrand",brandVo);
      }
      public static void deleteBrand(String brandname) throws Exception{
         sqlMapper.delete("brand.deleteBrand",brandname);
      }
      
      public static BrandVo selectOneBrand(String brandname) throws Exception{
         return (BrandVo)sqlMapper.queryForObject("brand.selectOneBrand", brandname);
      }
      //update
      public static void updateBrand(BrandVo brandVo) throws Exception{
         sqlMapper.update("brand.updateBrand", brandVo);
         
      }
}