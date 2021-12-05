<%-- 
    Document   : header.jsp
    Created on : Aug 24, 2020, 10:37:52 PM
    Author     : phamduchieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./css/custom.css" rel="stylesheet" type="text/css">
        <script src="./js/animation.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="bg-dark-80 nav-header">
            <ul id="menu-header" class="center-nav-header">
                <li class="part-contain-header"></li>
                <li class="part-contain-header"><a href="backHome"><img class="logo" src="./images/logo.png"></a></li>
                <li class="part-contain-header"></li>

                <li class="part-contain-header">
                    <s:url var="showProductListA" value="showProductOverview">
                        <s:param name="pageIndex" value="1"/>
                        <s:param name="type" value="'accessories'"/>
                    </s:url>
                    <s:a href="%{#showProductListA}">Accessories</s:a>

                    </li>
                    <li class="part-contain-header">
                    <s:url var="showProductListG" value="showProductOverview">
                        <s:param name="pageIndex" value="1"/>
                        <s:param name="type" value="'goldbar'"/>
                    </s:url>
                    <s:a href="%{#showProductListG}">Gold Bar</s:a>
                    </li>
                    <li class="part-contain-header"><img onclick="enableSearch()" class="icon-header" src="./images/search.png"/></li>
                    <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Customer'}">
                    <li id="icon-bag" class="part-contain-header"><img class="icon-header" onclick="showBag()" src="./images/noti.png"/></li>
                    <li id="icon-bag-hidden" class="part-contain-header"><img class="icon-header" onclick="hideBag()" src="./images/clear.png"/></li>
                    </s:if>
                    <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Adminstrator'}">
                    <li id="icon-bag" class="part-contain-header"><img class="icon-header" onclick="showBag()" src="./images/manage.png"/></li>
                    <li id="icon-bag-hidden" class="part-contain-header"><img class="icon-header" onclick="hideBag()" src="./images/clear.png"/></li>
                    </s:if>


                <li class="part-contain-header"><img id="avatar-header" src="./images/avtartar.jpg"/><div class="firstname-header">Hi, <s:property value="#session.ACCOUNT_DTO.firstname"/></div></li>
                <li class="part-contain-header">
                    <s:if test="%{#session.ACCOUNT_DTO.emailID == null}">
                        <input type="submit" onclick="openDialog2()" id="link-w-gg" value="Link with Google"/>
                    </s:if>
                </li>
                <li class="part-contain-header"></li>
            </ul>
            <div id="box-buying" class="box-bag">
                <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Adminstrator'}">
                    <div class="button-list2">
                        <img class="img-button-list p4" src="./images/historybill.png"/>
                        <button class="button-list-part p1" type="submit">Show History Payment</button>
                        <img class="line-hor" src="./images/line.png"/>
                        <br/>
                        <img class="img-button-list p5" src="./images/manageproduct.png"/>
                        <form action="manageProduct">
                            <button class="button-list-part" type="submit">Manage Product</button>
                        </form>
                        <img class="line-hor p2" src="./images/line.png"/>
                        <br/>
                        <img class="img-button-list p6" src="./images/signout.png"/>
                        <form action="logout">
                            <button class="button-list-part p3" type="submit">Sign out</button>
                        </form>
                    </div>
                </s:if>
                <s:if test="%{#session.ACCOUNT_DTO.roleName == 'Customer'}">
                    <img class="icon-in-bag" src="./images/bag2.png"/>
                    <img class="line-vertical" src="./images/line.png"/>
                    <div id="bag-quantity">0 item(s)</div>
                    <div id="bag-total-price">
                        Total Price<br/>
                        0$
                    </div>
                    <div class="button-list">
                        <img class="img-button-list p4" src="./images/bag3.png"/>
                        <button class="button-list-part p1" type="submit">Show your Bag</button>
                        <img class="line-hor" src="./images/line.png"/>
                        <br/>
                        <img class="img-button-list p5" src="./images/account.png"/>
                        <button class="button-list-part" type="submit">Account Setting</button>
                        <img class="line-hor p2" src="./images/line.png"/>
                        <br/>
                        <img class="img-button-list p6" src="./images/signout.png"/>
                        <form action="logout">
                            <button class="button-list-part p3" type="submit">Sign out</button>
                        </form>
                    </div>
                </s:if>
            </div>
            <ul id="search-frame" class="center-nav-header">
                <s:form action="searchProduct">
                    <li class="part-search-frame-3"><s:textfield id="search-field" name="searchValue" placeholder="Search product name"/></li>
                    <li class="part-search-frame-1">
                        <s:submit value="Search"/>
                    </li>
                    <li class="part-search-frame-1"><img onclick="hideSearch()" class="icon-header" src="./images/clear.png"/></li>
                    </s:form>

            </ul>
        </nav>
    </body>
</html>
