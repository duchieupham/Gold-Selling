/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import goldselling.dtos.ProductDTO;
import goldselling.models.ProductDAO;
import java.util.List;

/**
 *
 * @author phamduchieu
 */
public class ManageProductAction {

    private static final String SUCCESS = "success";

    private List<ProductDTO> listProduct;

    public ManageProductAction() {
    }

    public String execute() throws Exception {
        ProductDAO dao = new ProductDAO();
        listProduct = dao.getAllProduct();
        return SUCCESS;
    }

    public List<ProductDTO> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<ProductDTO> listProduct) {
        this.listProduct = listProduct;
    }
}
