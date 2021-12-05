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
public class ShowProductOverviewAction {

    //current index page
    private String pageIndex;

    //result
    private List<ProductDTO> listProduct;

    //number(s) of page
    private int pageCount;

    //accessories or gold bar
    private String type;

    private static final String SUCCESS = "success";

    public ShowProductOverviewAction() {
    }

    public String execute() throws Exception {
        ProductDAO pDAO = new ProductDAO();

        //get size of product (not only list size in 1 page)
        int listTotal = pDAO.getProductSize(type);

        //each page has 6 elements
        int elementOfPage = 6;
        listProduct = pDAO.getProductPaging(Integer.parseInt(pageIndex), elementOfPage, type);
        pageCount = listTotal / 6;
        if (listTotal % 6 > 0) {
            pageCount++;
        }
        return SUCCESS;
    }

    public String getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(String pageIndex) {
        this.pageIndex = pageIndex;
    }

    public List<ProductDTO> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<ProductDTO> listProduct) {
        this.listProduct = listProduct;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

}
