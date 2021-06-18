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
        <link rel="stylesheet" href="css/carticon.css">
        <link rel="stylesheet" href="css/cartListIcon.css">
        <link rel="stylesheet" href="css/productDetailManagement.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
        <script>
        <% 
          String uri = request.getRequestURI();
          int lastIndex = uri.lastIndexOf("/");
          String resource = uri.substring(lastIndex + 1);
        %>
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
                    <div class="product-page">
                        <a class="product-link" href="ViewProductController?categoryID=&status=True" class="header-nav__item-active">All</a>
                        <a class="product-link" href="ViewProductController?categoryID=MB&status=True">Mac</a>
                        <a class="product-link" href="ViewProductController?categoryID=ID&status=True">iPad</a>
                        <a class="product-link" href="ViewProductController?categoryID=IP&status=True">iPhone</a>
                        <a class="product-link" href="ViewProductController?categoryID=AW&status=True">Apple Watch</a>
                        <a class="product-link" href="ViewProductController?categoryID=AS&status=True">Accessories</a>
                        <a class="product-link" href="MainController?action=ProductListManagement&categoryID=">Test Management</a>
                    </div>
                    <div class="responsive-div" style="display: flex; ">
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
                                    <span class="remove-btn"><a href="youtube.com" class="remove-link">Remove color</a></span>        
                                    <c:set var="i" value="${i + 1}" scope="page"/>
                                </div>
                                
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