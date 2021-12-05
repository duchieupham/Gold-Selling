<%-- 
    Document   : dashboard
    Created on : Aug 22, 2020, 5:15:11 PM
    Author     : phamduchieu
--%>

<%@page import="goldselling.dtos.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Black Berry - Dashboard</title>
        <link href="./css/custom.css" rel="stylesheet" type="text/css">
        <script src="./js/animation.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="bg-light-white nav-body">
            <div onmouseover="showTwoButtonsNav()" onmouseout="hideTwoButtonsNav()" class="block-dashboard" id="horizontal-container">
                <div id="desc-container">
                    Discover magnificent things
                </div>
                <div class="block1">
                    <s:iterator var="brandDTO" value="#application.LIST_BRAND" status="counter">
                        <div class="element-brand">
                            <img class="img-brand" src="./images/brands/<s:property value="%{#brandDTO.imgURL}"/>"/>
                            <div class="brand-description">
                                <div class="desc-content">
                                    <s:property value="%{#brandDTO.description}"/>
                                </div>
                                <s:url var="productByBrand" value="showProductByBrandID">
                                    <s:param name="brandID" value="%{#brandDTO.id}"/>
                                    <s:param name="pageIndex" value="1"/>
                                </s:url>
                                <s:a class="nav-element" href="%{#productByBrand}"><img class="img-discover" src="./images/discover.png"/></s:a>
                                </div>
                            </div>

                    </s:iterator>
                </div>
            </div>
            <img onclick="moveRight()" onmouseover="showButtonNextBrand()" onmouseout="hideButtonNextBrand()" id="button-next-brand" class="nav-button-brand" src="./images/nextbrand.png"/>
            <img onclick="moveLeft()" onmouseover="showButtonPrevBrand()" onmouseout="hideButtonPrevBrand()" id="button-prev-brand" class="nav-button-brand" src="./images/prevbrand.png"/>
            <div class="block2">
                <div class="title-center">
                    Accessories<br/>
                    <div class="desc-2">Lots to love. Less to spend</div>
                    <s:url var="showProductListA" value="showProductOverview">
                        <s:param name="pageIndex" value="1"/>
                        <s:param name="type" value="'accessories'"/>
                    </s:url>
                    <s:a cssClass="discover-now" href="%{#showProductListA}">Discover now <img class="img-discover-now" src="./images/discovernow.png"/></s:a><br/><br/>
                        <img src="./images/accessories@1x.svg"/>
                        <br/><br/><br/>

                    </div>
                </div>
                <div class="block2 white-bg">
                    <div class="block3">
                        <div class="title-center">
                            Gold Bar<br/>
                            <div class="desc-2">Pure</div>
                        <s:url var="showProductListG" value="showProductOverview">
                            <s:param name="pageIndex" value="1"/>
                            <s:param name="type" value="'goldbar'"/>
                        </s:url>
                        <s:a cssClass="discover-now" href="%{#showProductListG}">Discover now <img class="img-discover-now" src="./images/discovernow.png"/></s:a>
                            <br/><br/>
                            <img src="./images/goldbar.svg"/>
                            <br/>
                        </div>
                    </div>
                    <div class="block4">
                    <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Customer'}">
                        <div class="title-center">
                            Check out <br/> your bag<br/>
                            <a class="discover-now" href="">Check out <img class="img-discover-now" src="./images/discovernow.png"/></a><br/><br/>
                            <img class="big-bag" src="./images/bigbag.png"/>
                            <br/>
                        </div>
                    </s:if>
                    <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Adminstrator'}">
                        <div class="title-center">
                            Manage <br/> Product<br/>
                            <a class="discover-now" href="manageProduct">Access now <img class="img-discover-now" src="./images/discovernow.png"/></a><br/><br/>
                            <img class="big-bag" src="./images/bigmanage.png"/>
                            <br/>
                        </div>
                    </s:if>

                </div>
            </div>
        </div>

    </body>
</html>
