<%-- 
    Document   : product-overview
    Created on : Aug 29, 2020, 11:24:33 PM
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
            <div class="overview-p-content">
                <s:iterator var="productDTO" value="%{listProduct}">
                    <div class="overview-p-element">
                        <img class="thumbnail-img2" src="./images/products/<s:property value="%{#productDTO.urlThumbnail}"/>"/>
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
        </div>
        <div class="page-number-overview">
            <s:iterator var="pageNumber" value="" begin="1" end="%{pageCount}" status="counter">
                <s:url var="productOverview" value="showProductOverview">
                    <s:param name="pageIndex" value="%{#counter.count}"/>
                    <s:param name="type" value="%{type}"/>
                </s:url>
                <s:if test="%{#counter.count == pageIndex}">
                    <s:a cssClass="page-number-element2 border-a" href="%{#productOverview}"><s:property value="%{#counter.count}"/></s:a>
                </s:if>
                <s:if test="%{#counter.count != pageIndex}">
                    <s:a cssClass="page-number-element border-a" href="%{#productOverview}"><s:property value="%{#counter.count}"/></s:a>
                </s:if>
            </s:iterator>
        </div>
    </body>
</html>
