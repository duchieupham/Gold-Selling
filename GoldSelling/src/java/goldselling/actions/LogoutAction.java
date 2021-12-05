/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;

/**
 *
 * @author phamduchieu
 */
public class LogoutAction {

    private static final String SUCCESS = "success";

    public LogoutAction() {
    }

    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        session.remove("ACCOUNT_DTO");
        return SUCCESS;
    }

}
