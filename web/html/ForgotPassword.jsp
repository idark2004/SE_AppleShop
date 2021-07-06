<%-- 
    Document   : ForgotPassword
    Created on : Jun 18, 2021, 11:53:44 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Reset password</title>
        <script src="js/main.js"></script>
        <link rel="stylesheet" href="css/loginPage.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/base.css">     
        <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
         
</head>
<body onload="<c:if test="${message != null}">ResetPassLoad()</c:if>">
   
      <div class="page-login">
              <div class="form-login">
                  <form action="ResetPasswordController" method="post" style="margin-bottom:7%;">
                    <div class="imgcontainer">
                        <img style="max-width: 10rem;" src="images/shop_logo.png" alt="Logo" class="shop-logo">
                    </div>
                    <div class="btn" style="font-size: 1.6rem;text-align: center;">
                    Please enter your login email, we'll send a new random password to your inbox:
                  </div>
                   
                    <div class="container input-container">
                        <label for="email"><b>Email</b></label>        
                        <input placeholder="Enter your recovery email" type="text" name="email" id="email" size="20"> 
                    </div>
                    <div class="container" style="background-color:#f1f1f1">
                        <a href="Homepage.jsp"  class="form-cance"><button type="button" class="cancelbtn">Cancel</button></a>
                         <button type="submit" class="btn" >Send me new password</button>
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
<script type="text/javascript">
    function ResetPassLoad()	{
                    alert("${message}");
                }
    $(document).ready(function() {
        $("#resetForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                }      
            },
             
            messages: {
                email: {
                    required: "Please enter email",
                    email: "Please enter a valid email address"
                }
            }
        });
 
    });
</script>
</body>
</html>