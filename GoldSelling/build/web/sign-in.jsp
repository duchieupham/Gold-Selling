<%-- 
    Document   : index
    Created on : Aug 22, 2020, 5:11:00 PM
    Author     : phamduchieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in - Blackberry</title>
        <link href="./css/custom.css" rel="stylesheet" type="text/css">
        <script src="./js/animation.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="bg-dark-80 nav-header"></nav>
        <nav class="bg-light-gray nav-body">
            <div id="login-form">
                <form action="login" method="POST">
                    <input class="text-input" type="text" name="username" value="" placeholder="Username"/><br/>
                    <input class="text-input" type="password" name="password" value="" placeholder="Password"/><br/>
                    <input id="button-sign-in" type="submit" value="Sign in" />
                </form>
                <div>
                    <input onclick="openDialog()" type="submit" id="button-google" value="Sign in with Google"/>
                </div>
                <a id="a-insert" href="">Create new account</a>
            </div>
            <div id="brand-name">
                Blackberry
            </div>
            <div id="desc-brand-name">
                <pre>A great while ago, when the world was
full of wonders… no wait. You might 
be forgiven for thinking that in 
this modern age all the time old 
stories of yesteryear have no compare.<br/>
Across the world are endless places of 
beauty and something our only failing 
in this digitally connected future is 
how we sometimes lack the singular moments
to connect to whats genuine and special 
in the world.
                </pre>
            </div>
            <img id="banner" src="./images/banner3.svg"/>
        </nav>
    </body>
</html>
