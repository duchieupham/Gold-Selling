/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import goldselling.dtos.BrandDTO;
import goldselling.dtos.CategoryDTO;
import goldselling.models.BrandDAO;
import goldselling.models.CategoryDAO;
import java.util.List;

/**
 *
 * @author phamduchieu
 */
public class NewProductAction {

    private static final String SUCCESS = "success";

    private List<BrandDTO> listBrand;
    private List<CategoryDTO> listCategory;

    public NewProductAction() {
    }

    public String execute() throws Exception {
        BrandDAO bDAO = new BrandDAO();
        CategoryDAO cDAO = new CategoryDAO();
        listBrand = bDAO.getAllBrand();
        listCategory = cDAO.getAllCategory();
        return SUCCESS;
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

}
