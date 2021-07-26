<%-- 
    Document   : termsAndConditions
    Created on : Jul 22, 2021, 1:40:01 PM
    Author     : anime
--%>

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>SE15 Shop | Homepage</title>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
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

    <body >
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
                            <a href="cartDetail.jsp"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> ${subtotal} Items in your cart </span> </a>
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
                        <a class="brand" href="MainController?action=Product&perform=Index">SE15 Shop</a>
                        <form class="form-inline navbar-search" method="post" action="MainController">
                            <input id="srchFld" class="srchTxt" type="text" name="keyWord"/>
                            <input type="hidden" value="SearchProduct" name="action"/>
                            <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                        </form>
                        <ul id="topMenu" class="nav pull-right">
                            <li class=""><a href="MainController?action=Product&perform=ViewProduct&categoryID=">All Products</a></li>
                            <li class=""><a href="contact.jsp">Contact</a></li>
                                <c:if test="${sessionScope.USER != null}">
                                <li class=""><a href="userProfile.jsp">Profile</a></li>
                                </c:if>
                                <c:choose>
                                <c:when test="${sessionScope.USER == null}">
                                    <li class="">
                                        <a href="signupForm.jsp" role="button" style="padding-right:0"><span class="btn btn-large btn-success">Signup</span></a>
                                    </li>
                                    <li class="">
                                        <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>
                                        <div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3>Log In</h3>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal loginFrm" action="MainController" method="post">
                                                    <div class="control-group">
                                                        <input type="text" id="inputEmail" placeholder="Enter Email" name="email" required>
                                                    </div>
                                                    <div class="control-group">
                                                        <input type="password" id="inputPassword" placeholder="Enter Password" name="password" required>
                                                    </div>
                                                    <div class="control-group">
                                                        <input type="hidden" name="perform" value="Log in">
                                                        <button type="submit" class="btn btn-success" name="action" value="User">Sign in</button>
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                                        <a href="forgetPass.jsp">Forget password?</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="">
                                        <a href="MainController?action=User&perform=Log+Out" role="button" style="padding-right:0"><span class="btn btn-large btn-success">Log Out</span></a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
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
                            <a href="signupForm.jsp"><img style="width:100%" src="themes/images/carousel/1.png" alt="" /></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <a href="signupForm.jsp"><img style="width:100%" src="themes/images/carousel/2.png" alt="" /></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="container">
                            <a href="signupForm.jsp"><img src="themes/images/carousel/3.png" alt="" /></a>
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
                            <a id="myCart" href="cartDetail.jsp"><img src="themes/images/ico-cart.png" alt="cart">${subtotal} 
                                <c:if test="${sessionScope.cart == null}">No</c:if> 
                                    Items in your cart
                                <c:if test="${sessionScope.cart != null}">
                                    <span class="badge badge-warning pull-right"> 
                                        <fmt:setLocale value="vi_VN" />
                                        <fmt:formatNumber value="${total}" type="currency" />
                                    </span>
                                </c:if>
                            </a>
                    </div>
                    <ul id="sideManu" class="nav nav-tabs nav-stacked">
                        <li class="subMenu"><a>Product</a>  
                         <ul style="display: none">
                        <li><a href="MainController?action=Product&perform=ViewProduct&categoryID=">All</a></li>
                        <li><a href="MainController?action=Product&perform=ViewProduct&categoryID=IP&status=True">iPhone</a></li>
                        <li><a href="MainController?action=Product&perform=ViewProduct&categoryID=ID&status=True">iPad</a></li>
                        <li><a href="MainController?action=Product&perform=ViewProduct&categoryID=MB&status=True">Mac</a></li>
                        <li><a href="MainController?action=Product&perform=ViewProduct&categoryID=AW&status=True">Apple Watch</a></li>
                        <li><a href="MainController?action=Product&perform=ViewProduct&categoryID=AS&status=True">Accessory</a></li>                          
                         </ul>
                         </li>  
                            <c:if test="${sessionScope.USER.roleID.trim() != null}" > 
                                <c:if test="${sessionScope.USER.roleID.trim() != 'US'}" >
                                <li class="subMenu"><a>Manager Product</a>
                                    <ul style="display: none">
                                        <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=">All</a></li>
                                        <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=IP">iPhone</a></li>
                                        <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=ID">iPad</a></li>
                                        <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=MB">Mac</a></li>
                                        <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=AW">Apple Watch</a></li>
                                        <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=AS">Accessory</a></li>
                                    </ul>
                                </li>
                                <li class="subMenu" id="CU"><a>Shop Manager</a>
                                    <ul style="display:none">
                                        <li><a href="DashBoardController"><i class="icon-chevron-right"></i>Dashboard</a></li>
                                        <li><a href="managerAddProduct.jsp"><i class="icon-chevron-right"></i>Add Product</a></li>
                                        <li><a href="MainController?action=Manage+User&perform=Get+User"><i class="icon-chevron-right"></i>User List</a></li>
                                        <c:if test="${sessionScope.USER.roleID.trim() == 'AD'}">
                                            <li><a href="MainController?action=Manage+User&perform=Get+Manager"><i class="icon-chevron-right"></i>Manager List</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.USER.roleID.trim() == 'MN'}">
                                            <li><a href="MainController?action=Guarantee&perform=Get"><i class="icon-chevron-right"></i>Guarantee</a></li>
                                        </c:if>
                                        <li><a href="MainController?action=SaleCode&perform=List"><i class="icon-chevron-right"></i>Sale Code List</a></li>
                                        <li><a href="MainController?action=OrderList"><i class="icon-chevron-right"></i>Order List</a></li>

                                    </ul>
                                </li>
                            </c:if>                       
                        </c:if>
                    </ul>
                    <br/>
                </div>
                <!-- Sidebar end=============================================== -->
                <div class="span9">
                    <ul class="breadcrumb">
                        <li><a href="MainController?action=Product&perform=Index">Home</a> <span class="divider">/</span></li>
                        <li class="active">Terms and Conditions</li>
                    </ul>
                    <h3> Terms and Conditions</h3>
                    <hr class="soft" />
                    <h5>In-Store Consumer Returns Policy</h5><br/>
                    <p>
                        Any item may be returned for refund or exchange within 30 days of purchase providing that the product has not been opened or used.
                    </p>
                    <p>
                        Apple products purchased from SE15 Shop that are faulty within 30 days of purchase may be returned to store for replacement or refund.
                    </p>
                    <p>
                        All Apple products are covered under a one year warranty unless AppleCare Protection Plan is applied to certain items. SE15 can support all warranty issues on your Apple products.
                    </p>
                    <p>
                        Faulty non Apple hardware and accessories may be returned up to 12 months after the purchase date. These items will be repaired or replaced.
                    </p>
                    <p>
                        Manufacturers warranties are not covered in store once the item is over 12 months old.
                    </p>
                    <p>
                        A valid proof of purchase is required for all returns.
                    </p>
                    <p>
                        Software cannot be returned once opened or downloaded.
                    </p>
                    <p>
                        This does not affect your statutory rights.
                    </p>

                    <br><br>
                    <h5>Online Store Terms and Conditions</h5><br/>
                    <p>
                        To place an order for products at the online store, simply add the products you wish to your shopping basket and check out by selecting either Click & Collect or Delivery. You can choose option for us to deliver the products, or for you to collect them
                        from store. After we have received and processed your order, we’ll send you an order detail email, and we will call you through your phone number to ensure authenticity.
                    </p>
                    <p>
                        All Mac, iPad, iPhone, iPod, Apple TV come with 2 year guarantee. Please see more here. Any purchase made with a sale code on the online store is provided with the standard Apple 1-year warranty.
                    </p>
                    <p>
                        Products should be returned in the original packaging. Once your return has been approved, we will issue a refund directly to you for your original purchase within 14 days.
                    </p>
                    <p>
                        We offer free delivery on all orders. Please note that we do not deliver outside of Ho Chi Minh City. Please allow 2-24 hours for delivery. Please note all orders placed over bank holidays will be processed the next available working day. If you have
                        opted for home delivery, you will receive an Order Detail email from <span><strong>qbuigiatest123@gmail.com</strong></span> as soon as your products have been dispatched from our warehouse. This email will
                        contain a courier Tracking ID which you can use to find the status of your delivery. Please note that your order may arrive on separate deliveries. The estimated delivery times above will still apply. Occasionally something will
                        happen out of our control, such as floods, snow or other adverse weather conditions or things like, sporting events, which result in closed roads. We can’t be held liable if we can’t fulfil delivery due to reasons beyond our control.
                    </p>


                </div>
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
                    <c:if test="${sessionScope.USER == null}">                   
                        <a href="loginForm.jsp">LOGIN</a>
                        <a href="signupForm.jsp">REGISTRATION</a>
                        
                    </c:if>
                        <a href="cartDetail.jsp">CART</a>
                    <c:if test="${sessionScope.USER != null}">
                        <a href="userProfile.jsp">PROFILE</a>                    
                        <a href="order_history.jsp">ORDER HISTORY</a>
                    </c:if>
                </div>
                <div class="span3">
                    <h5>INFORMATION</h5>
                    <a href="contact.jsp">CONTACT</a>                    
                 <a href="legalNotice.jsp">LEGAL NOTICE</a>
                        <a href="termsAndConditions.jsp">TERMS AND CONDITIONS</a>
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

