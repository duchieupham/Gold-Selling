/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.models;

import goldselling.dtos.CategoryDTO;
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
public class CategoryDAO {

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

    public List<CategoryDTO> getAllCategory() throws NamingException, SQLException, ClassNotFoundException {
        List<CategoryDTO> list = null;
        CategoryDTO dto = null;
        lookUpConnection();
        String sql = "SELECT * from dbo.Category Where isDisable = 0";
        stm = conn.prepareStatement(sql);
        rs = stm.executeQuery();
        list = new ArrayList<>();
        while (rs.next()) {
            dto = new CategoryDTO();
            dto.setId(rs.getInt("catID"));
            dto.setCatName(rs.getString("catName"));
            dto.setIsDisable(rs.getBoolean("isDisable"));
            list.add(dto);
        }
        closeConnection();
        return list;
    }
}
