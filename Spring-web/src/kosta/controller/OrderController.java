package kosta.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.model.Order;
import kosta.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@RequestMapping("/orderForm")
	public String orderForm(){
		return "transaction/orderForm";
	}
	
	@RequestMapping("/order")
	public String order(Order order){
		String view = "transaction/orderOk";
		
		try {
			service.orderAction(order);
		} catch (Exception e) {
			System.out.println("재고부족");
			view = "transaction/orderForm";
		}
		return view;
	}
}
