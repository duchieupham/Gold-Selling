<%-- 
    Document   : create-product
    Created on : Aug 31, 2020, 5:01:05 PM
    Author     : phamduchieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blackberry - Create Product</title>
    </head>
    <body>
        <div class="bg-light-gray nav-body">
            <div class="update-frame">
                <div class="title-update">
                    Insert Product
                </div>
                <s:form action="executeInsertProduct">
                    <div class="desc-update">
                        Product name: <s:textfield cssClass="text-field-update" name="productName"/><img class="icon-edit-txt" src="./images/editframe.png"/>
                    </div>
                    <div class="desc-update">
                        Price: <s:textfield cssClass="text-field-update" name="productPrice"/><img class="icon-edit-txt" src="./images/editframe.png"/>
                    </div> 
                    <div class="desc-update">
                        Quantity: <s:textfield cssClass="text-field-update" name="productQuantity"/><img class="icon-edit-txt" src="./images/editframe.png"/>
                    </div>
                    <div class="desc-update">
                        Product type: <select class="select-box-brand" name="catValue">
                            <s:iterator var="cat" value="%{listCategory}">
                                <option value="<s:property value="%{#cat.id}"/>"><s:property value="%{#cat.catName}"/></option>
                            </s:iterator>
                        </select><img class="icon-edit-txt" src="./images/dropdown.png"/>
                    </div>
                    <div class="desc-update">
                        Brand name: <select class="select-box-brand" name="brandValue">
                            <s:iterator var="brand" value="%{listBrand}">
                                <option value="<s:property value="%{#brand.id}"/>"><s:property value="%{#brand.brandName}"/></option>
                            </s:iterator>
                        </select><img class="icon-edit-txt" src="./images/dropdown.png"/>
                    </div>
                    <s:submit cssClass="thumnail-button2" value="Next"/>
                    <s:reset onclick="changeImage()" cssClass="thumnail-button2" value="Reset"/>
                </s:form>
            </div>
        </div>
    </body>
</html>
