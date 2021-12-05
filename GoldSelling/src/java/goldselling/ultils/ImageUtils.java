/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.ultils;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author phamduchieu
 */
public class ImageUtils implements Serializable {

    public static List<String> getImages(String path) {
        List<String> list = new ArrayList<>();
        HttpServletRequest request = ServletActionContext.getRequest();
        File folder = new File(request.getSession().getServletContext().getRealPath("/") + path);
        for (File imgFile : folder.listFiles()) {
            if (imgFile.getName().endsWith(".jpg") || imgFile.getName().endsWith(".png")) {
                list.add(path + imgFile.getName());
            }
        }
        return list;
    }
}
