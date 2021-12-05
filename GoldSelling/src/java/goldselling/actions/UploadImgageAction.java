/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.actions;

import com.opensymphony.xwork2.ActionContext;
import goldselling.models.ImageDAO;
import goldselling.models.ProductDAO;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author phamduchieu
 */
public class UploadImgageAction {

    public static final String SUCCESS = "success";
    private File file;
    private String fileContentType;
    private String fileFileName;
    private String message;

    public UploadImgageAction() {
    }

    public String execute() throws Exception {
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            String filePath = request.getSession().getServletContext().getRealPath("/images/products");
            ServletActionContext.getServletContext().log(filePath);
            File fileToCreate = new File(filePath, fileFileName);
            FileUtils.copyFile(file, fileToCreate);
            if (fileToCreate.length() > 0) {
                ImageDAO iDAO = new ImageDAO();
                ProductDAO pDAO = new ProductDAO();
                int lastProductID = (int) ActionContext.getContext().getSession().get("LAST_PRODUCT_ID");
                iDAO.insertProduct(fileFileName, lastProductID);
                int imgLastID = iDAO.findLastIDInserted();
                pDAO.updateThumbnail(lastProductID, imgLastID);
//                request.setAttribute("msg", "Insert Product Successful.");
            message = "Upload Image Successful. Insert done.";
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at ImageUploadAction: " + e.getMessage());
        }
        return SUCCESS;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    

}
