/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import goldselling.models.ProductDAO;

/**
 *
 * @author phamduchieu
 */
public class DeleteProductAction {

    private static final String SUCCESS = "success";

    private String productID;

    public DeleteProductAction() {
    }

    public String execute() throws Exception {
        ProductDAO dao = new ProductDAO();
        dao.deleteProduct(Integer.parseInt(productID));
        return SUCCESS;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

}
