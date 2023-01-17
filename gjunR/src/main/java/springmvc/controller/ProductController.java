package springmvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Products;
import model.ProductDAO;
import model.ProductType;
import model.ProductTypeDAO;

@Controller
@RequestMapping("/")
public class ProductController {

	// 點餐畫面
	@RequestMapping("/product")
	public String read(Model model) {
		List<Products> productsList = null;
		List<ProductType> productTypelist = null;
		productsList = ProductDAO.readProduct();
		productTypelist = ProductTypeDAO.readProductType();		
		model.addAttribute("productsList", productsList);
		model.addAttribute("productsTypeList", productTypelist);
		return "orderPage";
	}
	
	// 修改商品(未使用)
	@RequestMapping("/product/update")
	public String update(@ModelAttribute("products") Products products, Model model) {
		List<Products> ProductsList = null;
		ProductsList = ProductDAO.updateProduct(products);
		model.addAttribute("productsList", ProductsList);
		return "productshow";
	}

	// 新增商品(未使用)
	@RequestMapping("/product/insert")
	public String insert(@ModelAttribute("products") Products products, Model model) {
		List<Products> ProductsList = null;
		ProductsList = ProductDAO.addProduct(products);
		model.addAttribute("productsList", ProductsList);
		return "productshow";
	}

	// 刪除商品(未使用)
	@RequestMapping("/product/delete")
	public String delete(@ModelAttribute("products") Products products, Model model) {
		List<Products> ProductsList = null;
		ProductsList = ProductDAO.deleteProduct(products);
		model.addAttribute("productsList", ProductsList);
		return "productshow";
	}
}
