<%-- 
    Document   : detail-product
    Created on : Aug 29, 2020, 6:39:15 PM
    Author     : phamduchieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blackberry - Detail</title>
        <link href="./css/custom.css" rel="stylesheet" type="text/css">
        <script src="./js/animation.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="bg-light-white nav-body">
            <div class="detail-product-info">
                <div class="detail-p-name"><s:property value="%{dto.productName}" /></div>
                <div class="detail-p-cat">Type <s:property value="%{dto.catName}" /></div>
                <div class="detail-p-brand">Brand <s:property value="%{dto.brandName}" /></div>
                <div class="detail-p-price">Price <s:property value="%{dto.price}" /> $</div>
                <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Customer'}">
                    <div class="detail-p-button">
                        <s:form action="addToCart">
                            <s:hidden name="productID" value="%{dto.id}"/>
                            <s:submit cssClass="detail-add-cart" value="Add to Cart" />
                            <img class="detail-img-add-cart" src="./images/addtocart.png"/>
                        </s:form>
                    </div>
                </s:if>
                <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Adminstrator'}">
                    <div class="detail-p-button">
                        <s:form action="updateProduct">
                            <s:hidden name="productID" value="%{dto.id}"/>
                            <s:submit cssClass="detail-add-cart" value="Edit" />
                            <img class="detail-img-add-cart" src="./images/updateproduct.png"/>
                        </s:form>
                    </div>
                </s:if>
            </div>
            <div class="detail-product-img">
                <s:iterator var="imgURL" value="%{imgList}">
                    <img class="img-detail-element" src="./images/products/<s:property value="%{#imgURL.imgURL}"/>"/><br/>
                </s:iterator>
            </div>
        </div>
    </body>
</html>
