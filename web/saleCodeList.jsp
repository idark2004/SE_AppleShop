<%-- 
    Document   : saleCodeList
    Created on : Jun 22, 2021, 6:48:30 AM
    Author     : phath
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>User List</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="./fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/mainHoang.css">
        <link rel="stylesheet" href="css/mainP.css">
        <link rel="stylesheet" href="css/usesrList.css">
        <link rel="stylesheet" href="bootstrap-5.0.1-dist/css/bootstrap.css">

    </head>

    <body>
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
                    <c:if test="${sessionScope.user != null }">
                        <li class="header_item header__navbar-user">
                            <span class="header_item_user-name">Hello, ${sessionScope.user.name}</span>
                            <ul class="header__navbar-user--menu">
                                <li class="header__navbar-user--item">
                                    <a href="UserDetailController?userid=${sessionScope.user.userID}">User detail</a>
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
                    <c:if test="${sessionScope.user == null }">
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
                    <a class="product-link" href="" class="header-nav__item-active">Dashboard</a>
                    <a class="product-link" href="">Add a product</a>
                    <a class="product-link" href="">Order list</a>
                    <a class="product-link" href="">User list</a>
                    <a class="product-link" href="">Sale Code list</a>
                </div>
            </div>
        </div>

        <div class="List-container">
            <h1 class="List-header">Sale Code List</h1>
            <form class="List-filter">
                <input type="text" onkeyup="myFunction();" name="userID" id="myInput" class="List-filter__input" placeholder="Input Code Id">

            </form>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="main-box no-header clearfix">
                        <div class="main-box-body clearfix">
                            <c:choose>
                                <c:when test="${not empty requestScope.CODE_LIST}">
                                    <div class="table-responsive">
                                        <table class="table user-list" id="myTable">
                                            <thead>
                                                <tr>                                        
                                                    <th>Code Id</th>
                                                    <th><span>Name</span></th>
                                                    <th>Percentage(%)</th>                                                    
                                                    <th><span>Created</span></th>
                                                    <th class="text-center"><span>Exp day</span></th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <c:forEach var="code" items="${requestScope.CODE_LIST}">
                                            <tbody>
                                                <tr>
                                                    <td>${code.codeID}</td>
                                                    <td>${code.codeName}</td>
                                                    <td>${code.percentage}</td>
                                                    <td>${code.createDate}</td>
                                                    <td>${code.expDate}</td>
                                                    <td style="width: 20%;">
                                                       
                                                        <a href="MainController?action=SaleCode&perform=View&codeID=${code.codeID}" class="table-link text-warning">
                                                            <span class="fa-stack">
                                                                <i class="fa fa-square fa-stack-2x"></i>
                                                                <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                                            </span>
                                                        </a>
                                                        
                                                        <a href="MainController?action=SaleCode&perform=Delete" class="table-link text-danger">
                                                            <span class="fa-stack fa-1x">
                                                                <i class="fa fa-square fa-stack-2x"></i>
                                                                <i class="fa fa-trash fa-stack-1x fa-inverse"></i>
                                                            </span>
                                                        </a>
                                                            
                                                    </td>
                                                </tr>                                    
                                            </tbody>
                                            </c:forEach>
                                        </table>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="center">
                <div class="pagination">
                    <a href="#">&laquo;</a>
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">&raquo;</a>
                </div>
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

        <script>
            function myFunction() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("myInput");

                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }

            function statusFilter() {
                var select, filter, table, tr, td, i, txtValue;
                select = document.getElementById("status-select");
                filter = select.value.toUpperCase();
                table = document.getElementById("List-table");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[5];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>
    </body>

</html>
