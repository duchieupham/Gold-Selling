/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import goldselling.pojos.GooglePojo;
import com.opensymphony.xwork2.ActionContext;
import goldselling.dtos.AccountDTO;
import goldselling.dtos.BrandDTO;
import goldselling.models.AccountDAO;
import goldselling.models.BrandDAO;
import goldselling.ultils.GoogleUtils;
import java.util.List;
import java.util.Map;

/**
 *
 * @author phamduchieu
 */
public class LoginWithGoogleAction {

    private String code;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";

    public LoginWithGoogleAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        AccountDAO dao = new AccountDAO();
        if (code == null || code.isEmpty()) {
            //do nothing
        } else {
            //System.out.println("This is code response of google dialog" + code);
            String accessToken = GoogleUtils.getTokenLogin(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            String email = googlePojo.getEmail().trim();
            String id = googlePojo.getId().trim();
            AccountDTO accountDTO = dao.checkLoginByGmail(email, id);
            BrandDAO brandDAO = new BrandDAO();
            List<BrandDTO> listBrand = brandDAO.getAllBrand();
            ActionContext.getContext().getApplication().put("LIST_BRAND", listBrand);
            if (accountDTO != null) {
                Map session = ActionContext.getContext().getSession();
                session.put("ACCOUNT_DTO", accountDTO);
                url = SUCCESS;
            }
        }

        return url;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
