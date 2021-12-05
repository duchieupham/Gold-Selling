<%--
    Document   : update-product
    Created on : Aug 30, 2020, 5:11:33 PM
    Author     : phamduchieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blackberry - Update Product</title>
        <link href="./css/custom.css" rel="stylesheet" type="text/css">
        <script src="./js/animation.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="bg-light-gray nav-body">
            <div class="update-frame">
                <div class="title-update">
                    Update Product Information
                </div>
                <s:form action="executeUpdateProduct">
                    <div class="desc-update">
                        Product name: <s:textfield cssClass="text-field-update" name="productName" value="%{productDTO.productName}"/><img class="icon-edit-txt" src="./images/editframe.png"/>
                    </div>
                    <div class="desc-update">
                        Price: <s:textfield cssClass="text-field-update" name="productPrice" value="%{productDTO.price}"/><img class="icon-edit-txt" src="./images/editframe.png"/>
                    </div> 
                    <div class="desc-update">
                        Quantity: <s:textfield cssClass="text-field-update" name="productQuantity" value="%{productDTO.quantity}"/><img class="icon-edit-txt" src="./images/editframe.png"/>
                    </div>
                    <div class="desc-update">
                        Product type: <select class="select-box-brand" name="catValue">
                            <s:iterator var="cat" value="%{listCategory}">
                                <s:if test="%{#cat.catName == productDTO.catName}">
                                    <option selected value="<s:property value="%{#cat.id}"/>"><s:property value="%{#cat.catName}"/></option>
                                </s:if>
                                <s:if test="%{#cat.catName != productDTO.catName}">
                                    <option value="<s:property value="%{#cat.id}"/>"><s:property value="%{#cat.catName}"/></option>
                                </s:if>
                            </s:iterator>
                        </select><img class="icon-edit-txt" src="./images/dropdown.png"/>
                    </div>
                    <div class="desc-update">
                        Brand name: <select class="select-box-brand" name="brandValue">
                            <s:iterator var="brand" value="%{listBrand}">
                                <s:if test="%{#brand.brandName == productDTO.brandName}">
                                    <option selected value="<s:property value="%{#brand.id}"/>"><s:property value="%{#brand.brandName}"/></option>
                                </s:if>
                                <s:if test="%{#brand.brandName != productDTO.brandName}">
                                    <option value="<s:property value="%{#brand.id}"/>"><s:property value="%{#brand.brandName}"/></option>
                                </s:if>
                            </s:iterator>
                        </select><img class="icon-edit-txt" src="./images/dropdown.png"/>
                    </div>
                    <div class="desc-update">
                        Thumbnail Image: <select onchange="changeImage()" id="cboImg" class="select-box-brand" name="thumbnailValue">
                            <s:iterator var="img" value="%{listImg}" status="counter">
                                <s:if test="%{#img.imgID == productDTO.urlThumbnail}">
                                    <option selected value="<s:property value="%{#img.imgID}"/>,<s:property value="%{#img.imgURL}"/>">Image <s:property value="%{#counter.count}"/></option>
                                </s:if>
                                <s:if test="%{#img.imgID != productDTO.urlThumbnail}">
                                    <option value="<s:property value="%{#img.imgID}"/>,<s:property value="%{#img.imgURL}"/>">Image <s:property value="%{#counter.count}"/></option>
                                </s:if>
                            </s:iterator>
                        </select><img class="icon-edit-txt" src="./images/dropdown.png"/>
                    </div>
                    <div class="img-show-update">
                        <s:iterator var="img" value="%{listImg}" status="counter">
                            <s:if test="%{#img.imgID == productDTO.urlThumbnail}">
                                <img id="img-thumbnail-frame" class="img-content-update" src="./images/products/<s:property value="%{#img.imgURL}"/>"/>
                            </s:if>
                        </s:iterator>

                    </div>
                        <s:hidden name="productID" value="%{productDTO.id}"/>
                    <s:submit cssClass="thumnail-button2" value="Update"/>
                    <s:reset onclick="changeImage()" cssClass="thumnail-button2" value="Reset"/>
                </s:form>
            </div>


        </div>
    </body>
</html>
