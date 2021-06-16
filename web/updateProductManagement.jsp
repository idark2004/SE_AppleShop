<%-- 
    Document   : productDetailManagement
    Created on : Jun 3, 2021, 4:04:10 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        
        <title>SE15 Apple Shop</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/mainHoang.css">
        <link rel="stylesheet" href="css/productDetailManagement.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
        <script>
        var loadFile = function(event) {
                var image = document.getElementById('image');
                image.src = URL.createObjectURL(event.target.files[0]);
        };
        </script>
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
                    <c:if test="${requestScope.success != null }">
                    <li class="header_item header__navbar-user">
                            <span class="header_item_user-name">Hello,${requestScope.username}</span>
                            <ul class="header__navbar-user--menu">
                                <li class="header__navbar-user--item">
                                    <a href="">User detail</a>
                                </li>
                                <li class="header__navbar-user--item">
                                    <a href="">Order detail</a>
                                </li>
                                <li class="header__navbar-user--item">
                                    <a href="">Sign out</a>
                                </li>
                            </ul>
                    </li>
                    </c:if>
                    <c:if test="${requestScope.success == null }">
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
                <a href="MainController?action=ProductListManagement&categoryID=" class="nav-item-active">All</a>
                <a href="MainController?action=ProductListManagement&categoryID=MC">Mac</a>
                <a href="MainController?action=ProductListManagement&categoryID=ID">iPad</a>
                <a href="MainController?action=ProductListManagement&categoryID=IP">iPhone</a>
                <a href="MainController?action=ProductListManagement&categoryID=AW">Apple Watch</a>
                <a href="MainController?action=ProductListManagement&categoryID=AS">Accessories</a>
    
                <div class="cart">
                    <a href=""><i class="carft-icon fas fa-shopping-cart"></i></a>
                </div>
    
                <div class="search-container">
                    <form action="">
                        <input type="text" placeholder="Search.." name="search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
    
    
            </div>
        </div>

        <div class="container__product-detail">
            <div class="frame__product-detail">
                <h2 class="tittle__product-detail">Product Update</h2>
                <form class="form__product-detail" action="MainController" method="post" enctype="multipart/form-data">
                    <div class="user-info-left">
                        <img class="product__img" for="imageFile" id="image" src="${requestScope.product.image}" alt="${requestScope.product.name}">
                        <input class="file-input" name="Photo" onchange="loadFile(event)" type="file">
                    </div>
                    <div class="user-info__right">
                        <div class="product-infor product-id">
                            <span class="product-detail__tittle product-name__tittle">Product id</span>
                            <input type="text" class="input__product-detail full-name__input" name="productID" value="${requestScope.product.productID}" readonly>
                        </div>
                        
                        <div class="product-infor product-name">
                            <span class="product-detail__tittle product-name__tittle">Product Name</span>
                            <input type="text" class="input__product-detail full-name__input" name="name" value="${requestScope.product.name}" >
                        </div>
                        
                        <div class="product-infor product-quantity">
                            <span class="product-detail__tittle total-quantity__tittle">Total Quantity</span>
                            <input type="number" class="input__product-detail address__input" name="totalQuantity" value="${requestScope.product.totalQuantity}" >
                        </div>
                        
                        <div class="color-list"><p>Color:</p>
                            <div class="color-option__container">
                                            
                                <c:set var="i" value="1" scope="page"/>
                                <c:forEach var="color" items="${requestScope.color}">
                                <div class="option-color">
                                    <c:if test = "${color.color == requestScope.colorChosen}">
                                        <input onClick="window.location = 'MainController?action=UpdateProductManagement&productID=${product.productID.trim()}&color=${color.color}';" type="radio" class="input__radio-color" id="color-${i}" name="color" value="${color.color}" checked required>
                                    </c:if>
                                    <c:if test = "${color.color != requestScope.colorChosen}">
                                        <input onClick="window.location = 'MainController?action=UpdateProductManagement&productID=${product.productID.trim()}&color=${color.color}';" type="radio" class="input__radio-color" id="color-${i}" name="color" value="${color.color}" required>
                                    </c:if>
                                  
                                    <label class="label-color" for="color-${i}" >
                                        <span class="img-span" style="background-color: ${color.color}" >
                                            <i class="icon-check fas fa-check"></i>                                               
                                        </span>
                                    </label>
                                            
                                    <c:set var="i" value="${i + 1}" scope="page"/>
                                </div>
                                <span class="remove-btn"><a href="youtube.com" class="remove-link">Remove color</a></span>
                                </c:forEach>
                                
                            </div>                   
                            
                        </div>
                        <div class="hardware-list">
                            <p class="hardware-tittle">Hardware:</p>
                            <ul class="list-hardware-option">                      
                                <c:set var="i" value="1" scope="page"/>
                                    <c:forEach var="hardware" items="${requestScope.hardware}">
                                    <li class="hardware-item">
                                        <c:if test = "${hardware.specID.trim() == requestScope.specID}">
                                            <input class="input__radio-hardware" onClick="window.location = 'MainController?action=UpdateProductManagement&productID=${product.productID.trim()}&color=${requestScope.colorChosen}&specID=${hardware.specID.trim()}';" type="radio" name="hardware" id="hardware__option-${i}" value="${hardware.ram}-${hardware.storage}" checked required>
                                        </c:if>
                                        <c:if test = "${hardware.specID.trim() != requestScope.specID}">
                                            <input class="input__radio-hardware" onClick="window.location = 'MainController?action=UpdateProductManagement&productID=${product.productID.trim()}&color=${requestScope.colorChosen}&specID=${hardware.specID.trim()}';" type="radio" name="hardware" id="hardware__option-${i}" value="${hardware.ram}-${hardware.storage}" required>
                                        </c:if>
                                        <label class="hardware__lable" for="hardware__option-${i}">
                                            <span class="hardwar__span"><p>${hardware.ram}-${hardware.storage}
                                                    <br><strong><fmt:formatNumber type="number" maxFractionDigits = "0" value="${hardware.price}" /> VND</strong></p>
                                            </span>
                                        </label>
                                        <c:set var="i" value="${i + 1}" scope="page"/>
                                        <span class="remove-btn"><a href="youtube.com" class="remove-link">Remove option</a></span>
                                    </li>
                                    </c:forEach>
                                            
                            </ul>
                        </div>
                        <c:if test="${requestScope.spec!=null}">
                        <div class="product-infor product-price">
                            <span class="product-detail__tittle price__tittle">Price</span>
                            <input type="text" class="input__product-detail email__input" name="price" value="<fmt:formatNumber type="number" maxFractionDigits = "0" value="${spec.price}" />"  >
                        </div>
                        
                        <div class="product-infor product-quantity">
                            <span class="product-detail__tittle total-quantity__tittle">Spec Quantity</span>
                            <input type="text" class="input__product-detail address__input" name="quantity" value="${requestScope.spec.totalQuantity}" >
                        </div>
                            <input type="hidden" name="specID" value="${requestScope.spec.specID}" >
                        </c:if>
                        <input class="button-update" type="submit" name="action" value="Update Product Detail">
                    </div>
                    
                </form>  
               
            </div>
            <div class="spec-frame">
                <h4 class="spec-tittle">Create new Spec</h4>
                <form action="MainController" method="post" class="spec-form">
                    <input type="hidden" name="productID" value="${requestScope.product.productID}">
                    <div class="spec-infor spec-id">
                        <span class="spec-detail__tittle product-name__tittle">SpecID</span>
                        <input type="text" class="input__spec-detail full-name__input" name="newSpecID" value="" >
                    </div>
                    <div class="spec-infor color">
                        <span class="spec-detail__tittle price__tittle">New Color</span>
                        <input type="text" class="input__spec-detail email__input" name="newColor" value=""  >
                    </div>
                    <div class="spec-infor new-option">
                        <span class="spec-detail__tittle new-option__tittle">Ram</span>
                        <input type="text" class="input__spec-detail new-option__input" name="newRam" value="" >
                    </div>
                    <div class="spec-infor new-option">
                        <span class="spec-detail__tittle new-option__tittle">Storage</span>
                        <input type="text" class="input__spec-detail new-option__input" name="newStorage" value="" >
                    </div>
                    <div class="spec-infor price">
                        <span class="spec-detail__tittle price__tittle">Price</span>
                        <input type="text" class="input__spec-detail email__input" name="newPrice" value=""  >
                    </div>
                    <div class="spec-infor quantity">
                        <span class="spec-detail__tittle total-quantity__tittle">Quantity</span>
                        <input type="text" class="input__spec-detail address__input" name="newQuantity" value="" >
                    </div>
                    <input type="submit" name="action" value="Create new option" class="submit-option">
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