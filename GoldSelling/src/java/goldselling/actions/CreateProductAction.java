/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import com.opensymphony.xwork2.ActionContext;
import goldselling.dtos.ProductDTO;
import goldselling.models.ProductDAO;

/**
 *
 * @author phamduchieu
 */
public class CreateProductAction {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";

    private String productName;
    private String productPrice;
    private String productQuantity;
    private String brandValue;
    private String catValue;

    public CreateProductAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        ProductDAO dao = new ProductDAO();
        ProductDTO dto = new ProductDTO();
        dto.setProductName(productName);
        dto.setPrice(Float.parseFloat(productPrice));
        dto.setQuantity(Integer.parseInt(productQuantity));
        boolean check = dao.insertProduct(dto, Integer.parseInt(catValue), Integer.parseInt(brandValue));
        int lastIDInserted = dao.findLastIDInserted();
        ActionContext.getContext().getSession().put("LAST_PRODUCT_ID", lastIDInserted);
        if (check) {
            url = SUCCESS;
        }
        return url;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(String productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getBrandValue() {
        return brandValue;
    }

    public void setBrandValue(String brandValue) {
        this.brandValue = brandValue;
    }

    public String getCatValue() {
        return catValue;
    }

    public void setCatValue(String catValue) {
        this.catValue = catValue;
    }


}
