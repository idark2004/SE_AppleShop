<%-- 
    Document   : product_summary
    Created on : Jul 5, 2021, 2:52:05 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>SE15 Shop | Product Cart</title>
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
        <style type="text/css" id="enject"></style>
    </head>

    <body>
        <div id="header">
            <div class="container">
                <div id="welcomeLine" class="row">
                    <div class="span6">Welcome!
                        <c:choose>
                            <c:when test="${sessionScope.USER != null}">
                                <strong>${USER.name}</strong>
                            </c:when>
                            <c:otherwise>
                                <strong> User</strong>
                            </c:otherwise>
                        </c:choose></div>
                    <div class="span6">
                        <div class="pull-right">
                            <c:forEach var="cartItem" items="${sessionScope.cart}">
                                <c:set var="subtotalCount" value="${cartItem.quantity}"/>
                                <c:set var="subtotal" value="${subtotal+cartItem.quantity}"/>
                            </c:forEach>
                            <a href="cartDetail.jsp"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> ${subtotal} Itemes in your cart </span> </a>
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
                        <a class="brand" href="index.jsp">SE15 Shop</a>
                        <form class="form-inline navbar-search" method="post" action="MainController">
                        <input id="srchFld" class="srchTxt" type="text" name="keyWord"/>
                        <input type="hidden" value="SearchProduct" name="action"/>
                        <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                    </form>
                        <ul id="topMenu" class="nav pull-right">
                            <li class=""><a href="MainController?action=Product&perform=ViewProduct">All Products</a></li>
                            <li class=""><a href="contact.jsp">Contact</a></li>
                            <li class=""><a href="userProfile.jsp">Profile</a></li>
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
                                        <form class="form-horizontal loginFrm" action="MainController" method="post">
                                            <div class="control-group">
                                                <input type="text" id="inputEmail" placeholder="Enter Email" name="uname" required>
                                            </div>
                                            <div class="control-group">
                                                <input type="password" id="inputPassword" placeholder="Enter Password" name="psw" required>
                                            </div>
                                            <div class="control-group">
                                                <label class="checkbox">
                                                    <input type="checkbox"> Remember me
                                                </label>
                                                <div class="g-signin2" data-onsuccess="onSignIn"></div>
                                                <button type="submit" class="btn btn-success" name="action" value="Login">Sign in</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                            </div>
                                        </form>
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
                                <c:set var="total" value="${total + (cartItem.quantity * cartItem.product.price)}"/>
                            </c:forEach>
                            <a id="myCart" href="cartDetail.jsp"><img src="themes/images/ico-cart.png" alt="cart">${subtotal} Items in your cart <span class="badge badge-warning pull-right"> 
                                    <fmt:setLocale value="vi_VN" />
                                    <fmt:formatNumber value="${total}" type="currency" /></span>
                            </a>
                        </div>
                        <ul id="sideManu" class="nav nav-tabs nav-stacked">
                            <li><a href="MainController?action=Product&perform=ViewProduct">All</a></li>
                            <li><a href="MainController?action=Product&perform=ViewProduct&categoryID=IP&status=True">iPhone</a></li>
                            <li><a href="MainController?action=Product&perform=ViewProduct&categoryID=ID&status=True">iPad</a></li>
                            <li><a href="MainController?action=Product&perform=ViewProduct&categoryID=MB&status=True">Mac</a></li>
                            <li><a href="MainController?action=Product&perform=ViewProduct&categoryID=AW&status=True">Apple Watch</a></li>
                            <li><a href="MainController?action=Product&perform=ViewProduct&categoryID=AS&status=True">Accessory</a></li>
                        </ul>
                        <br/>
                    </div>
                    <!-- Sidebar end=============================================== -->
                    <div class="span9">
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
                            <li class="active"> SHOPPING CART</li>
                        </ul>
                        <h3> SHOPPING CART [ <small>${subtotal} Item(s) </small>]<a href="ViewProductController?categoryID=&status=True" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> Continue Shopping </a></h3>
                        <hr class="soft" />
                        <table class="table table-bordered">
                            <tr>
                                <th> I AM ALREADY REGISTERED </th>
                            </tr>
                            <tr>
                                <td>
                                    <form class="form-horizontal">
                                        <div class="control-group">
                                            <label class="control-label" for="inputUsername">Username</label>
                                            <div class="controls">
                                                <input type="text" id="inputUsername" placeholder="Username">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="inputPassword1">Password</label>
                                            <div class="controls">
                                                <input type="password" id="inputPassword1" placeholder="Password">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <div class="controls">
                                                <button type="submit" class="btn">Sign in</button> OR <a href="register.html" class="btn">Register Now!</a>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <div class="controls">
                                                <a href="forgetpass.html" style="text-decoration:underline">Forgot password ?</a>
                                            </div>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        </table>

                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Description</th>
                                    <th>Quantity/Update</th>
                                    <th>Price</th>
                                    <th>Discount</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="total" value="0"/>
                                <c:choose>
                                    <c:when test="${sessionScope.cart != null}">
                                        <c:forEach var="cartItem" items="${sessionScope.cart}">
                                            <tr>
                                                <td> <img width="60" src="${cartItem.product.image}" alt="Item" /></td>
                                                <td>${cartItem.product.name}<br/>Color : black</td>
                                                <td>
                                                    <div class="input-append"><input class="span1" style="max-width:34px" id="appendedInputButtons" size="16" type="text" value="${cartItem.quantity}">
                                                        <button class="btn" type="button"><i class="icon-minus"></i></button>
                                                        <button class="btn" type="button"><i class="icon-plus"></i></button>
                                                        <button class="btn btn-danger" type="button">
                                                            <a class="remove" href="MainController?action=RemoveCart&specID=${cartItem.product.specID.trim()}">
                                                                <i class="icon-remove icon-white"></i>
                                                            </a>
                                                        </button>
                                                    </div>
                                                </td>
                                                <td><fmt:formatNumber type="number" maxFractionDigits = "0" value="${cartItem.quantity * cartItem.product.price}"/> VND</td>
                                                <td>
                                                    0
                                                </td>
                                                <td><fmt:formatNumber type="number" maxFractionDigits = "0" value="${cartItem.quantity * cartItem.product.price}"/> VND</td>
                                                <c:set var="total" value="${total + (cartItem.quantity * cartItem.product.price)}"/>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                    <h1>no item in the cart</h1>
                                </c:otherwise>
                            </c:choose>
                            <tr>
                                <td colspan="5" style="text-align:right">Total Price: </td>
                                <td> <fmt:formatNumber type="number" maxFractionDigits = "0" value="${total}"/> VND</td>
                            </tr>
                            <tr>
                                <td colspan="5" style="text-align:right">Total Discount: </td>
                                <td> discount money VND</td>
                            </tr>
                            <tr>
                                <td colspan="5" style="text-align:right"><strong>TOTAL (<fmt:formatNumber type="number" maxFractionDigits = "0" value="${total}"/> VND - discount money VND) =</strong></td>
                                <td class="label label-important" style="display:block"> <strong><fmt:formatNumber type="number" maxFractionDigits = "0" value="${total}"/> VND</strong></td>
                            </tr>
                            </tbody>
                        </table>


                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td>
                                        <form class="form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label"><strong> SALE CODE: </strong> </label>
                                                <div class="controls">
                                                    <input type="text" class="input-medium" placeholder="CODE">
                                                    <button type="submit" class="btn"> ADD </button>
                                                </div>
                                            </div>
                                        </form>
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                        <table class="table table-bordered">
                            <tr>
                                <th>SHIPPING ADDRESS</th>
                            </tr>
                            <tr>
                                <td>
                                    <form action="MainController" class="form-horizontal">
                                        <div class="control-group">
                                            <label class="control-label" for="cusName">Your Name </label>
                                            <div class="controls">
                                                <input type="text" id="cusName" name="cusName" placeholder="Nguyễn Văn A">                                            
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="inputAddress">Your shipping address </label>
                                            <div class="controls">
                                                <input type="text" id="inputAddress" name="address" placeholder="123, A Street, District 2" required>                                            
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="phoneNumber">Phone Number </label>
                                            <div class="controls">
                                                <input type="text" id="phoneNumber" name="phone" placeholder="0123456789" required>                                            
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="email">Email </label>
                                            <div class="controls">
                                                <input type="email" id="email" name="email" placeholder="abc@abc.com">                                            
                                            </div>
                                        </div>

                                        <div class="control-group" style="margin-left: -10rem;">
                                            <div class="controls">
                                                <label class="radio">
                                                    <input type="radio" name="payMethod" id="optionsRadios1" value="COD">
                                                    Pay after delivery (Using the billing address above as shipping address)
                                                    <br/>
                                                    <input type="radio" name="payMethod" id="optionsRadios2" value="Direct" checked>
                                                    Pay at SE15 Shop
                                                </label>
                                            </div>
                                        </div>
                                        <input type="hidden" name="action" value="Cart"/>
                                        <input type="hidden" name="total" value="${total}"/>
                                        <button class="btn btn-large pull-right" type="submit" name="perform" value="Order Complete">Next <i class="icon-arrow-right"></i></button>
                                        <a href="MainController?action=Product&perform=ViewProduct" class="btn btn-large"><i class="icon-arrow-left"></i> Continue Shopping </a>                                        
                                    </form>
                                </td>
                            </tr>
                        </table>


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
                        <a href="loginForm.jsp">LOGIN</a>
                        <a href="userProfile.jsp">PROFILE</a>
                        <a href="product_summary.jsp">CART</a>
                        <a href="order_history.jsp">ORDER HISTORY</a>
                    </div>
                    <div class="span3">
                        <h5>INFORMATION</h5>
                        <a href="contact.jsp">CONTACT</a>
                        <a href="signupForm.jsp">REGISTRATION</a>
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

</html>
