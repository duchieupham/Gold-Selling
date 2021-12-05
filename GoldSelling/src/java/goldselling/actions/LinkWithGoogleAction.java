/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import com.opensymphony.xwork2.ActionContext;
import goldselling.dtos.AccountDTO;
import goldselling.models.AccountDAO;
import goldselling.pojos.GooglePojo;
import goldselling.ultils.GoogleUtils;

/**
 *
 * @author phamduchieu
 */
public class LinkWithGoogleAction {

    private String code;
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";

    public LinkWithGoogleAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        AccountDAO dao = new AccountDAO();
        AccountDTO dto = (AccountDTO) ActionContext.getContext().getSession().get("ACCOUNT_DTO");
        if (code == null || code.isEmpty()) {
            //do nothing.
        } else {
            String userID = dto.getUserID();
            System.out.println("User ID get from session: " + userID);
            String accessToken = GoogleUtils.getTokenLinking(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            String email = googlePojo.getEmail().trim();
            String idEmail = googlePojo.getId().trim();
            boolean check = dao.updateEmail(userID, email, idEmail);
            System.out.println("CHECK IS " + check);
            System.out.println("EMAIL: " + email);
            System.out.println("EMAIL ID: " + idEmail);
            System.out.println("TOKEN: " + accessToken);

            if (check) {
                dto.setEmail(email);
                dto.setEmailID(idEmail);
                ActionContext.getContext().getSession().put("ACCOUNT_DTO", dto);
                url = SUCCESS;
            }
        }
        return url;
    }

}
