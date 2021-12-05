<%-- 
    Document   : product-by-brand
    Created on : Aug 27, 2020, 10:46:11 PM
    Author     : phamduchieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blackberry - Product Overview</title>
        <link href="./css/custom.css" rel="stylesheet" type="text/css">
        <script src="./js/animation.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="bg-light-white nav-body">
            <div class="brand-name-center">  
                <img src="./images/brands/<s:property value="%{imgBrandURL}"/>"/>
            </div>
            <div class="product-space">
                <s:iterator var="productDTO" value="%{listProductByBrand}">
                    <div class="product-element">
                        <img class="thumbnail-img" src="./images/products/<s:property value="%{#productDTO.urlThumbnail}"/>"/>
                        <div class="thumbnail-cat"><s:property value="%{#productDTO.catName}"/></div><br/>
                        <div class="thumnail-button-space">
                            <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Customer'}">
                                <s:form action="addToCart">
                                    <s:hidden name="productID" value="%{#productDTO.id}"/>
                                    <s:submit cssClass="thumnail-button" value="Add to Cart"/><img class="thumbnail-symbol" src="./images/addtocart.png"/>
                                </s:form>
                            </s:if>
                            <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Adminstrator'}">
                                <s:form action="updateProduct">
                                    <s:hidden name="productID" value="%{#productDTO.id}"/>
                                    <s:submit cssClass="thumnail-button" value="Edit"/><img class="thumbnail-symbol" src="./images/updateproduct.png"/>
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
            <div class="page-number">
                <s:iterator var="pageNumber" value="" begin="1" end="%{pageCount}" status="counter">
                    <s:url var="productByBrand" value="showProductByBrandID">
                        <s:param name="brandID" value="%{brandID}"/>
                        <s:param name="pageIndex" value="%{#counter.count}"/>
                    </s:url>
                    <s:if test="%{#counter.count == pageIndex}">
                        <s:a cssClass="page-number-element2 border-a" href="%{#productByBrand}"><s:property value="%{#counter.count}"/></s:a>
                    </s:if>
                    <s:if test="%{#counter.count != pageIndex}">
                        <s:a cssClass="page-number-element border-a" href="%{#productByBrand}"><s:property value="%{#counter.count}"/></s:a>
                    </s:if>

                </s:iterator>
            </div>
        </div


    </body>
</html>

