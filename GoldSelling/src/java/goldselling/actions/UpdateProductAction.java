/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import goldselling.dtos.BrandDTO;
import goldselling.dtos.CategoryDTO;
import goldselling.dtos.ImageDTO;
import goldselling.dtos.ProductDTO;
import goldselling.models.BrandDAO;
import goldselling.models.CategoryDAO;
import goldselling.models.ImageDAO;
import goldselling.models.ProductDAO;
import java.util.List;

/**
 *
 * @author phamduchieu
 */
public class UpdateProductAction {
    
    private String productID;
    private List<BrandDTO> listBrand;
    private List<CategoryDTO> listCategory;
    private List<ImageDTO> listImg;
    private ProductDTO productDTO;
    private static final String SUCCESS = "success";
    
    public UpdateProductAction() {
    }
    
    public String execute() throws Exception {
        ProductDAO pDAO = new ProductDAO();
        BrandDAO bDAO = new BrandDAO();
        CategoryDAO cDAO = new CategoryDAO();
        ImageDAO iDAO = new ImageDAO();
        productDTO = pDAO.getProductByID(Integer.parseInt(productID));
        listBrand = bDAO.getAllBrand();
        listCategory = cDAO.getAllCategory();
        listImg = iDAO.getListImageByProductID(Integer.parseInt(productID));
        return SUCCESS;
    }
    
    public String getProductID() {
        return productID;
    }
    
    public void setProductID(String productID) {
        this.productID = productID;
    }
    
    public List<BrandDTO> getListBrand() {
        return listBrand;
    }
    
    public void setListBrand(List<BrandDTO> listBrand) {
        this.listBrand = listBrand;
    }
    
    public List<CategoryDTO> getListCategory() {
        return listCategory;
    }
    
    public void setListCategory(List<CategoryDTO> listCategory) {
        this.listCategory = listCategory;
    }
    
    public List<ImageDTO> getListImg() {
        return listImg;
    }
    
    public void setListImg(List<ImageDTO> listImg) {
        this.listImg = listImg;
    }
    
    public ProductDTO getProductDTO() {
        return productDTO;
    }
    
    public void setProductDTO(ProductDTO productDTO) {
        this.productDTO = productDTO;
    }
    
}
