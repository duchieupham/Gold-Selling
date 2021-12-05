/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import goldselling.dtos.ImageDTO;
import goldselling.dtos.ProductDTO;
import goldselling.models.ImageDAO;
import goldselling.models.ProductDAO;
import java.util.List;

/**
 *
 * @author phamduchieu
 */
public class ShowProductDetailAction {

    private String productID;
    private List<ImageDTO> imgList;
    private ProductDTO dto;
    private static final String SUCCESS = "success";

    public ShowProductDetailAction() {
    }

    public String execute() throws Exception {
        ProductDAO pDAO = new ProductDAO();
        ImageDAO iDAO = new ImageDAO();
        dto = pDAO.getProductByID(Integer.parseInt(productID));
        imgList = iDAO.getListImageByProductID(Integer.parseInt(productID));
        return SUCCESS;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public List<ImageDTO> getImgList() {
        return imgList;
    }

    public void setImgList(List<ImageDTO> imgList) {
        this.imgList = imgList;
    }

    public ProductDTO getDto() {
        return dto;
    }

    public void setDto(ProductDTO dto) {
        this.dto = dto;
    }

}
