<%-- 
    Document   : UserProfile
    Created on : May 25, 2021, 4:12:29 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" href="css/mainPhuc.css">
    <link rel="stylesheet" href="css/mainHoang.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/carticon.css">
    <link rel="stylesheet" href="css/cartListIcon.css">
    <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    
        <% 
          String uri = request.getRequestURI();
          int lastIndex = uri.lastIndexOf("/");
            String resource = uri.substring(lastIndex + 1);
        %>
    
        <title> <%= resource%> </title>
    </head>

    <body>
        <div class="page__user-profile">
            <header>
                <div class="shop-logo">
                    <a href="Homepage.jsp" class="home-link" style="display: inline-block;">
                        <section class="header_item" id="shopLogo">
                            <h1><i class="fab fa-apple fa-2x"></i> SE15 Apple Store</h1>
                        </section>
                    </a>
                </div>

                <div class="login">
                    <ul class="header_item_list">
                        <!-- If user logged in suscessfully , the item below wil showup and hide item other li item  -->
                        <c:if test="${sessionScope.user != null}">
                        <li class="header_item header__navbar-user">
                                <span class="header_item_user-name">Hello,${sessionScope.user.name}</span>
                                <ul class="header__navbar-user--menu">
                                    <li class="header__navbar-user--item">
                                         <a href="UserDetailController?userid=${sessionScope.user.userID}">User detail</a>
                                    </li>
                                    
                                    <li class="header__navbar-user--item">
                                        <a href="cartForm.jsp">Order detail</a>
                                    </li>
                                     <li class="header__navbar-user--item">
                                        <a href="orderHisotry.html">Order History</a>
                                    </li>
                                     <li class="header__navbar-user--item">
                                        <a href="changePass.jsp">Update Password</a>
                                    </li>
                                    <li class="header__navbar-user--item">
                                        <a href="">Sign out</a>
                                    </li>
                                </ul>
                        </li>
                        </c:if>
                        <c:if test="${sessionScope.user == null }">
                        <li class="header_item">
                            <a href="loginForm.jsp" class="header_item-link">Login</a>
                        </li>
                        <li class="header_item">
                            <a href="signup.jsp" class="header_item-link">Signup</a>
                        </li>
                        </c:if>                      
                    </ul>
                </div> 
            </header>
                 <div class="nav">
                <div class="topnav">
                    <div class="product-page">
                        <a class="product-link" href="ViewProductController?categoryID=&status=True" class="header-nav__item-active">All</a>
                        <a class="product-link" href="ViewProductController?categoryID=MB&status=True">Mac</a>
                        <a class="product-link" href="ViewProductController?categoryID=ID&status=True">iPad</a>
                        <a class="product-link" href="ViewProductController?categoryID=IP&status=True">iPhone</a>
                        <a class="product-link" href="ViewProductController?categoryID=AW&status=True">Apple Watch</a>
                        <a class="product-link" href="ViewProductController?categoryID=AS&status=True">Accessories</a>
                    </div>
                    <div class="responsive-div" style="display: flex;">
                        <div class=" search-container">
                            <form action="" class="search-form">
                                <input type="text" placeholder="Search.." name="search">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>

                        <div class=" cart">
                            
                            <a class="cart-view" href="MainController?action=ViewCart">
                                <i class="carft-icon fas fa-shopping-cart"></i>
                                <c:forEach var="cartItem" items="${sessionScope.cart}">
                                    <c:set var="subtotalCount" value="${cartItem.quantity}"/>
                                    <c:set var="subtotal" value="${subtotal+cartItem.quantity}"/>
                                </c:forEach>
                                <span class="cart-items">${subtotal}</span>
                            
                            </a>
                            <c:choose>
                                <c:when test="${sessionScope.cart == null}">
                                     <div class="header__cart-list header__cart-list--no-cart">

                                         <img src="images/no-cart.png" alt="" class="header___cart--no-cart---img">
                                         <span class="header__cart-list--no-cart-msg">Empty Cart</span>

                                     </div>     
                                </c:when>
                                <c:otherwise>
                                    <div class="header__cart-list">                                                              
                                        <header class="header__cart-heading">
                                            <h4 >View cart</h4>
                                        </header>
                                        <ul class="header__cart-list--item">
                                            <c:forEach var="cartItem" items="${sessionScope.cart}">
                                                <li class="header__cart-item">
                                                    <img src="${cartItem.product.image}" alt="" class="header__cart-img">
                                                    <div class="header__cart-item--info">
                                                        <div class="header__cart-item--head">
                                                            <h5 class="header__cart-item--name">
                                                                ${cartItem.product.name}
                                                            </h5>
                                                            <div class="header__cart-item-price--wrap">
                                                            <span class="header__cart-item--price"><fmt:formatNumber type="number" maxFractionDigits = "0" value="${cartItem.product.price}"/>VND</span>
                                                            <span class="header__cart-item--multiplication">x</span>
                                                            <span class="header__cart-item--quantity">${cartItem.quantity}</span>
                                                            </div>
                                                        </div>
                                                        <div class="header__cart-item--body">
                                                            <span class="header__cart-item--description">
                                                                color:${cartItem.product.color} | ram-storage:${cartItem.product.ram}-${cartItem.product.storage}
                                                            </span>
                                                            <span class="header__cart-item--remove"><a 
                                                                    href="MainController?action=RemoveCart&page=<%=resource%>&productID=${cartItem.product.productID.trim()}&color=${cartItem.product.color.trim()}&ram=${cartItem.product.ram.trim()}&storage=${cartItem.product.storage.trim()}"
                                                            style="color:black;text-align: right;
                                                            padding:0;height: 20px;">Remove</a></span>
                                                        </div>
                                                    </div>
                                                                    
                                                </li>
                                            </c:forEach> 
                                        </ul>
                                        <a class="header__cart-view-cart btn btn__primary" href="MainController?action=ViewCart" style="background-color: #DDDDDD;color:black">View detail</a>
                                    </div> 
                                </c:otherwise>  
                        </c:choose>
                        </div>
                    </div>
                    
    
                </div>
            </div>
            <div class="container__user-profile">
                <div class="frame__user-profile">
                    <h2 class="tittle__user-profile">User profile</h2>
                    <c:if test="${requestScope.UpSuccess !=null}"><span class="notify-update"><i class="fas fa-check-circle"></i>
                            ${requestScope.UpSuccess}</span></c:if>

                    <form class="form__user-profile" action="MainController" >

                    <form class="form__user-profile" action="MainController" method="post" accept-charset="UTF-8">

                        <div class="user-infor full-name">
                            <span class="user-infor__tittle full-name__tittle">Full name</span>
                            <input type="text" class="input__user-profile full-name__input" name="name" value="${sessionScope.user.name}" readonly>
                        </div>
                        <div class="user-infor email">
                            <span class="user-infor__tittle email__tittle">Email</span>
                            <input type="text" class="input__user-profile email__input" name="email" value="${sessionScope.user.email}" readonly>
                        </div>
                        <div class="user-infor phonenumber">
                            <span class="user-infor__tittle phonenumber__tittle">Phonenumber</span>
                            <input type="text" class="input__user-profile phonenumber__input" name="phone" value="${sessionScope.user.phone}" >
                        </div>
                        <div class="user-infor address">
                            <span class="user-infor__tittle adress__tittle">Address</span>
                            <input type="text" class="input__user-profile address__input" name="address" value="${sessionScope.user.address}">
                        </div>
                            <input type="hidden"  name="userID" value="${sessionScope.user.userID}" >
                            <input type="hidden"  name="action" value="UpdateProfile" >
                        <button class="button-update"><a class ="link-resPass" href="changePass.jsp">Change Password</a></button>
                        <button class="button-submit button-update" type="submit"  >Update Profile</button>
                       

                    </form>  
                        
                </div>
            </div>
                     
            <footer>
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
