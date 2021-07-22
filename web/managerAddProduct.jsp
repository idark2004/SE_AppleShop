<%-- 
    Document   : ManagerAddProduct
    Created on : Jul 10, 2021, 10:25:50 PM
    Author     : anime
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>SE15 Shop | Product Editor</title>
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
                    <a class="brand" href="MainController?action=Product&perform=Index">SE15 Shop</a>
                    <form class="form-inline navbar-search" method="post" action="MainController">
                        <input id="srchFld" class="srchTxt" type="text" name="keyWord"/>
                        <input type="hidden" value="SearchProduct" name="action"/>
                        <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                    </form>
                    <ul id="topMenu" class="nav pull-right">
                        <li class=""><a href="products_Manager.html">All Products</a></li>
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
                        <a href="register.jsp"><img style="width:100%" src="themes/images/carousel/1.png" alt="" /></a>
                    </div>
                </div>
                <div class="item">
                    <div class="container">
                        <a href="register.jsp"><img style="width:100%" src="themes/images/carousel/2.png" alt="" /></a>
                    </div>
                </div>
                <div class="item">
                    <div class="container">
                        <a href="register.jsp"><img src="themes/images/carousel/3.png" alt="" /></a>
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
                        <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=">Products</a> <span class="divider">/</span></li>
                        <li class="active">iPhone 12 Pro Max</li>
                    </ul>
                    <div class="row">
                        <div id="gallery" class="span3">
                           
                                <img src="themes/images/products/detail/1.jpg" style="width:100%" alt="iPhone 12 Pro Max" />
                                <input form="addProduct" name="img" class="file-input" type="file" accept="image/*"required="">
                            
                        </div>
                        <div class="span6">
                                <div class="">
                                    <h5>Add product</h5>
                                    <br>
                                    <form id="addProduct" method="post" enctype="multipart/form-data" action="MainController">
                                        <div class="control-group">
                                            <label class="control-label" for="">Product Name</label>
                                            <div class="controls">
                                                <input class="span3" type="text" name="pname" id="inputProductName" placeholder="Product Name" maxlength="30">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="">CategoryID</label>
                                            <div class="controls">
                                                <input class="span3" type="text" name="cateID" id="inputPrice" placeholder="CategoryID" maxlength="11">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="">Quantity</label>
                                            <div class="controls">
                                                <input class="span3" type="number" name="quantity" id="inputPrice" placeholder="Quantity">
                                            </div>
                                        </div>
                                        <div class="controls">
                                            <input type="hidden" value="Product" name="action" >
                                            <input class="btn btn-primary btn-success"  type="submit" >
                                        </div>
                                   
                                    <hr class="soft" />
                                    
                                    <h5>Create new spec</h5>
                                    <br>
                                    
                                        
                                        <div class="control-group">
                                            <label class="control-label" for="">New Color</label>
                                            <div class="controls">
                                                <input class="span3" name="newColor" type="text" id="" placeholder="New Color">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="">RAM</label>
                                            <div class="controls">
                                                <input class="span3" name="newRam" type="text" id="" placeholder="Ram">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="">Storage</label>
                                            <div class="controls">
                                                <input class="span3" name="newStorage" type="text" id="" placeholder="Storage">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="">Price</label>
                                            <div class="controls">
                                                <input class="span3"name="newPrice" type="text" id="inputPrice" placeholder="Price" maxlength="11">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="">Quantity</label>
                                            <div class="controls">
                                                <input class="span3" name="newQuantity" type="number" id="inputPrice" placeholder="Quantity">
                                            </div>
                                        </div>
                                    <input type="hidden" name="perform" value="addProduct">   
                                    </form>
                                    <hr class="soft" />
                                </div>

                            

                        </div>

                        <div class="span9">
                            <ul id="productDetail" class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
                                <li><a href="#profile" data-toggle="tab">Comment</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane fade active in" id="home">
                                    <h4>Product Information</h4>
                                    <div class="control-group">
                                        <label class="control-label" for="textarea">Description</label>
                                        <div class="controls">
                                            <textarea form="addProduct" name="des" class="input-xlarge" id="textarea" rows="3" style="height:10rem; width:97%;" placeholder="Input description here."></textarea>
                                        </div>
                                    </div>
                                   
                                </div>
                                <div class="tab-pane fade" id="profile">

                                    <div class="container__review">
                                        <h3 class="review__tittle">Comment</h3>

                                        <div class="form-comment__container">
                                            <form action="MainController" class="form-review">
                                                <lable for="reviewer-name" class="name-lable">Full Name</lable>
                                                <input placeholder="Input your Name" type="text" id="reviewer-name" class="cName" name="reviewer-name">
                                                <lable for="pComment" class="comment-lable">Comment</lable>
                                                <textarea type="text" class="pComment" id="pComment" name="pComment" placeholder="Input detail your comment"></textarea>
                                                <input type="hidden" name="productID" value="${requestScope.product.productID}" />
                                                <input type="submit" name="action" class="btn btn-small" value="Submit comment">
                                            </form>
                                        </div>
                                        <div class="review-list">
                                            <div review-item__container>
                                                <div class="reivew-row">
                                                    <span class="review__reviewer-name">
                                                    Khach hang
                                                    </span>
                                                    <p class="review__reviewer-comment">
                                                        Cho mình hòi Galaxy A51 đã sử dụng hơn 1 năm, shop có xem xét áp dụng chương trình trợ giá đổi qua IP 12 bản 256GB không ạ? và có áp dụng thêm chương trình trả góp qua thẻ tín dụng của HSBC không ạ? và kì hạn hỗ trợ tối đa là bao nhiêu? mình cảm ơn shope.
                                                    </p>
                                                </div>
                                                <ul class="review-option">
                                                    <form method="POST" class="reply-form d-none" id="comment-1-reply-form">
                                                        <textarea class="input-reply" placeholder="Reply to comment" rows="4"></textarea>
                                                        <button class="reply-submit" type="submit">Submit</button>
                                                        <button type="button" onclick="closeForm(this)">Cancel</button>
                                                    </form>
                                                </ul>


                                                <div id="reply-1" class="reply-item__container">

                                                    <div class="reivew-row">
                                                        <span class="fas fa-share review__reviewer-name">
                                                        Customer
                                                        </span>

                                                        <p class="review__reviewer-comment">
                                                            Shop xin chào anh Galaxy A51 hiện chưa được áp dụng cái kiểu chương trình này ạ.
                                                        </p>
                                                    </div>

                                                </div>
                                            </div>
                                            <hr class="soft" />
                                            <div review-item__container>
                                                <li class="reivew-row">
                                                    <span class="review__reviewer-name">
                                                    Thang anh 69
                                                    </span>
                                                    <p class="review__reviewer-comment">
                                                        Ngành IT Việt Nam hiện nay ở đầu của sự phát triển. Có thể nói IT là vua của các nghề. Vừa có tiền, có quyền. Vừa kiếm được nhiều $ lại được xã hội trọng vọng. Thằng em mình học bách khoa cơ khí, sinh năm 96. Tự mày mò học code rồi đi làm remote cho công
                                                        ty Mỹ 2 năm nay. Mỗi tối online 3-4 giờ là xong việc. Lương tháng 3k6. Nhưng thu nhập chính vẫn là từ nhận các project bên ngoài làm thêm. Tuần làm 2,3 cái nhẹ nhàng 9,10k tiền tươi thóc thật không
                                                        phải đóng thuế. Làm gần được 3 năm mà nhà xe nó đã mua đủ cả. Nghĩ mà thèm.
                                                    </p>
                                                </li>
                                                <ul class="review-option">
                                                    <form method="POST" class="reply-form d-none" id="comment-1-reply-form">
                                                        <textarea class="input-reply" placeholder="Reply to comment" rows="4"></textarea>
                                                        <button class="reply-submit" type="submit">Submit</button>
                                                        <button type="button" onclick="closeForm(this)">Cancel</button>
                                                    </form>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
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
                            <a href="cartDetail.jsp">CART</a>
                        </c:if>
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
