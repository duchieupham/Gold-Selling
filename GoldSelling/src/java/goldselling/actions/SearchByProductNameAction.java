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
public class SearchByProductNameAction {

    private List<ProductDTO> listProduct;
    private String searchValue;

    private static final String SUCCESS = "success";

    public SearchByProductNameAction() {
    }

    public String execute() throws Exception {
        ProductDAO pDAO = new ProductDAO();
        System.out.println("SEARCH VALUE IS: " + searchValue);
        listProduct = pDAO.searchByProductName(searchValue);
        return SUCCESS;
    }

    public List<ProductDTO> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<ProductDTO> listProduct) {
        this.listProduct = listProduct;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

}
