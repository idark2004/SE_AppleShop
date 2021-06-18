<%-- 
    Document   : loginForm
    Created on : May 24, 2021, 2:15:25 PM
    Author     : anime
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Log In</title>
        <script src="js/main.js"></script>
        <link rel="stylesheet" href="css/loginPage.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/base.css">     
        <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
    </head>
     <body onload="<c:if test="${requestScope.signup!= null}">Signupstart()</c:if>">

        <div class="page-login">
              <div class="form-login">
                <form action="MainController" method="post">
                    <div class="imgcontainer">
                        <img style="max-width: 10rem;" src="images/shop_logo.png" alt="Logo" class="shop-logo">
                    </div>

                    <div class="container input-container">
                        <label for="uname"><b>Email</b></label>
                        <input type="text" placeholder="Enter Username" name="uname" required>

                        <label for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="psw" required>
                       
                        <label>
                            <input type="checkbox" checked="checked" name="remember"> Remember me
                        </label>
                    </div>

                    <div class="container" style="background-color:#f1f1f1">
                        <a href="Homepage.jsp"  class="form-cance"><button type="button" class="cancelbtn">Cancel</button></a>
                         <button type="submit" class="btn" name="action" value="Login">Submit</button>
                        <span class="psw"><a href="ForgotPassword.jsp">Forgot password?</a></span>
                    </div>
                </form>
            </div>

            <footer class="footer">
                <div class="grid footer-border">

                    <h2 class="foot-tittle">Contact us</h2>
                    <div class="foot-info">    
                        <div class="foot-left-info">
                            <div class="foot-left-info__mail">
                                <i class="fas fa-envelope"></i>
                                <span class="foot-left-info__mail-addres">SE15AppleStore@gmail.com</span>
                            </div>
                            <div class="foot-left-info__phonenumber">
                                <i class="fas fa-phone-square-alt"></i>
                                <span class="foot-left-info__phonenumber-number">0839440343</span>
                            </div>
                            <div class="foot-left-info__shop-address">
                                <i class="fas fa-map-marker-alt"></i>
                                <span class="foot-left-info__shop-address-text">Cupertino, California,America</span>
                            </div>
                        </div>
                        <div class="foot-right-info">
                            <div class="foot-right-info__apple-icon"><i class="fab fa-apple"></i></div>
                            <div class="foot-right-info__link">
                                <div class="foot-right-info__product">
                                    <a href="" class="foot-right-info__product-link">Iphone</a>
                                    <a href="" class="foot-right-info__product-link">Ipad</a>
                                    <a href="" class="foot-right-info__product-link">Mac</a>
                                    <a href="" class="foot-right-info__product-link">Others</a>
                            </div>
                            <div class="foot-right-info__policy">
                                    <a href="" class="foot-right-info__policy-link">Privacy Policies</a>
                                    <a href="" class="foot-right-info__policy-link">Sale and refund</a>
                            </div>
                            </div>
                        </div>      
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>
