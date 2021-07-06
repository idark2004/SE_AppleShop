<%-- 
    Document   : productList
    Created on : Jul 4, 2021, 9:24:17 PM
    Author     : anime
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>SE15 Shop | Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--Less styles -->
    <!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
    <!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->

    <!-- Bootstrap style -->
    <link id="callCss" rel="stylesheet" href="themes/bootshop/bootstrap.min.css" media="screen" />
    <link href="themes/css/base.css" rel="stylesheet" media="screen" />
    <!-- Bootstrap style responsive -->
    <link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
    <!-- Google-code-prettify -->
    <link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet" />
    <!-- fav and touch icons -->
    <link rel="shortcut icon" href="themes/images/ico/apple.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="themes/images/ico/apple.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="themes/images/ico/apple.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="themes/images/ico/apple.png">
    <link rel="apple-touch-icon-precomposed" href="themes/images/ico/apple.png">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
     <meta name="google-signin-scope" content="profile email">
     <meta name="google-signin-client_id" content="779792849031-s9k66dv106kav3h90o9lak0vnm2943ci.apps.googleusercontent.com">
    <style type="text/css" id="enject"></style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body onload="a();">
    <div id="header">
        <div class="container">
            <div id="welcomeLine" class="row">
                <div class="span6">Welcome!<strong> User</strong></div>
                <div class="span6">
                    <div class="pull-right">
                          <c:forEach var="cartItem" items="${sessionScope.cart}">
                                    <c:set var="subtotalCount" value="${cartItem.quantity}"/>
                                    <c:set var="subtotal" value="${subtotal+cartItem.quantity}"/>
                          </c:forEach>
                        <a href="product_summary.html"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> ${subtotal} Itemes in your cart </span> </a>
                    </div>
                </div>
            </div>
            <!-- Navbar ================================================== -->
            <div id="logoArea" class="navbar">
                <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-inner">
                    <a class="brand" href="index.html">SE15 Shop</a>
                    <form class="form-inline navbar-search" method="post" action="products.html">
                        <input id="srchFld" class="srchTxt" type="text" />
                        <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                    </form>
                    <ul id="topMenu" class="nav pull-right">
                        <li class=""><a href="Product.html">All Products</a></li>
                        <li class=""><a href="contact.html">Contact</a></li>
                        <li class=""><a href="contact.html">Profile</a></li>
                        <li class="">
                            <a href="register.html" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Signup</span></a>
                        </li>
                        <li class="">
                            <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>
                            <div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h3>Login In</h3>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal loginFrm">
                                        <div class="control-group">
                                            <input type="text" id="inputEmail" placeholder="Email">
                                        </div>
                                        <div class="control-group">
                                            <input type="password" id="inputPassword" placeholder="Password">
                                        </div>
                                        <div class="control-group">
                                            <label class="checkbox">
											<input type="checkbox"> Remember me
											</label>
                                            <a href="#"><img width="30" height="30" src="themes/images/google.png" title="Login with Google" alt="Google Login" /></a>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-success">Sign in</button>
                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End====================================================================== -->
    <div id="carouselBlk">
        <div id="myCarousel" class="carousel slide">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="container">
                        <a href="register.html"><img style="width:100%" src="themes/images/carousel/1.png" alt="" /></a>
                    </div>
                </div>
                <div class="item">
                    <div class="container">
                        <a href="register.html"><img style="width:100%" src="themes/images/carousel/2.png" alt="" /></a>
                    </div>
                </div>
                <div class="item">
                    <div class="container">
                        <a href="register.html"><img src="themes/images/carousel/3.png" alt="" /></a>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
        </div>
    </div>
    <div id="mainBody">
        <div class="container">
            <div class="row">
                <!-- Sidebar ================================================== -->
                <div id="sidebar" class="span3">
                    <div class="well well-small">
                        <c:forEach var="cartItem" items="${sessionScope.cart}">
                                    <c:set var="subtotalCount" value="${cartItem.quantity}"/>
                                    <c:set var="subtotal" value="${subtotal+cartItem.quantity}"/>
                                </c:forEach>
                         <c:set var="total" value="${total + (cartItem.quantity * cartItem.product.price)}"/>
                        <a id="myCart" href="product_summary.html"><img src="themes/images/ico-cart.png" alt="cart">${subtotal} Items in your cart <span class="badge badge-warning pull-right">${total}</span></a>
                    </div>
                    <ul id="sideManu" class="nav nav-tabs nav-stacked">
                        <li><a href="ViewProductController?categoryID=&status=True">All</a></li>
                        <li><a href="ViewProductController?categoryID=IP&status=True">iPhone</a></li>
                        <li><a href="ViewProductController?categoryID=ID&status=True">iPad</a></li>
                        <li><a href="ViewProductController?categoryID=MB&status=True">Mac</a></li>
                        <li><a href="ViewProductController?categoryID=AW&status=True">Apple Watch</a></li>
                        <li><a href="ViewProductController?categoryID=AS&status=True">Accessory</a></li>
                    </ul>
                    <br/>
                </div>
                <!-- Sidebar end=============================================== -->
                <div class="span9">
                    <ul class="breadcrumb">
                        <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
                        <li class="active">All Products</li>
                    </ul>
                    <h3> Products Name <small class="pull-right"> 40 products are available </small></h3>
                    <form class="form-horizontal span6">
                        <div class="control-group">
                            <label class="control-label alignL">Sort By </label>
                            <select id="sortList" onchange="sortList();">
                                <option disabled selected value> --Sort By-- </option>
                                <option>Product name A - Z</option>
                                <option>Product name Z - A</option>
                                <option>Price Highest first</option>
                                <option>Price Lowest first</option>
                          </select>
                        </div>
                    </form>

                    <div id="myTab" class="pull-right">
                        <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
                        <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
                    </div>
                    <br class="clr" />
                    <div class="tab-content">
                        <div class="tab-pane" id="listView">
                            <c:choose>
                                    <c:when test="${requestScope.PRODUCT_LIST != null}">
                                     <c:forEach var="product" items="${requestScope.PRODUCT_LIST}"> 
                            <div class="row">
                                <div class="span2">
                                    <img src="${product.image}" alt="" />
                                </div>
                                <div class="span4">
                                    <h3 class="product-name">${product.name}</h3>
                                    <hr class="soft" />
<!--                                    <h5>Available </h5>
                                    <p>
                                        Input content here, bitches!
                                    </p>-->
                                    <a class="btn btn-small pull-right" href="MainController?action=ProductDetail&productID=${product.productID}">View Details</a>
                                    <br class="clr" />
                                </div>
                                <div class="span3 alignR">
                                    <form class="form-horizontal qtyFrm">
                                        <h3><fmt:formatNumber type="number" maxFractionDigits = "0" value="${product.price}" /></h3>

                                        <a href="MainController?action=ProductDetail&productID=${product.productID}" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
                                        <a href="product_details.html" class="btn btn-large"><i class="icon-zoom-in"></i></a>

                                    </form>
                                </div>
                            </div>
                                    
                            <hr class="soft" />
                            </c:forEach>
                            </c:when>
                        <c:otherwise>
                            <h1>${requestScope.EMPTY_LIST.msg}</h1>
                        </c:otherwise>
                    </c:choose>                                                     
                        </div>
                        <div class="tab-pane  active" id="blockView">
                            <ul class="thumbnails" id="product-list">
                                <c:choose>
                                    <c:when test="${requestScope.PRODUCT_LIST != null}">
                                        <c:forEach var="product" items="${requestScope.PRODUCT_LIST}">    
                                            <li class="span3 product-item">
                                                <div class="thumbnail">
                                                    <a href="MainController?action=ProductDetail&productID=${product.productID}"><img src="${product.image}" alt="" /></a>
                                                    <div class="caption">
                                                        <h5 id="product-name" class="product-name">${product.name}d</h5>
                                                        <p class="product-price">
                                                            <fmt:formatNumber type="number" maxFractionDigits = "0" value="${product.price}" />
                                                        </p>
                                                        <h4 style="text-align:center">
                                                            <a class="btn" href="MainController?action=ProductDetail&productID=${product.productID}"> <i class="icon-zoom-in"></i></a> <a class="btn" href="MainController?action=ProductDetail&productID=${product.productID}">Add to <i class="icon-shopping-cart"></i></a>
                                                        </h4>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                    <h1>${requestScope.EMPTY_LIST.msg}</h1>
                                    </c:otherwise>
                                </c:choose>
                               
                               
                                
                            </ul>
                            <hr class="soft" />
                        </div>
                    </div>
                    <div class="pagination">
                        <ul>
                            <li><a <c:if test="${requestScope.curPage == 1 }">style="cursor:default;pointer-events: none; "</c:if>
                                    href="ViewProductController?pageNum=${requestScope.curPage - 1}&CategoryID=${requestScope.cateID}&status=True">&lsaquo;</a></li>
                                <c:forEach var="pageNum" begin="1" end="${requestScope.pages}">                           
                                <li 
                                    ><a <c:if test="${requestScope.curPage == pageNum}">style="color:red;"</c:if> href="ViewProductController?pageNum=${pageNum}&CategoryID=${requestScope.cateID}&status=True">${pageNum}</a></li>
                            </c:forEach>
                            <li><a <c:if test="${requestScope.curPage == requestScope.pages }">style="cursor:default;pointer-events: none; "</c:if>
                                    href="ViewProductController?pageNum=${requestScope.curPage + 1}&CategoryID=${requestScope.cateID}&status=True">&rsaquo;</a></li>
                        </ul>
                    </div>
                    <br class="clr" />
                </div>
            </div>
        </div>
    </div>
    <!-- MainBody End ============================= -->
    <!-- Footer ================================================================== -->
    <div id="footerSection">
        <div class="container">
            <div class="row">
                <div class="span3">
                    <h5>ACCOUNT</h5>
                    <a href="login.html">LOGIN</a>
                    <a href="login.html">PROFILE</a>
                    <a href="login.html">CART</a>
                    <a href="login.html">ORDER HISTORY</a>
                </div>
                <div class="span3">
                    <h5>INFORMATION</h5>
                    <a href="contact.html">CONTACT</a>
                    <a href="register.html">REGISTRATION</a>
                    <a href="legal_notice.html">LEGAL NOTICE</a>
                    <a href="tac.html">TERMS AND CONDITIONS</a>
                </div>
                <div id="socialMedia" class="span3 pull-right">
                    <h5>SOCIAL MEDIA </h5>
                    <a href="#"><img width="60" height="60" src="themes/images/facebook.png" title="facebook" alt="facebook" /></a>
                    <a href="#"><img width="60" height="60" src="themes/images/gmail.png" title="gmail" alt="gmail" /></a>
                    <a href="#"><img width="60" height="60" src="themes/images/youtube.png" title="youtube" alt="youtube" /></a>
                </div>
            </div>
        </div>
        <!-- Container End -->
    </div>
    <!-- Placed at the end of the document so the pages load faster ============================================= -->
    <script src="themes/js/jquery.js" type="text/javascript"></script>
    <script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="themes/js/google-code-prettify/prettify.js"></script>

    <script src="themes/js/bootshop.js"></script>
    <script src="themes/js/jquery.lightbox-0.5.js"></script>

    <!-- Themes switcher section ============================================================================================= -->
    <div id="secectionBox">
        <link rel="stylesheet" href="themes/switch/themeswitch.css" type="text/css" media="screen" />
        <script src="themes/switch/theamswitcher.js" type="text/javascript" charset="utf-8"></script>
        <div id="themeContainer">
            <div id="hideme" class="themeTitle">Style Selector</div>
            <div class="themeName">Oregional Skin</div>
            <div class="images style">
                <a href="themes/css/#" name="bootshop"><img src="themes/switch/images/clr/bootshop.png" alt="bootstrap business templates" class="active"></a>
                <a href="themes/css/#" name="businessltd"><img src="themes/switch/images/clr/businessltd.png" alt="bootstrap business templates" class="active"></a>
            </div>
            <div class="themeName">Bootswatch Skins (11)</div>
            <div class="images style">
                <a href="themes/css/#" name="amelia" title="Amelia"><img src="themes/switch/images/clr/amelia.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="spruce" title="Spruce"><img src="themes/switch/images/clr/spruce.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="superhero" title="Superhero"><img src="themes/switch/images/clr/superhero.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="cyborg"><img src="themes/switch/images/clr/cyborg.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="cerulean"><img src="themes/switch/images/clr/cerulean.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="journal"><img src="themes/switch/images/clr/journal.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="readable"><img src="themes/switch/images/clr/readable.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="simplex"><img src="themes/switch/images/clr/simplex.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="slate"><img src="themes/switch/images/clr/slate.png" alt="bootstrap business templates" class="active "></a>
                <a href="themes/css/#" name="spacelab"><img src="themes/switch/images/clr/spacelab.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="united"><img src="themes/switch/images/clr/united.png" alt="bootstrap business templates"></a>
                <p style="margin:0;line-height:normal;margin-left:-10px;display:none;"><small>Color scheme</small></p>
            </div>
            <div class="themeName">Background Patterns </div>
            <div class="images patterns">
                <a href="themes/css/#" name="pattern1"><img src="themes/switch/images/pattern/pattern1.png" alt="bootstrap business templates" class="active"></a>
                <a href="themes/css/#" name="pattern2"><img src="themes/switch/images/pattern/pattern2.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern3"><img src="themes/switch/images/pattern/pattern3.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern4"><img src="themes/switch/images/pattern/pattern4.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern5"><img src="themes/switch/images/pattern/pattern5.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern6"><img src="themes/switch/images/pattern/pattern6.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern7"><img src="themes/switch/images/pattern/pattern7.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern8"><img src="themes/switch/images/pattern/pattern8.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern9"><img src="themes/switch/images/pattern/pattern9.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern10"><img src="themes/switch/images/pattern/pattern10.png" alt="bootstrap business templates"></a>

                <a href="themes/css/#" name="pattern11"><img src="themes/switch/images/pattern/pattern11.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern12"><img src="themes/switch/images/pattern/pattern12.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern13"><img src="themes/switch/images/pattern/pattern13.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern14"><img src="themes/switch/images/pattern/pattern14.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern15"><img src="themes/switch/images/pattern/pattern15.png" alt="bootstrap business templates"></a>

                <a href="themes/css/#" name="pattern16"><img src="themes/switch/images/pattern/pattern16.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern17"><img src="themes/switch/images/pattern/pattern17.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern18"><img src="themes/switch/images/pattern/pattern18.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern19"><img src="themes/switch/images/pattern/pattern19.png" alt="bootstrap business templates"></a>
                <a href="themes/css/#" name="pattern20"><img src="themes/switch/images/pattern/pattern20.png" alt="bootstrap business templates"></a>

            </div>
        </div>
    </div>
    <span id="themesBtn"></span>
</body>
<script>

            $('#sortList').on('change', function() {
                var conceptName = $('#sortList').find(":selected").text();
                if(conceptName==="Product name A - Z") {
                    sortNameAcs();
                }else if(conceptName==="Product name Z - A"){
                    sortNameDes();
                }
                else if(conceptName==="Price Lowest first"){
                    sortPriceAcs();
                }
                else {
                    sortPriceDes();
                }
            });
      function sortPriceDes() {
    var list, i, switching,name, b, shouldSwitch,main1,main2;
    list = document.getElementById("product-list");
    switching = true;
    while (switching) {
      switching = false;
      b = list.getElementsByClassName("product-item");
       var num1,num2,price1,price2;
      for (i = 0; i < (b.length - 1); i++) {     
        shouldSwitch = false; 
        num1 = b[i].getElementsByClassName("product-price")[0].innerHTML;   
        num2 = b[i+1].getElementsByClassName("product-price")[0].innerHTML;
        price1 = num1.replaceAll(",","");
        price2 = num2.replaceAll(",","");
        main1 = parseInt(price1);
        main2 = parseInt(price2);
        if (main1<main2) {
         
          shouldSwitch = true;
          break;
        }
      }
    if (shouldSwitch) {
      b[i].parentNode.insertBefore(b[i + 1], b[i]);
      switching = true;
    }
  }
}          
    function sortPriceAcs() {
    var list, i, switching,name, b, shouldSwitch,main1,main2;
    list = document.getElementById("product-list");
    switching = true;
    while (switching) {
      switching = false;
      b = list.getElementsByClassName("product-item");
       var num1,num2,price1,price2;
      for (i = 0; i < (b.length - 1); i++) {     
        shouldSwitch = false; 
        num1 = b[i].getElementsByClassName("product-price")[0].innerHTML;   
        num2 = b[i+1].getElementsByClassName("product-price")[0].innerHTML;
        price1 = num1.replaceAll(",","");
        price2 = num2.replaceAll(",","");
        main1 = parseInt(price1);
        main2 = parseInt(price2);
        if (main1>main2) {
         
          shouldSwitch = true;
          break;
        }
      }
    if (shouldSwitch) {
      b[i].parentNode.insertBefore(b[i + 1], b[i]);
      switching = true;
    }
  }
}                
    function sortNameAcs() {
    var list, i, switching,name, b, shouldSwitch;
    list = document.getElementById("product-list");
    switching = true;
    while (switching) {
      switching = false;
      b = list.getElementsByClassName("product-item");
      for (i = 0; i < (b.length - 1); i++) {
        shouldSwitch = false;
        if (b[i].getElementsByClassName("product-name")[0].innerHTML.toLowerCase() > b[i + 1].getElementsByClassName("product-name")[0].innerHTML.toLowerCase()) 
        {
          shouldSwitch = true;
          break;
        }
      }
    if (shouldSwitch) {
      b[i].parentNode.insertBefore(b[i + 1], b[i]);
      switching = true;
    }
  }
}        
            
      function sortNameDes() {
    var list, i, switching,name, b, shouldSwitch;
    list = document.getElementById("product-list");
    switching = true;
    while (switching) {
      switching = false;
      b = list.getElementsByClassName("product-item");
      for (i = 0; i < (b.length - 1); i++) {
        shouldSwitch = false;
        if (b[i].getElementsByClassName("product-name")[0].innerHTML.toLowerCase() < b[i + 1].getElementsByClassName("product-name")[0].innerHTML.toLowerCase()) {
          shouldSwitch = true;
          break;
        }
      }
    if (shouldSwitch) {
      b[i].parentNode.insertBefore(b[i + 1], b[i]);
      switching = true;
    }
  }
}     
</script>
</html>
