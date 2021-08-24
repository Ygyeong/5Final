package kh.spring.data;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


import kh.spring.dto.Camp_photoDTO;


@WebServlet("/PublicImage.do")
public class PublicImage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    
    public List<Camp_photoDTO> ParsingData(int contentId) throws Exception{
        
        JSONParser jsonparser = new JSONParser();
        JSONObject jsonobject = (JSONObject)jsonparser.parse(readUrl(contentId));
        JSONObject parse_response = (JSONObject) jsonobject.get("response"); // response 濡� 遺��꽣 body 李얠븘�샃�땲�떎. 
        JSONObject parse_body = (JSONObject) parse_response.get("body"); // body 濡� 遺��꽣 items 諛쏆븘�샃�땲�떎. 
        JSONObject parse_items = (JSONObject) parse_body.get("items");
        JSONArray parse_item = (JSONArray) parse_items.get("item");
        
        JSONObject camping;

        
        List <Camp_photoDTO> list = null;
        list = new ArrayList<Camp_photoDTO>();
  
        for(int i = 0 ; i < parse_item.size(); i++) {
        		
        	Camp_photoDTO dto = new Camp_photoDTO();
            
        	camping = (JSONObject) parse_item.get(i);
        	
        	dto.setContentId(((Long)camping.get("contentId")).intValue());
        	dto.setImageUrl((String)camping.get("imageUrl"));
        	dto.setSerialnum(((Long)camping.get("serialnum")).intValue());
        	System.out.println((String)camping.get("imageUrl")); 
        	list.add(dto);
        	System.out.println(dto);       	

        }
        	return list;
  
   }
    
   private static String readUrl(int contentId) throws Exception {
        BufferedInputStream reader = null;
        
        try {
            String addr = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/imageList?ServiceKey=";
            String serviceKey = "8yrqp1Tt%2B%2BBzz43eYt7Z2PEzjukvMZdao%2Fg6UZVQOYjRxUUf3eQlaZLUqYMIxQPs7TQtPo%2FGQs1%2BBgc6acyA6Q%3D%3D";
            String parameter = "";
//            serviceKey = URLEncoder.encode(serviceKey,"utf-8");
            
            parameter = parameter + "&" + "MobileOS=ETC";    
            parameter = parameter + "&" + "MobileApp=SeeStar";
            parameter = parameter + "&" + "_type=json";
            parameter = parameter + "&" + "contentId=" + contentId;
            addr = addr + serviceKey + parameter;
            URL url = new URL(addr);
            
            reader = new BufferedInputStream(url.openStream());
            StringBuffer buffer = new StringBuffer();
            int i;
            byte[] b = new byte[4096];
            while( (i = reader.read(b)) != -1){
              buffer.append(new String(b, 0, i));
            }
            return buffer.toString();
        } finally {
            if (reader != null)
                reader.close();
        }
    }
    
    
    public static void main(String[] args) {
        
        try {
            new PublicImage();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
}


