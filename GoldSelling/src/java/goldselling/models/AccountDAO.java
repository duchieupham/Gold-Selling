/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goldselling.models;

import goldselling.dtos.AccountDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author phamduchieu
 */
public class AccountDAO {

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

    public AccountDTO checkLogin(String username, String password) throws NamingException, SQLException {
        AccountDTO dto = null;
        lookUpConnection();
        String sql = "SELECT a.userID, a.password, a.firstname, a.lastname, a.email, a.emailID, a.address, b.roleName FROM dbo.Account a "
                + "JOIN dbo.Role b "
                + "ON a.roleID = b.roleID "
                + "WHERE a.userID = ? and a.password = ? and a.isDisable = 0";
        stm = conn.prepareStatement(sql);
        stm.setString(1, username);
        stm.setString(2, password);
        rs = stm.executeQuery();
        if (rs.next()) {
            dto = new AccountDTO();
            dto.setUserID(rs.getString("userID"));
            dto.setPassword(rs.getString("password"));
            dto.setFirstname(rs.getString("firstname"));
            dto.setLastname(rs.getString("lastname"));
            dto.setEmail(rs.getString("email"));
            dto.setEmailID(rs.getString("emailID"));
            dto.setAddress(rs.getString("address"));
            dto.setRolename(rs.getString("roleName"));
        }
        closeConnection();
        return dto;
    }

    public AccountDTO checkLoginByGmail(String email, String emailID) throws NamingException, SQLException {
        AccountDTO dto = null;
        lookUpConnection();
        String sql = "SELECT a.userID, a.password, a.firstname, a.lastname, a.email, a.emailID, a.address, b.roleName FROM dbo.Account a "
                + "JOIN dbo.Role b "
                + "ON a.roleID = b.roleID "
                + "WHERE a.email = ? and a.emailID = ? and a.isDisable = 0";
        stm = conn.prepareStatement(sql);
        stm.setString(1, email);
        stm.setString(2, emailID);
        rs = stm.executeQuery();
        if (rs.next()) {
            dto = new AccountDTO();
            dto.setUserID(rs.getString("userID"));
            dto.setPassword(rs.getString("password"));
            dto.setFirstname(rs.getString("firstname"));
            dto.setLastname(rs.getString("lastname"));
            dto.setEmail(rs.getString("email"));
            dto.setEmailID(rs.getString("emailID"));
            dto.setAddress(rs.getString("address"));
            dto.setRolename(rs.getString("roleName"));
        }
        closeConnection();
        return dto;
    }

    public boolean updateEmail(String userID, String email, String emailID) throws NamingException, SQLException {
        boolean check = false;
        lookUpConnection();
        String sql = "UPDATE dbo.Account SET email = ? AND emailID = ? WHERE userID = ? and isDisable = 0";
        stm = conn.prepareStatement(sql);
        stm.setString(1, email);
        stm.setString(2, emailID);
        stm.setString(3, userID);
        if (stm.executeUpdate() > 0) {
            check = true;
        }
        closeConnection();
        return check;
    }

}
