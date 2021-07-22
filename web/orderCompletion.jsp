<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>SE15 Shop | Order Summary</title>
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
        <link href="themes/css/comment.css" rel="stylesheet" media="screen" />
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
        <link rel="stylesheet" href="themes/font-awesome-4.7.0/css/font-awesome.min.css">
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
                            <li class=""><a href="MainController?action=Product&perform=ViewProduct">All Products</a></li>
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
                                                        <label class="checkbox">
                                                            <input type="checkbox"> Remember me
                                                        </label>
                                                        <div class="g-signin2" data-onsuccess="onSignIn"></div>
                                                        <input type="hidden" name="perform" value="Log in">
                                                        <button type="submit" class="btn btn-success" name="action" value="User">Sign in</button>
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
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
                                        <li><a href="MainController?action=Guarantee&perform=Get"><i class="icon-chevron-right"></i>Guarantee</a></li>
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
                            <li><a href="MainController?action=Product&perform=ViewProduct">Products</a> <span class="divider">/</span></li>
                            <li class="active">Receipt</li>
                        </ul>
                        <div class="row">
                            <div class="span9">
                                <h3>Thank you for your order!</h3>
                                <hr class="soft" />
                                <form class="form-horizontal qtyFrm">
                                    <div class="">
                                        <c:set var="order" value="${requestScope.newOrder}" scope="page"></c:set>
                                            <p class="small">
                                                Thank you for choosing SE15 Shop. In 15 minutes, we will SMS or Call to confirm the order.
                                            </p>
                                            <p class="small">
                                                For the orders from <span><strong>21:30 pm to 8 am</strong></span> the next day, we will contact you before 10 pm on the same day.
                                            </p>
                                            <p class="small">
                                                If you need any assistance, please contact <span><strong>0914123456</strong></span>. Thank you very much!
                                            </p>
                                            <p class="small">
                                                <strong> We also send billing email to ${order.email}.</strong>
                                        </p>
                                    </div>

                                    <hr class="soft" />
                                    <h5> Order Details</h5>
                                    <div class="well span8">
                                        <form>
                                            <p class="small">
                                                Order ID: <span><strong>${order.orderID}</strong></span>
                                            </p>
                                            <p class="small">
                                                Fullname: <span><strong>${order.cusName}</strong></span>
                                            </p>
                                            <p class="small">
                                                Address: <span><strong>${order.address}</strong></span>
                                            </p>
                                            <p class="small">
                                                Phone: <span><strong>${order.email}</strong></span>
                                            </p>
                                            <br>
                                            <p class="small">
                                                Created: <span><strong>${order.orderCreateDate}</strong></span>
                                            </p>
                                            <p class="small">
                                                Expect Date: <span><strong>${order.orderExpectDate}</strong></span>
                                            </p>
                                            <p class="small">
                                                Payment method: <span><strong>${order.payMethod}</strong></span>
                                            </p>
                                        </form>
                                    </div>
                                </form>
                                <c:set var="percent" value="${requestScope.percent}" ></c:set>

                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Description</th>
                                            <th>Quantity/Update</th>
                                            <th>Price Per Product</th>
                                            <th>Discount</th>
                                            <th>Row Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${requestScope.detail != null}">
                                                <c:forEach var="detail" items="${requestScope.detail}">
                                                    <tr>
                                                        <td> <img width="60" src="${detail.product.image}" alt="" /></td>
                                                        <td>${detail.product.name}<br/>Color : ${detail.product.color}<br/>
                                                            Ram:${detail.product.ram}<br/>Storage:${detail.product.storage}</td>
                                                        <td style="text-align:right">
                                                            ${detail.quantity}
                                                        </td>
                                                        <td style="text-align:right"><fmt:formatNumber type="number" maxFractionDigits = "0" value="${detail.product.price}"/></td>
                                                        <td style="text-align:right"><fmt:formatNumber type="number" maxFractionDigits = "0" value="${percent*(detail.product.price * detail.quantity)}"/></td>
                                                        <td style="text-align:right"> <fmt:formatNumber type="number" maxFractionDigits = "0" value="${(detail.product.price * detail.quantity)-percent*(detail.product.price * detail.quantity)}"/></td>
                                                    </tr>
                                                    <c:set var="totalNotSaleCode" value="${totalNotSaleCode + ((detail.product.price * detail.quantity)) }" ></c:set>

                                                   <c:set var="totalSale" value="${totalSale + (percent * (detail.product.price * detail.quantity))}" ></c:set>
                                                    <c:set var="total" value="${total + ((detail.product.price * detail.quantity) - percent*(detail.product.price * detail.quantity))}" ></c:set>

                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                            <h1>${requestScope.EMPTY_LIST}</h1>
                                        </c:otherwise>
                                    </c:choose>
                                    <tr>
                                        <td colspan="5" style="text-align:right" ><strong>TOTAL ( <fmt:formatNumber type="number" maxFractionDigits = "0" value="${totalNotSaleCode}"/> - <fmt:formatNumber type="number" maxFractionDigits = "0" value="${totalSale}"/> ) =</strong></td>
                                        <td class="label label-important" style="display:block; text-align:right"> <strong> <fmt:formatNumber type="number" maxFractionDigits = "0" value="${total}"/></strong></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <a href="MainController?action=Product&perform=Index" class="btn btn-large pull-right">Homepage <i class="icon-arrow-right"></i></a>
                            </div>
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
