package kh.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.CartDAO;
import kh.spring.dao.OrderDAO;
import kh.spring.dao.ProductsDAO;
import kh.spring.dto.CartDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.OrderDTO;
import kh.spring.dto.ProductsDTO;

@Service
public class OrderService {

   @Autowired
   private OrderDAO dao;

   @Autowired
   private CartDAO cdao;
   
   @Autowired
   private ProductsDAO pdao;

   public int insert(int seq,MemberDTO mdto,String product,String price) {
      int o_price = Integer.parseInt(price);
      Map<String,Object> param = new HashMap<>();
      System.out.println(mdto.getCm_id());
      param.put("o_seq", seq);
      param.put("m_id",mdto.getCm_id());
      param.put("o_name",mdto.getCm_name());
      param.put("o_phone",mdto.getCm_phone());
      param.put("o_email",mdto.getCm_email());
      param.put("o_zipcode",mdto.getCm_zipcode());
      param.put("o_address1",mdto.getCm_address1());
      param.put("o_address2",mdto.getCm_address2());
      param.put("o_product",product);
      param.put("o_qcy",1);
      param.put("o_num",0);
      param.put("o_check",0);
      if(o_price>=50000) {
         param.put("o_allSum",price);
         param.put("o_delivery",0);
      }else {
         param.put("o_allSum",o_price+2500);
         param.put("o_delivery",2500);
      }



      return dao.insert(param);
   } 
   public int insert(int seq,MemberDTO mdto,String product,String price,String qty) {
      int o_price = Integer.parseInt(price);
      Map<String,Object> param = new HashMap<>();
      System.out.println(mdto.getCm_id());
      param.put("o_seq", seq);
      param.put("m_id",mdto.getCm_id());
      param.put("o_name",mdto.getCm_name());
      param.put("o_phone",mdto.getCm_phone());
      param.put("o_email",mdto.getCm_email());
      param.put("o_zipcode",mdto.getCm_zipcode());
      param.put("o_address1",mdto.getCm_address1());
      param.put("o_address2",mdto.getCm_address2());
      param.put("o_product",product);
      param.put("o_qcy",qty);
      param.put("o_num",0);
      param.put("o_check",0);
      if(o_price>=50000) {
         param.put("o_allSum",price);
         param.put("o_delivery",0);
      }else {
         param.put("o_allSum",o_price+2500);
         param.put("o_delivery",2500);
      }



      return dao.insert(param);
   } 
   public void  insertAll(OrderDTO dto) {
      Map<String,Object> param = new HashMap<>();
      param.put("o_seq", dto.getO_seq());
      param.put("m_id",dto.getM_id());
      param.put("o_name",dto.getO_name());
      param.put("o_phone",dto.getO_phone());
      param.put("o_email",dto.getO_email());
      param.put("o_zipcode",dto.getO_zipcode());
      param.put("o_address1",dto.getO_address1());
      param.put("o_address2",dto.getO_address2());
      param.put("o_allSum",dto.getO_allSum());
      param.put("o_delivery",dto.getO_delivery());
      param.put("o_num",0);
      param.put("o_check",0);
      param.put("o_product",dto.getO_product());
      param.put("o_qcy",dto.getO_qcy());
      
      
      
      dao.insert(param);
   }
   
   
   
   public int allInsert(int seq,MemberDTO mdto, int [] p_seq,String sumMoney) { 
      int o_price = Integer.parseInt(sumMoney);
      OrderDTO dto;
      Map<String,Object> param = new HashMap<>();
      for(int i=0;i<p_seq.length;i++) {
         ProductsDTO pdto = pdao.detail(p_seq[i]); 
         
         
         param.put("o_seq", seq);
         param.put("m_id",mdto.getCm_id());
         param.put("o_name",mdto.getCm_name());
         param.put("o_phone",mdto.getCm_phone());
         param.put("o_email",mdto.getCm_email());
         param.put("o_zipcode",mdto.getCm_zipcode());
         param.put("o_address1",mdto.getCm_address1());
         param.put("o_address2",mdto.getCm_address2());
         
         param.put("o_num",0);
         param.put("o_check",0);
         param.put("o_product",pdto.getP_name());
         param.put("o_qcy",pdto.getP_stock());
         
         if(o_price>=50000) {
            param.put("o_allSum",o_price);
            param.put("o_delivery",0);
         }else {
            param.put("o_allSum",o_price+2500);
            param.put("o_delivery",2500);
         }
         
      } 
      return dao.insert(param);
      
   }
   
   
   public List<OrderDTO> setOrderDTO(int o_seq,MemberDTO mdto,String sumMoney,int [] p_seq,int [] c_qty) {
      int sum = Integer.parseInt(sumMoney);
      List<OrderDTO> list = new ArrayList<>();
      for(int i=0;i<p_seq.length;i++) {
         ProductsDTO pdto = pdao.detail(p_seq[i]);
         OrderDTO dto = new OrderDTO();
         dto.setO_seq(o_seq);
         dto.setM_id(mdto.getCm_id());
         dto.setO_name(mdto.getCm_name());
         dto.setO_phone(mdto.getCm_phone());
         dto.setO_email(mdto.getCm_email());
         dto.setO_zipcode(mdto.getCm_zipcode());
         dto.setO_address1(mdto.getCm_address1());
         dto.setO_address2(mdto.getCm_address2());
         dto.setO_delivery(sum);
         dto.setO_check(0);
         dto.setO_product(pdto.getP_name());
         dto.setO_qcy(c_qty[i]);
         if(sum>=50000) {
            dto.setO_allSum(sum);
            dto.setO_delivery(0);
         }else {
            dto.setO_allSum(sum+2500);
            dto.setO_delivery(2500);
         }
         list.add(dto);
         //this.insertAll(dto);
      }
      
      
      
      return list;
   }
   
   public OrderDTO select(int seq) {
      return dao.select(seq);
   }
   public OrderDTO getDetail(int seq) {
      return dao.getDetail(seq);
   }
   public int getSeq() {
      return dao.getSeq();
   }
   public List<OrderDTO> getAll(){
      return dao.getAll();
   }
   public int update(String apply_num,int o_seq) {
      Map<String,Object> param = new HashMap<>();
      param.put("o_num", apply_num );
      param.put("o_seq", o_seq);
      return dao.update(param);
   }
}