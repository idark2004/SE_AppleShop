<%-- 
    Document   : DashBoard
    Created on : Jul 10, 2021, 1:46:43 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>SE15 Shop | Dashboard</title>
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
    <link href="themes/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Google-code-prettify -->
    <link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet" />
    <script type="text/javascript" src="chart.js/Chart.js"></script>

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
                <div class="span6">Welcome!<c:choose>
                        <c:when test="${sessionScope.USER != null}">
                            <strong>${USER.name}</strong>
                        </c:when>
                        <c:otherwise>
                            <strong> User</strong>
                        </c:otherwise>
                    </c:choose>
                </div>
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
                            <ul>
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

                <div class="content-wrapper">

                    <div class="container-fluid">
                        <ul class="breadcrumb" style="margin-top: -1rem;">
                            <li><a href="MainController?action=Product&perform=Index">Home</a> <span class="divider">/</span></li>
                            <li class="active">Dashboard</li>
                        </ul>
                        <!-- Area Chart-->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-area-chart"></i> Area Chart</div>
                            <div class="card-body">
                                <canvas id="myAreaChart" width="100%" height="30"></canvas>
                            </div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        <br>

                        <c:set var="total" value="0"/>
                        <c:forEach var="data" items="${requestScope.BarChart}">
                            <c:set var="total" value="${total + data.revenue}"/>
                        </c:forEach>

                        <!--Bar Chart Card-->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-bar-chart"></i> Bar Chart</div>
                            <div class="card-body">
                                <div class="row1">
                                    <div class="col-sm-9 my-auto">
                                        <canvas id="myBarChart" width="100" height="50"></canvas>
                                    </div>
                                    <div class="col-sm-2 text-center my-auto">
                                        <div class="h4 mb-0 text-primary">${total} VND</div>
                                        <div class="small text-muted">Revenue</div>
                                        <hr>
                                        <div class="h4 mb-0 text-warning">${requestScope.highestMonthly} VND</div>
                                        <div class="small text-muted">highest Month</div>
                                        <hr>
                                        <div class="h4 mb-0 text-success">${requestScope.lowestMonthly} VND</div>
                                        <div class="small text-muted">Lowest Month</div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        <br>

                        <!--Notifications Card-->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-bell-o"></i>Manager Feeding Log</div>
                            <div class="list-group list-group-flush small">
                                <a class="list-group-item list-group-item-action" href="#">
                                    <div class="media-body">
                                        <strong>Quang Phuc</strong> added a new product here
                                        <div class="text-muted smaller"> Today at 5:43 PM - 5m ago</div>
                                    </div>
                                </a>
                                <a class="list-group-item list-group-item-action" href="#">
                                    <div class="media-body">
                                        <strong>Ching Chong</strong> comment at a product
                                        <div class="text-muted smaller"> Today at 4:37 PM - 1hr ago</div>
                                    </div>
                                </a>
                                <a class="list-group-item list-group-item-action" href="#">View all activity...</a>
                            </div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        <br>

                        <!--DataTables Card-->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-table"></i> Manager Data</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Age</th>
                                                <th>Start date</th>
                                                <th>Salary</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Quang</td>
                                                <td>20</td>
                                                <td>2021/04/25</td>
                                                <td>$320,800</td>
                                            </tr>
                                            <tr>
                                                <td>Phat</td>
                                                <td>20</td>
                                                <td>2021/07/25</td>
                                                <td>$170,750</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid-->
            </div>
            <!-- /.container-wrapper-->
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
                    <a href="cartDetail.jsp">CART</a>
                    <a href="login.html">ORDER HISTORY</a>
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
<script>
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';
    // -- Area Chart
    var ctx = document.getElementById("myAreaChart");
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: { 
            labels: [<c:forEach var="data" items="${requestScope.AreaChart}">
                    "${data.date}",
                </c:forEach>],
            datasets: [{
                label: "ProductSale",
                lineTension: 0.3,
                backgroundColor: "rgba(2,117,216,0.2)",
                borderColor: "rgba(2,117,216,1)",
                pointRadius: 5,
                pointBackgroundColor: "rgba(2,117,216,1)",
                pointBorderColor: "rgba(255,255,255,0.8)",
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                pointHitRadius: 20,
                pointBorderWidth: 2,
                data: [<c:forEach var="data" items="${requestScope.AreaChart}">
                    ${data.revenue},
                </c:forEach>],
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 7
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: ${requestScope.highestDaily},
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        color: "rgba(0, 0, 0, .125)",
                    }
                }],
            },
            legend: {
                display: false
            }
        }
    });
    // -- Bar Chart
    var ctx = document.getElementById("myBarChart");
    var myLineChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
            datasets: [{
                label: "Revenue",
                backgroundColor: "rgba(2,117,216,1)",
                borderColor: "rgba(2,117,216,1)",
                data: [<c:forEach var="data" items="${requestScope.BarChart}">
                    ${data.revenue},
                </c:forEach>]
            //    data: [4215, 5312, 6251, 7841, 9821, 14984, 1234, 1235, 5432, 4241, 2341, 5314],
            //labels: ["January", "February", "March", "April", "May", "June"],
            //datasets: [{
            //    label: "Revenue",
            //    backgroundColor: "rgba(2,117,216,1)",
            //    borderColor: "rgba(2,117,216,1)",
            //    data: [4215, 5312, 6251, 7841, 9821, 14984],
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'month'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 12
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: ${requestScope.highestMonthly},
                        maxTicksLimit: 10
                    },
                    gridLines: {
                        display: true
                    }
                }],
            },
            legend: {
                display: false
            }
        }
    });

    $(document).ready(function() {
        $('#dataTable').DataTable();
    });
    
</script>
