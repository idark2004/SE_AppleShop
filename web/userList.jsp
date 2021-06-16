<%-- 
    Document   : userList
    Created on : Jun 13, 2021, 3:24:31 PM
    Author     : phath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>User List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/mainHoang.css">
    <link rel="stylesheet" href="css/mainP.css">
    <link rel="stylesheet" href="css/usesrList.css">
    <link rel="stylesheet" href="bootstrap-5.0.1-dist/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
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
                <!-- If user logged in successfully , the item below will show up and hide item other <li> item  -->
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
            </div>
        </div>
    </div>

    <div class="List-container">
        <h1 class="List-header">User List</h1>
        <form class="List-filter">
            <input type="text" onkeyup="myFunction();" name="userID" id="myInput" class="List-filter__input" placeholder="Input User Id">

            <select onchange="statusFilter();" name="status-filter" id="status-select">
                    <option hidden disabled selected value>Status</option>
                    <option value="">All</option>
                    <option value="ascend">A-Z</option>
                    <option value="descend">Z-A</option>
                 </select>
        </form>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="main-box no-header clearfix">
                    <div class="main-box-body clearfix">
                        <div class="table-responsive">
                            <table class="table user-list" id="myTable">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Id</th>
                                        <th><span>User</span></th>
                                        <th><span>Created</span></th>
                                        <th class="text-center"><span>Gender</span></th>
                                        <th><span>Address</span></th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><img src="images/male.png" alt=""></td>
                                        <td>trandan123</td>
                                        <td>
                                            <a href="">Tien Tri Vu Tru Tran Dan</a>
                                        </td>
                                        <td>2020/08/12</td>
                                        <td class="text-center">
                                            <span class="label label-default">Male</span>
                                        </td>
                                        <td>
                                            123 Little Saigon, California, USA
                                        </td>
                                        <td style="width: 20%;">
                                            <a href="" class="table-link text-warning">
                                                <span class="fa-stack">
                                                    <i class="fa fa-square fa-stack-2x"></i>
                                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                                </span>
                                            </a>
                                            <a href="" class="table-link text-info">
                                                <span class="fa-stack">
                                                    <i class="fa fa-square fa-stack-2x"></i>
                                                    <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                                </span>
                                            </a>
                                            <a href="" class="table-link danger">
                                                <span class="fa-stack">
                                                    <i class="fa fa-square fa-stack-2x"></i>
                                                    <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                                </span>
                                            </a>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><img src="images/female.png" alt=""></td>
                                        <td>ozawakimochi</td>
                                        <td>
                                            <a href="">Maria Ozawa</a>
                                        </td>
                                        <td>2020/08/12</td>
                                        <td class="text-center">
                                            <span class="label label-danger">Female</span>
                                        </td>
                                        <td>
                                            123 Yamate Kudasai, Tokyo, Japan
                                        </td>
                                        <td style="width: 20%;">
                                            <a href="#" class="table-link  text-warning">
                                                <span class="fa-stack">
                                                    <i class="fa fa-square fa-stack-2x"></i>
                                                    <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                                </span>
                                            </a>
                                            <a href="#" class="table-link  text-info">
                                                <span class="fa-stack">
                                                    <i class="fa fa-square fa-stack-2x"></i>
                                                    <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                                </span>
                                            </a>
                                            <a href="#" class="table-link danger">
                                                <span class="fa-stack">
                                                    <i class="fa fa-square fa-stack-2x"></i>
                                                    <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                                </span>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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
