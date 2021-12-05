/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import com.opensymphony.xwork2.ActionContext;
import goldselling.dtos.AccountDTO;
import goldselling.dtos.BrandDTO;
import goldselling.models.AccountDAO;
import goldselling.models.BrandDAO;
import goldselling.ultils.SHA256Utils;
import java.util.List;
import java.util.Map;

/**
 *
 * @author phamduchieu
 */
public class LoginAction {

    private String username;
    private String password;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    private List<BrandDTO> listBrandInRequest;

    public LoginAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        SHA256Utils encrypted = new SHA256Utils();
        AccountDAO accountDAO = new AccountDAO();
        BrandDAO brandDAO = new BrandDAO();
        List<BrandDTO> listBrand = brandDAO.getAllBrand();
        listBrandInRequest = brandDAO.getAllBrand();
        //System.out.println("1st name of list brand: " + listBrand.get(0).getBrandName());
        AccountDTO accountDTO = accountDAO.checkLogin(username, encrypted.enscryptPassword(password));
        ActionContext.getContext().getApplication().put("LIST_BRAND", listBrand);
        if (accountDTO != null) {
            Map session = ActionContext.getContext().getSession();
            session.put("ACCOUNT_DTO", accountDTO);
            url = SUCCESS;
        }
        return url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<BrandDTO> getListBrandInRequest() {
        return listBrandInRequest;
    }

    public void setListBrandInRequest(List<BrandDTO> listBrandInRequest) {
        this.listBrandInRequest = listBrandInRequest;
    }


}
