<%-- 
    Document   : changePass
    Created on : Jun 15, 2021, 4:07:02 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Change Password</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link rel="stylesheet" href="css/loginPage.css">
    <link rel="stylesheet" href="css/mainPhuc.css">
    <link rel="stylesheet" href="css/base.css">
</head>

<body>
      <div class="form-login">
                <form action="MainController" method="post">
                    <div class="imgcontainer">
                        <img style="max-width: 10rem;" src="images/shop_logo.png" alt="Logo" class="shop-logo">
                    </div>

                    <div class="container">
                        <label for="password"><b>Password</b></label>
                        <input type="password" placeholder="Enter New Password" name="password" required>
                        <label for="psw"><b>Confirm</b></label>
                        <input type="password" placeholder="Re-enter Password" name=psw required>                       
                        <label>
                            <input type="checkbox" checked="checked" name="remember"> Remember me
                        </label>
                    </div>

                    <div class="container" style="background-color:#f1f1f1">
                        <a href="Homepage.jsp"  class="form-cance"><button type="button" class="cancelbtn">Cancel</button></a>
                         <button type="submit" class="btn" name="action" value="Change Password">Submit</button>
                        <span class="psw"><a href="#">Forgot password?</a></span>
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
                        <span class="foot-left-info__shop-address-text">Số 69 Phố Trần Duy Hưng Hà Nội</span>
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
</body>
</html>
