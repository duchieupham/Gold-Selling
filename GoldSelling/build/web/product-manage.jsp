<%-- 
    Document   : product-manage
    Created on : Aug 31, 2020, 2:25:39 PM
    Author     : phamduchieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blackberry - Manage Product</title>
    </head>
    <body>
        <div class="bg-light-white nav-body">
            <div class="product-manage-title">
                Product Management
                <s:form action="newProduct">
                    <s:submit cssClass="thumnail-button4 move-right" value="Create"/>
                </s:form>
            </div>
            <table class="table-product-frame">
                <thead>
                <th></th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Brand</th>
                <th>Price</th>
                <th>Quantity</th>
                <th></th>
                <th></th>
                </thead>
                <tbody>
                    <s:iterator var="dto" value="%{listProduct}" status="counter">
                        <tr>
                            <td><img class="small-img" src="./images/products/<s:property value="%{#dto.urlThumbnail}"/>"/></td>
                            <td class="table-name"><s:property value="%{#dto.productName}"/></td>
                            <td><s:property value="%{#dto.catName}"/></td>
                            <td><s:property value="%{#dto.brandName}"/></td>
                            <td><s:property value="%{#dto.price}"/></td>
                            <td><s:property value="%{#dto.quantity}"/></td>
                            <td>
                                <s:form action="updateProduct">
                                    <s:hidden name="productID" value="%{#dto.id}"/>
                                    <s:submit cssClass="thumnail-button3" value="Edit"/>
                                </s:form>
                            </td>
                            <td>
                                <s:form action="deleteProduct">
                                    <s:hidden name="productID" value="%{#dto.id}"/>
                                    <s:submit cssClass="thumnail-button3 move-left" value="Delete"/>
                                </s:form>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
    </body>
</html>
