package com.model2.mvc.web.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.comment.CommentService;
import com.model2.mvc.service.domain.Comment;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public CommentController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("addCommentView")
	public String addCommentView(@RequestParam("prodNo") int prodNo,@RequestParam("tranNo") int tranNo, HttpSession session,
			HttpServletRequest request) throws Exception {
		Comment comment = new Comment();
		comment.setPurchase(purchaseService.getPurchase(tranNo));
		comment.getPurchase().setPurchaseProd(productService.getProduct(prodNo));
		comment.getPurchase().setBuyer((User)session.getAttribute("user"));
		String file = comment.getPurchase().getPurchaseProd().getFileName();
		String[] fileList = file.split("[,]");
		request.setAttribute("fileList", fileList);
		request.setAttribute("comment", comment);
		return "forward:/comment/addComment.jsp";
	}
	
	@RequestMapping("addComment")
	public String addComment(@RequestParam("tranNo") int tranNo,
			@ModelAttribute("comment") Comment comment) throws Exception {
		comment.setPurchase(purchaseService.getPurchase(tranNo));
		comment.setUserId(comment.getPurchase().getBuyer().getUserId());
		commentService.addComment(comment);

		return "forward:/prod/getProduct?productNo="+comment.getPurchase().getPurchaseProd().getProdNo()+"&menu=search";
	}

}
