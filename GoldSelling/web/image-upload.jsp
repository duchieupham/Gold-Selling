<%-- 
    Document   : image-upload
    Created on : Aug 31, 2020, 7:38:07 PM
    Author     : phamduchieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blackberry - Upload Image Product</title>
    </head>
    <body>

        <div class="bg-light-gray nav-body">
            <div class="update-frame">
                <form action="uploadImage" id="upload" enctype="multipart/form-data" method="POST">                
                    <div class="title-update msg-noti">
                        <s:if test="%{message!=null}">
                            <s:property value="%{message}"/>
                        </s:if>
                    </div>
                    <div class="desc-update">
                        Upload Image allow smaller than 4 Megabytes
                    </div>
                    <div class="desc-update">
                        <input  type="file" name="file" id="js-upload-files" accept="image/*"><br/>
                        <button type="submit" class="thumnail-button2 cus-tn">Upload Image</button>
                    </div>
                </form>
                <form action="manageProduct">
                     <button type="submit" class="thumnail-button2 cus-tn2">Back to Manage Product Page</button>
                </form>
                
            </div>

        </div>


    </body>
</html>
