/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.models;

import goldselling.dtos.ImageDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author phamduchieu
 */
public class ImageDAO {

    Connection conn;
    PreparedStatement stm;
    ResultSet rs;

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    private void lookUpConnection() throws NamingException, SQLException {
        Context context = new InitialContext();
        Context envContext = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) envContext.lookup("MSSQLConnection");
        conn = ds.getConnection();
    }

    public List<ImageDTO> getListImageByProductID(int productID) throws NamingException, SQLException {
        List<ImageDTO> list = null;
        ImageDTO dto = null;
        lookUpConnection();
        String sql = "EXEC getImgProductByProductID ?";
        stm = conn.prepareStatement(sql);
        stm.setInt(1, productID);
        rs = stm.executeQuery();
        list = new ArrayList<>();
        while (rs.next()) {
            dto = new ImageDTO();
            dto.setImgID(rs.getInt("imgID"));
            dto.setImgURL(rs.getString("imgURL"));
            dto.setIsDisable(rs.getBoolean("isDisable"));
            list.add(dto);
        }
        closeConnection();
        return list;
    }

    public String getImgURLByBrandID(int brandID) throws NamingException, SQLException {
        String imgURL = "";
        lookUpConnection();
        String sql = "SELECT imgURL FROM dbo.Img WHERE brandID = ?";
        stm = conn.prepareStatement(sql);
        stm.setInt(1, brandID);
        rs = stm.executeQuery();
        if (rs.next()) {
            imgURL = rs.getString("imgURL");
        }
        closeConnection();
        return imgURL;
    }

    public boolean insertProduct(String imgURL, int productID) throws NamingException, SQLException {
        boolean check = false;
        lookUpConnection();
        String sql = "INSERT INTO dbo.Img (imgURL, productID, isDisable) VALUES (?,?,?)";
        stm = conn.prepareStatement(sql);
        stm.setString(1, imgURL);
        stm.setInt(2, productID);
        stm.setBoolean(3, false);
        if (stm.executeUpdate() > 0) {
            check = true;
        }
        closeConnection();
        return check;
    }

    public int findLastIDInserted() throws NamingException, SQLException {
        int lastID = 0;
        lookUpConnection();
        String sql = "SELECT imgID as lastID FROM dbo.Img WHERE imgID = @@Identity";
        stm = conn.prepareStatement(sql);
        rs = stm.executeQuery();
        if (rs.next()) {
            lastID = rs.getInt("lastID");
        }
        closeConnection();
        return lastID;
    }

}
