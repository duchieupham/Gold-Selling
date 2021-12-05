<%-- 
    Document   : search-product
    Created on : Aug 30, 2020, 12:47:12 PM
    Author     : phamduchieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blackberry - Search Product</title>
        <link href="./css/custom.css" rel="stylesheet" type="text/css">
        <script src="./js/animation.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="bg-light-white nav-body">
            <div class="search-value-space">
                Search result: '<s:property value="%{searchValue}"/>'<br/>
            </div>
            <div class="search-result-space">
                <s:iterator var="productDTO" value="%{listProduct}">
                    <div class="search-element">
                        <img class="thumbnail-img2" src="./images/products/<s:property value="%{#productDTO.urlThumbnail}"/>"/>
                        <div class="thumbnail-cat2"><s:property value="%{#productDTO.catName}"/></div><br/>
                        <div class="thumnail-button-space2">
                            <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Adminstrator'}">
                                <s:form action="updateProduct">
                                    <s:hidden name="productID" value="%{#productDTO.id}"/>
                                    <s:submit cssClass="thumnail-button" value="Edit"/><img class="thumbnail-symbol" src="./images/updateproduct.png"/>
                                </s:form>
                            </s:if>
                            <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Customer'}">
                                <s:form action="addToCart">
                                    <s:hidden name="productID" value="%{#productDTO.id}"/>
                                    <s:submit cssClass="thumnail-button" value="Add to Cart"/><img class="thumbnail-symbol" src="./images/addtocart.png"/>
                                </s:form>
                            </s:if>
                            <s:form action="detailProduct">
                                <s:hidden name="productID" value="%{#productDTO.id}"/>
                                <s:submit cssClass="thumnail-button" value="Detail"/><img class="thumbnail-symbol" src="./images/detail.png"/>
                            </s:form>

                        </div>
                    </div>
                </s:iterator>
            </div>
        </div>
    </body>
</html>
