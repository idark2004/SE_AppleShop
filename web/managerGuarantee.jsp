<%-- 
    Document   : ManagerGuaranty
    Created on : Jul 10, 2021, 10:38:59 PM
    Author     : anime
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>SE15 Shop | Customers</title>
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
        <link rel="stylesheet" href="themes/font-awesome-4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <div id="header">
            <div class="container">
                <div id="welcomeLine" class="row">
                    <div class="span6">Welcome!<strong> User</strong></div>
                    <div class="span6">
                        <div class="pull-right">
                            <a href="product_summary_Manager.html"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ 3 ] Itemes in your cart </span> </a>
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
                        <form class="form-inline navbar-search" method="post" action="products.html">
                            <input id="srchFld" class="srchTxt" type="text" />
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
                            <a id="myCart" href="product_summary_Manager.html"><img src="themes/images/ico-cart.png" alt="cart">3 Items in your cart <span class="badge badge-warning pull-right">445,000VND</span></a>
                        </div>
                        <ul id="sideManu" class="nav nav-tabs nav-stacked">
                            <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=">All</a></li>
                            <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=IP">iPhone</a></li>
                            <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=ID">iPad</a></li>
                            <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=MB">Mac</a></li>
                            <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=AW">Apple Watch</a></li>
                            <li><a href="MainController?action=Manage+Product&perform=Get&categoryID=AS">Accessory</a></li>
                            <li class="subMenu" id="manaLi"><a>Shop Manager</a>
                                <ul style="display:none">
                                    <li><a href="DashBoardController"><i class="icon-chevron-right"></i>Dashboard</a></li>
                                    <li><a href="ManagerAddProduct.jsp"><i class="icon-chevron-right"></i>Add Product</a></li>
                                    <li><a href="MainController?action=Manage+User&perform=Get+User&roleID=US"><i class="icon-chevron-right"></i>User List</a></li>
                                    <li><a href="MainController?action=SaleCode&perform=List"><i class="icon-chevron-right"></i>Sale Code List</a></li>
                                <c:if test="${sessionScope.USER.roleID.trim() == 'AD'}">
                                    <li><a href="MainController?action=Manage+User&perform=Get+Manager"><i class="icon-chevron-right"></i>Manager List</a></li>
                                </c:if>                                
                                </ul>
                            </li>
                        </ul>
                        <br/>
                    </div>
                    <!-- Sidebar end=============================================== -->
                    <div class="span9">
                        <ul class="breadcrumb">
                            <li><a href="index_Manager.html">Home</a> <span class="divider">/</span></li>
                            <li class="active">Guarantee Form</li>
                        </ul>
                        <h3>Guarantee Form</h3>
                        <div class="well">
                            <form action="MainController" class="form-horizontal">
                                <h4>Customer personal information</h4>

                                <div class="control-group">
                                    <label class="control-label" for="inputFname">Full name <sup>*</sup></label>
                                    <div class="controls">
                                        <input type="text" id="inputFname" name="name" placeholder="Trần Văn A" pattern="[A-Za-z]{4,}" title="Please enter full name" required>
                                    </div>
                                </div>                                

                                <div class="control-group">
                                    <label class="control-label" for="phone">Phone <sup>*</sup></label>
                                    <div class="controls">
                                        <input type="text" name="contact" id="Phone" placeholder="0914123456"  pattern="[0-9]{9,10}" title="Please enter correct phone number ( 9-10 numbers )" required/>
                                    </div>
                                </div>                                

                                <hr class="soft" />

                                <h4>Guarantee Details</h4>
                                <div class="control-group">
                                    <label class="control-label" for="orderID">Order ID <sup>*</sup></label>
                                    <div class="controls">
                                        <input type="text" id="orderID" placeholder="ORD-01" name="orderID" pattern="(ORD-)[0-9]{1,}" title="ORD-xx" required>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="currentDateTime">Receive date </label>
                                    <div class="controls">
                                        <input type="text" id="currentDateTime" name="receiveDate" readonly>
                                    </div>
                                </div>
                                <script>
                                    var today = new Date();
                                    var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
                                    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
                                    var dateTime = date + ' ' + time;
                                    document.getElementById("currentDateTime").value = dateTime;
                                </script>
                                <div class="control-group">
                                    <label class="control-label" for="expected">Expected return date <sup>*</sup></label>
                                    <div class="controls">
                                        <input type="date" id="expected" placeholder="Date" name="expectedDate" required>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="textarea">Description</label>
                                    <div class="controls">
                                        <textarea class="input-xlarge" id="textarea" name="description" rows="3" style="height:10rem; width:97%;" placeholder="Input guarantee information"></textarea>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="fee">Guarantee Fee <sup>*</sup></label>
                                    <div class="controls">
                                        <input type="text" id="fee" placeholder="Fee" name="fee" pattern="[0-9]{6,7}" required>
                                    </div>

                                </div>


                                <p><sup>*</sup>Required field </p>

                                <div class="control-group">
                                    <div class="controls">
                                        <input type="hidden" name="action" value="Guarantee"/>
                                        <input class="btn btn-large btn-success" type="submit" name="perform" value="Submit" />
                                    </div>
                                </div>
                            </form>
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

</html>
