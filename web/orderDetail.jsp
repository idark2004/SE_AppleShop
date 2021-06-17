<%-- 
    Document   : orderDetail
    Created on : Jun 10, 2021, 7:30:34 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OrderDetail</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/mainP.css">
        <link rel="stylesheet" href="css/mainHoang.css">
        <link rel="stylesheet" href="css/orderDetail.css"> 
        <link rel="stylesheet" href="bootstrap-5.0.1-dist/css/bootstrap.css">
    </head>
    <body>
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
                    <c:if test="${sessionScope.user != null }">
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
                    <a class="product-link" href="" class="header-nav__item-active">Dashboard</a>
                    <a class="product-link" href="">Add a product</a>
                    <a class="product-link" href="">OrderList</a>
                </div>
              </div>
        </div>       
            <div class="order-infor__body">
                <div class="order-infor__container container">
                    <h2 class="order-infor__header">Order ${requestScope.order.orderID}</h2>
                    <div class="row">
                        <div class="col-6 order-infor__left">
                            <h4 class="order-infor__left-header">Order Information</h4>

                            <span class="order-infor__left-label">OrderDate:</span>
                            <p class="order-infor__left-detail">${requestScope.order.orderDate}</p>
                            <span class="order-infor__left-label">Order status:</span>
                            <p class="order-infor__left-detail">${requestScope.order.status}</p>
                            <span class="order-infor__left-label">Method:</span>
                            <p class="order-infor__left-detail">${requestScope.order.payMethod}</p>                          
                        </div>
                        <div class="col-6 order-infor__right">
                            <h4 class="order-infor__right-header">Customer Information</h4>
                            <span class="order-infor__right-label">Customer Name:</span>
                            <p class="order-infor__right-detail">${requestScope.order.cusName}</p>
                            <span class="order-infor__right-label">Email:</span>
                            <p class="order-infor__right-detail">${requestScope.order.email}</p>
                            <span class="order-infor__right-label">Phonenumber:</span>
                            <p class="order-infor__right-detail"> ${requestScope.order.phone}</p>
                        </div>
                    </div>
                </div>
                    <div class="bill-detail">
                        <h2 class="bill-detail__header">Ordered item</h2>
                        <table class="table table-responsive bill-detail__table " 
                        style="width: 96%;">
                            <thead class="table-secondary">
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">color</th>
                                <th scope="col">hardware</th>
                                <th scope="col">qty</th>
                                <th scope="col">Row total</th>
                            </tr>
                            </thead>
                            <tbody class="table-body">
                                <c:choose>
                                <c:when test="${requestScope.detail != null}">
                                    <c:forEach var="detail" items="${requestScope.detail}">
                                    <tr>
                                        <th scope="row">${detail.product.name}</th>
                                        <td>${detail.product.color}</td>
                                        <td>${detail.product.ram}-${detail.product.storage}</td>
                                        <td>${detail.quantity}</td>
                                        <td><fmt:formatNumber type="number" maxFractionDigits = "0" value="${detail.product.price * detail.quantity}"/></td>
                                    </tr>
                                    </c:forEach>
                                </c:when>
                                    <c:otherwise>
                                        <h1>${requestScope.EMPTY_LIST}</h1>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
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
    </body>
