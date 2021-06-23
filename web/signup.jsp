<%-- 
    Document   : signup
    Created on : May 23, 2021, 6:10:00 PM
    Author     : phath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign Up</title>
        <link rel="stylesheet" href="css/signupForm.css">
        <link rel="stylesheet" href="css/mainPhuc.css">  
        <link rel="stylesheet" href="css/base.css">      
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
    </head>

    <body >
        <div class="page-signup">

            <div class="form-signup">
                <form action="MainController" style="border:1px solid #ccc">
                    <div class="container">
                        <h1 class="form-tittle">CREATE YOUR ACCOUNT</h1>

                        <hr>

                        <label for="email"><b>Email</b></label>
                        <input type="email" placeholder="Enter Email" id="email" name="email" required>
                        <c:if test="${requestScope.SIGNUP_ERROR !=null}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong>${requestScope.SIGNUP_ERROR.emailError}</strong> 
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                            </div>
                        </c:if>
                        <br>
                        <label for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" id="psw" name="psw" maxlength="10" required>

                        <label for="psw-repeat"><b>Repeat Password</b></label>
                        <input type="password" id="psw-repeat" placeholder="Repeat Password" name="psw-repeat" maxlength="10" required>
                        <c:if test="${requestScope.SIGNUP_ERROR !=null}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong>${requestScope.SIGNUP_ERROR.passwordError}</strong> 
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                            </div>
                        </c:if>
                        <label for="uName"><b>Name</b></label>
                        <input type="text" id="uName" name="name" placeholder="Your Name" maxlength="50" required>

                        <label for="address"><b>Address</b></label>
                        <input type="text" placeholder="Enter your address" id="address" name="uAdd" maxlength="80" required>

                        <label for="phone"><b>Phone-number</b></label>
                        <input type="text" id="phone" placeholder="Enter your phone number" name="pnum" maxlength="10" required>        
                        <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

                        <div class="clearfix">
                            <a href="Homepage.jsp" class="cancelbtn page-signup_home-link">Cancel</a>
                            <input type="submit" name="action" class="signupbtn" value="Sign Up"/>
                        </div>
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
