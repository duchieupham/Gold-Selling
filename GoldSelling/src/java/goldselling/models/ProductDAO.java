/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.models;

import goldselling.dtos.ProductDTO;
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
public class ProductDAO {

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

    public List<ProductDTO> getProductPagingByBrandID(int pageIndex, int pageSize, int brandID) throws SQLException, ClassNotFoundException, NamingException {
        List<ProductDTO> list = null;
        ProductDTO dto = null;
        lookUpConnection();
        String sql = "EXEC getProductPagingByBrandID ?,?,?";
        stm = conn.prepareStatement(sql);
        stm.setInt(1, pageIndex);
        stm.setInt(2, pageSize);
        stm.setInt(3, brandID);
        rs = stm.executeQuery();
        list = new ArrayList<>();
        while (rs.next()) {
            dto = new ProductDTO();
            dto.setId(rs.getInt("productID"));
            dto.setProductName(rs.getString("productName"));
            dto.setPrice(rs.getFloat("price"));
            dto.setQuantity(rs.getInt("quantity"));
            dto.setCatName(rs.getString("catName"));
            dto.setBrandName(rs.getString("brandName"));
            dto.setIsDisable(rs.getBoolean("isDisable"));
            dto.setUrlThumbnail(rs.getString("imgURL"));
            list.add(dto);
        }
        closeConnection();
        return list;
    }

    public int getSizeProductByBrandID(int brandID) throws SQLException, ClassNotFoundException, NamingException {
        int size = 0;
        lookUpConnection();
        String sql = "EXEC getSizeProductByBrandID ?";
        stm = conn.prepareStatement(sql);
        stm.setInt(1, brandID);
        rs = stm.executeQuery();
        if (rs.next()) {
            size = rs.getInt("sizeProduct");
        }
        closeConnection();
        return size;
    }

    public int getProductSize(String listType) throws SQLException, ClassNotFoundException, NamingException {
        int size = 0;
        lookUpConnection();
        String sql = "EXEC getAccessoriesSize";
        if (listType.equals("goldbar")) {
            sql = "EXEC getGoldBarSize";
        }
        stm = conn.prepareStatement(sql);
        rs = stm.executeQuery();
        if (rs.next()) {
            size = rs.getInt("sizeProduct");
        }
        closeConnection();
        return size;
    }

    public ProductDTO getProductByID(int productID) throws SQLException, ClassNotFoundException, NamingException {
        ProductDTO dto = null;
        lookUpConnection();
        String sql = "EXEC getProductByID ?";
        stm = conn.prepareStatement(sql);
        stm.setInt(1, productID);
        rs = stm.executeQuery();
        if (rs.next()) {
            dto = new ProductDTO();
            dto.setId(rs.getInt("productID"));
            dto.setProductName(rs.getString("productName"));
            dto.setPrice(rs.getFloat("price"));
            dto.setQuantity(rs.getInt("quantity"));
            dto.setCatName(rs.getString("catName"));
            dto.setBrandName(rs.getString("brandName"));
            dto.setUrlThumbnail(rs.getString("thumbnailImg"));
            dto.setIsDisable(rs.getBoolean("isDisable"));
        }
        closeConnection();
        return dto;
    }

    public List<ProductDTO> getProductPaging(int pageIndex, int pageSize, String listType) throws SQLException, ClassNotFoundException, NamingException {
        List<ProductDTO> list = null;
        ProductDTO dto = null;
        lookUpConnection();
        String sql = "EXEC getAccessoriesProductPaging ?,?";
        if (listType.equals("goldbar")) {
            sql = "EXEC getGoldBarProductPaging ?,?";
        }
        stm = conn.prepareStatement(sql);
        stm.setInt(1, pageIndex);
        stm.setInt(2, pageSize);
        rs = stm.executeQuery();
        list = new ArrayList<>();
        while (rs.next()) {
            dto = new ProductDTO();
            dto.setId(rs.getInt("productID"));
            dto.setProductName(rs.getString("productName"));
            dto.setPrice(rs.getFloat("price"));
            dto.setQuantity(rs.getInt("quantity"));
            dto.setCatName(rs.getString("catName"));
            dto.setBrandName(rs.getString("brandName"));
            dto.setIsDisable(rs.getBoolean("isDisable"));
            dto.setUrlThumbnail(rs.getString("imgURL"));
            list.add(dto);
        }
        closeConnection();
        return list;
    }

    public List<ProductDTO> searchByProductName(String searchValue) throws SQLException, ClassNotFoundException, NamingException {
        List<ProductDTO> list = null;
        ProductDTO dto = null;
        lookUpConnection();
        String sql = "SELECT a.productID, a.productName, a.price, a.quantity, b.catName, c.brandName, d.imgURL, a.isDisable "
                + "FROM dbo.Product a "
                + "JOIN dbo.Category b "
                + "ON a.catID = b.catID "
                + "JOIN dbo.Brand c "
                + "ON a.brandID = c.brandID "
                + "JOIN dbo.Img d "
                + "ON a.thumbnailImg = d.imgID "
                + "WHERE productName LIKE ? AND a.isDisable = 0";
        stm = conn.prepareStatement(sql);
        stm.setString(1, "%" + searchValue + "%");
        rs = stm.executeQuery();
        list = new ArrayList<>();
        while (rs.next()) {
            dto = new ProductDTO();
            dto.setId(rs.getInt("productID"));
            dto.setProductName(rs.getString("productName"));
            dto.setPrice(rs.getFloat("price"));
            dto.setQuantity(rs.getInt("quantity"));
            dto.setCatName(rs.getString("catName"));
            dto.setBrandName(rs.getString("brandName"));
            dto.setIsDisable(rs.getBoolean("isDisable"));
            dto.setUrlThumbnail(rs.getString("imgURL"));
            list.add(dto);
        }
        closeConnection();
        return list;
    }

    public int findProductIDByImgID(int imgID) throws SQLException, ClassNotFoundException, NamingException {
        int productID = 0;
        lookUpConnection();
        String sql = "SELECT productID "
                + "FROM dbo.Img "
                + "WHERE imgID = ?";
        stm = conn.prepareStatement(sql);
        stm.setInt(1, imgID);
        rs = stm.executeQuery();
        if (rs.next()) {
            productID = rs.getInt("productID");
        }
        closeConnection();
        return productID;
    }

    public boolean updateProduct(ProductDTO dto, int catID, int brandID, int thumbnailID) throws NamingException, SQLException {
        boolean check = false;
        lookUpConnection();
        String sql = "UPDATE dbo.Product "
                + "SET productName = ?, price = ?, quantity = ?, "
                + "catID = ?, brandID = ?, thumbnailImg = ? "
                + "WHERE isDisable = 0 AND productID = ?";
        stm = conn.prepareStatement(sql);
        stm.setString(1, dto.getProductName());
        stm.setFloat(2, dto.getPrice());
        stm.setInt(3, dto.getQuantity());
        stm.setInt(4, catID);
        stm.setInt(5, brandID);
        stm.setInt(6, thumbnailID);
        stm.setInt(7, dto.getId());
        if (stm.executeUpdate() > 0) {
            check = true;
        }
        closeConnection();
        return check;
    }

    public List<ProductDTO> getAllProduct() throws SQLException, ClassNotFoundException, NamingException {
        List<ProductDTO> list = null;
        ProductDTO dto = null;
        lookUpConnection();
        String sql = "EXEC getAllProduct";
        stm = conn.prepareStatement(sql);
        rs = stm.executeQuery();
        list = new ArrayList<>();
        while (rs.next()) {
            dto = new ProductDTO();
            dto.setId(rs.getInt("productID"));
            dto.setProductName(rs.getString("productName"));
            dto.setPrice(rs.getFloat("price"));
            dto.setQuantity(rs.getInt("quantity"));
            dto.setCatName(rs.getString("catName"));
            dto.setBrandName(rs.getString("brandName"));
            dto.setUrlThumbnail(rs.getString("imgURL"));
            dto.setIsDisable(rs.getBoolean("isDisable"));
            list.add(dto);
        }
        closeConnection();
        return list;
    }

    public boolean insertProduct(ProductDTO dto, int catID, int brandID) throws ClassNotFoundException, NamingException, SQLException {
        boolean check = false;
        lookUpConnection();
        String sql = "INSERT INTO dbo.Product "
                + "(productName, price, quantity, catID, brandID, isDisable) "
                + "VALUES (?,?,?,?,?,?)";
        stm = conn.prepareStatement(sql);
        stm.setString(1, dto.getProductName());
        stm.setFloat(2, dto.getPrice());
        stm.setInt(3, dto.getQuantity());
        stm.setInt(4, catID);
        stm.setInt(5, brandID);
        stm.setBoolean(6, false);
        if (stm.executeUpdate() > 0) {
            check = true;
        }
        closeConnection();
        return check;
    }
    
    public int findLastIDInserted() throws NamingException, SQLException{
        int lastID = 0;
        lookUpConnection();
        String sql = "SELECT productID as lastID FROM dbo.Product WHERE productID = @@Identity";
        stm = conn.prepareStatement(sql);
        rs = stm.executeQuery();
        if(rs.next()){
            lastID = rs.getInt("lastID");
        }
        closeConnection();
        return lastID;
    }

    public boolean deleteProduct(int productID) throws NamingException, SQLException {
        boolean check = false;
        lookUpConnection();
        String sql = "UPDATE dbo.Product SET isDisable = ? WHERE productID = ?";
        stm = conn.prepareStatement(sql);
        stm.setBoolean(1, true);
        stm.setInt(2, productID);
        if (stm.executeUpdate() > 0) {
            check = true;
        }
        closeConnection();
        return check;
    }
    
    public boolean updateThumbnail(int productID, int imgID) throws NamingException, SQLException {
        boolean check = false;
        lookUpConnection();
        String sql = "UPDATE dbo.Product SET thumbnailImg = ? WHERE productID = ?";
        stm = conn.prepareStatement(sql);
        stm.setInt(1, imgID);
        stm.setInt(2, productID);
        if (stm.executeUpdate() > 0) {
            check = true;
        }
        closeConnection();
        return check;
    }
}
