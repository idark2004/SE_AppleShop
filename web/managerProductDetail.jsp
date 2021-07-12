<%-- 
    Document   : ManagerProductUpdate
    Created on : Jul 8, 2021, 8:11:55 PM
    Author     : anime
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
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
                        <a class="brand" href="index_Manager.html">SE15 Shop</a>
                        <form class="form-inline navbar-search" method="post" action="MainController">
                            <input id="srchFld" class="srchTxt" type="text" name="keyWord"/>
                            <input type="hidden" value="SearchProduct" name="action"/>
                            <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                        </form>
                        <ul id="topMenu" class="nav pull-right">
                            <li class=""><a href="products_Manager.html">All Products</a></li>                                                                        
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div id="mainBody">
            <div class="container">
                <div class="row">
                    <!-- Sidebar ================================================== -->
                    <div id="sidebar" class="span3">                        
                        <ul id="sideManu" class="nav nav-tabs nav-stacked">
                            <li><a href="products_Manager.html">All</a></li>
                            <li><a href="products_Manager.html">iPhone</a></li>
                            <li><a href="products_Manager.html">iPad</a></li>
                            <li><a href="products_Manager.html">Mac</a></li>
                            <li><a href="products_Manager.html">Accessory</a></li>
                            <li class="subMenu"><a>Shop Manager</a>
                                <ul style="display:none">
                                    <li><a href="dashboard_Manager.html"><i class="icon-chevron-right"></i>Dashboard</a></li>
                                    <li><a href="product_details_Manager.html"><i class="icon-chevron-right"></i>Add Product</a></li>
                                    <li><a href="customers_Manager.html"><i class="icon-chevron-right"></i>Customer List</a></li>
                                </ul>
                            </li>
                        </ul>
                        <br/>
                    </div>
                    <!-- Sidebar end=============================================== -->
                    <div class="span9">
                        <ul class="breadcrumb">
                            <li><a href="index_Manager.html">Home</a> <span class="divider">/</span></li>
                            <li><a href="products_Manager.html">Products</a> <span class="divider">/</span></li>
                                <c:if test="${sessionScope.BASIC != null}">
                                <li class="active">${sessionScope.BASIC.name}</li>
                                </c:if>
                        </ul>
                        <c:if test="${requestScope.UPDATED != null}">
                            <script>
                                var msg = "UPDATE : ${requestScope.UPDATED} SUCCESS!!!";
                                alert(msg);
                            </script>
                        </c:if>
                        <c:choose>
                            <c:when test="${sessionScope.SPEC_LIST == null}">
                                <strong>${requestScope.ERROR.msg}</strong>
                            </c:when>
                            <c:otherwise>
                                <div class="row">
                                    <h3>${fn:trim(sessionScope.BASIC.name)}</h3>
                                    <hr class="soft" />
                                    <form action="MainController">
                                        <div id="gallery" class="span3">
                                            <a href="${sessionScope.BASIC.image}" title="${sessionScope.BASIC.name}">
                                                <img src="${sessionScope.BASIC.image}" style="width:100%" alt="${sessionScope.BASIC.name}" />                                
                                            </a>

                                            <input class="file-input" type="file" id="specImage" name="image" accept="image/*" onchange="getPath();">
                                            <script language="javascript" type="text/javascript">
                                                function getPath() {
                                                    var inputName = document.getElementById('specImage');
                                                    var imgPath;

                                                    imgPath = inputName.files[0].name;
                                                    console.log(imgPath);
                                                }
                                            </script>
                                            <div class="control-group">
                                                <label class="control-label" for="productName">Product Name</label>
                                                <div class="controls">
                                                    <input class="span3" type="text" id="productName" name="productName" value="${fn:trim(sessionScope.BASIC.name)}" maxlength="30" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span9">
                                            <ul id="productDetail" class="nav nav-tabs">
                                                <li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
                                            </ul>
                                            <div id="myTabContent" class="tab-content">
                                                <div class="tab-pane fade active in" id="home">
                                                    <h4>Product Information</h4>
                                                    <div class="control-group">
                                                        <label class="control-label" for="textarea">Description</label>
                                                        <div class="controls">
                                                            <textarea class="input-xlarge" id="textarea" name="description" rows="3" style="height:10rem; width:97%;" value="${fn:trim(sessionScope.BASIC.description)}"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="controls">
                                                        <input type="hidden" name="productID" value="${sessionScope.BASIC.productID}">
                                                        <input type="hidden" name="action" value="Manage Product">
                                                        <input class="btn btn-primary btn-success" type="submit" name="perform" value="Update Basic"><br>
                                                    </div>
                                                </div>                                            
                                            </div>
                                        </div>

                                    </form>
                                    <div class="span6">

                                        <div class="">
                                            <h5>Product Editor</h5>
                                            <br>


                                            <table border="1">
                                                <thead>
                                                    <tr>
                                                        <th id="specID">Spec ID</th>
                                                        <th id="specColor">Color</th>
                                                        <th id="ram">Ram</th>
                                                        <th id="storage">Storage</th>
                                                        <th id="quantity">Quantity</th>
                                                        <th id="price">Price</th>
                                                        <th id="specStatus">Status</th>
                                                        <th colspan="2">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="spec" items="${sessionScope.SPEC_LIST}">
                                                        <tr>                                            
                                                            <td class="specID">${spec.specID}</td>
                                                            <td class="specColor">${spec.color}</td>
                                                            <td class="ram">${spec.ram}</td>
                                                            <td class="storage">${spec.storage}</td>
                                                            <td class="quantity">${spec.specQuantity}</td>
                                                            <td class="price">${spec.price}</td>
                                                            <td class="specStatus">
                                                                <c:choose> 
                                                                    <c:when test="${spec.status eq true}">
                                                                        Active
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Inactive
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td class="updateBtn">
                                                                <form action="updateProduct.jsp">
                                                                    <input type="hidden" name="specID" value="${spec.specID}" >
                                                                    <input type="hidden" name="color" value="${spec.color}" >
                                                                    <input type="hidden" name="ram" value="${spec.ram}" >
                                                                    <input type="hidden" name="storage" value="${spec.storage}" >
                                                                    <input type="hidden" name="quantity" value="${spec.specQuantity}" >
                                                                    <input type="hidden" name="price" value="${spec.price}" >
                                                                    <input type="hidden" name="productID" value="${sessionScope.BASIC.productID}">
                                                                    <button type="submit">Update</button>
                                                                </form>
                                                            </td>
                                                            <td class="hideBtn">
                                                                <form action="MainController">
                                                                    <button type="submit" name="perform" value="Hide">Hide</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            <hr class="soft" />
                                            <form class="form-horizontal qtyFrm">
                                                <h5>Create new spec</h5>
                                                <br>

                                                <div class="control-group">
                                                    <label class="control-label" for="">Spec ID</label>
                                                    <div class="controls">
                                                        <input class="span3" type="text" id="" placeholder="Spec ID">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="">New Color</label>
                                                    <div class="controls">
                                                        <input class="span3" type="text" id="" placeholder="New Color">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="">RAM</label>
                                                    <div class="controls">
                                                        <input class="span3" type="text" id="" placeholder="Ram">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="">Storage</label>
                                                    <div class="controls">
                                                        <input class="span3" type="text" id="" placeholder="Storage">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="">Price</label>
                                                    <div class="controls">
                                                        <input class="span3" type="text" id="inputPrice" placeholder="Price" maxlength="11">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="">Quantity</label>
                                                    <div class="controls">
                                                        <input class="span3" type="number" id="inputPrice" placeholder="Quantity">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <div class="controls">
                                                        <input class="btn btn-primary btn-success" type="submit" value="Submit">
                                                    </div>
                                                </div>
                                            </form>
                                            <hr class="soft" />
                                        </div>


                                    </div>



                                </div>
                            </c:otherwise>
                        </c:choose>
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
