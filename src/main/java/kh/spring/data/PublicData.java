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

import kh.spring.dto.Camp_infoDTO;
import kh.spring.service.Camp_infoService;



@WebServlet("/PublicData.do")
public class PublicData extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Camp_infoService service;
    
    public List<Camp_infoDTO> ParsingData() throws Exception{
        
        JSONParser jsonparser = new JSONParser();
        JSONObject jsonobject = (JSONObject)jsonparser.parse(readUrl());
        JSONObject parse_response = (JSONObject) jsonobject.get("response"); // response 濡� 遺��꽣 body 李얠븘�샃�땲�떎. 
        JSONObject parse_body = (JSONObject) parse_response.get("body"); // body 濡� 遺��꽣 items 諛쏆븘�샃�땲�떎. 
        JSONObject parse_items = (JSONObject) parse_body.get("items");
        JSONArray parse_item = (JSONArray) parse_items.get("item");
        
        JSONObject camping;

        
        List <Camp_infoDTO> list = null;
        list = new ArrayList<Camp_infoDTO>();
  
        for(int i = 0 ; i < parse_item.size(); i++) {
        		
            Camp_infoDTO dto = new Camp_infoDTO();
            
        	camping = (JSONObject) parse_item.get(i);
        	dto.setContentId(((Long)camping.get("contentId")).intValue());
        	dto.setFirstImageUrl((String)camping.get("firstImageUrl"));
        	dto.setFacltNm((String)camping.get("facltNm"));
        	dto.setLineIntro((String)camping.get("lineIntro"));
        	dto.setResveUrl((String)camping.get("resveUrl"));
        	dto.setHomepage((String)camping.get("homepage"));
        	dto.setAddr1((String)camping.get("addr1"));
        	dto.setAddr2((String)camping.get("addr2"));
        	dto.setTel((String)camping.get("tel"));
        	dto.setResveCl((String)camping.get("resveCl"));
        	dto.setLctCl((String)camping.get("lctCl"));
        	dto.setInduty((String)camping.get("induty"));
        	dto.setOperPdCl((String)camping.get("operPdCl"));
        	dto.setOperDeCl((String)camping.get("operDeCl"));
        	dto.setPosblFcltyCl((String)camping.get("posblFcltyCl"));
        	dto.setIntro((String)camping.get("intro"));
        	dto.setGnrlSiteCo(((Long)camping.get("gnrlSiteCo")).intValue());
        	dto.setAutoSiteCo(((Long)camping.get("autoSiteCo")).intValue());
        	dto.setGlampSiteCo(((Long)camping.get("glampSiteCo")).intValue());
        	dto.setCaravSiteCo(((Long)camping.get("caravSiteCo")).intValue());
        	dto.setIndvdlCaravSiteCo(((Long)camping.get("indvdlCaravSiteCo")).intValue());
        	dto.setSbrsEtc((String)camping.get("sbrsEtc"));
        	dto.setSbrsCl((String)camping.get("sbrsCl"));
        	dto.setAnimalCmgCl( (String)camping.get("animalCmgCl"));
        	dto.setBrazierCl((String )camping.get("brazierCl"));
        	dto.setMapX(((Long)camping.get("contentId")));
        	dto.setMapY(((Long)camping.get("contentId")));
        	list.add(dto);
        	System.out.println(dto);       	

        }
        	return list;
  
   }
    
    private static String readUrl() throws Exception {
        BufferedInputStream reader = null;
        try {
            String addr = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?ServiceKey=";
            String serviceKey = "8yrqp1Tt%2B%2BBzz43eYt7Z2PEzjukvMZdao%2Fg6UZVQOYjRxUUf3eQlaZLUqYMIxQPs7TQtPo%2FGQs1%2BBgc6acyA6Q%3D%3D";
            String parameter = "";
//            serviceKey = URLEncoder.encode(serviceKey,"utf-8");
            
            parameter = parameter + "&" + "MobileOS=ETC";    
            parameter = parameter + "&" + "MobileApp=SeeStar";
            parameter = parameter + "&" + "_type=json";
            parameter = parameter + "&" + "pageNo=10&numOfRows=260&totalCount=2683";
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
            new PublicData();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
}

