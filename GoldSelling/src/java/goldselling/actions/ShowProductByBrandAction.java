/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import goldselling.dtos.ProductDTO;
import goldselling.models.ImageDAO;
import goldselling.models.ProductDAO;
import java.util.List;

/**
 *
 * @author phamduchieu
 */
public class ShowProductByBrandAction {

    private String brandID;

    //the current Index Page
    private String pageIndex;

    //get the list of product when brand is choosen
    private List<ProductDTO> listProductByBrand;

    //get brand cover image
    private String imgBrandURL;

    //get number(s) of page
    private int pageCount;

    private final String SUCCESS = "success";

    public ShowProductByBrandAction() {
    }

    public String execute() throws Exception {
        ProductDAO pDAO = new ProductDAO();
        ImageDAO iDAO = new ImageDAO();
        imgBrandURL = iDAO.getImgURLByBrandID(Integer.parseInt(brandID));

        //get all list (not only list size in 1 page)
        int listTotal = pDAO.getSizeProductByBrandID(Integer.parseInt(brandID));
        
        //default a page product overview has 4 elements 
        int elementOfPage = 4;

        listProductByBrand = pDAO.getProductPagingByBrandID(Integer.parseInt(pageIndex), elementOfPage, Integer.parseInt(brandID));
        pageCount = listTotal / 4;
        if (listTotal % 4 > 0) {
            pageCount++;
        }
        return SUCCESS;
    }

    public String getBrandID() {
        return brandID;
    }

    public void setBrandID(String brandID) {
        this.brandID = brandID;
    }

    public String getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(String pageIndex) {
        this.pageIndex = pageIndex;
    }

    public List<ProductDTO> getListProductByBrand() {
        return listProductByBrand;
    }

    public void setListProductByBrand(List<ProductDTO> listProductByBrand) {
        this.listProductByBrand = listProductByBrand;
    }

    public String getImgBrandURL() {
        return imgBrandURL;
    }

    public void setImgBrandURL(String imgBrandURL) {
        this.imgBrandURL = imgBrandURL;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

}
