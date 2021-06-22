<%-- 
    Document   : orderHistory
    Created on : Jun 22, 2021, 6:44:26 AM
    Author     : phath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order History</title>

    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../css/mainHoang.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/orderList.css">
    <link rel="stylesheet" href="../css/carticon.css">
    <link rel="stylesheet" href="../css/cartListIcon.css">
    <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="bootstrap-5.0.1-dist/css/bootstrap.css" >
</head>

<body>
    <header class="header">

        <div class="shop-logo">
            <a href="Homepage.html" class="home-link">
                <section class="header_item" id="shopLogo">
                    <img style="width: 8rem" src="images/shop_logo.png">
                </section>
                <section class="header_item" id="shopName">
                    <h1>SE15 Apple Store</h1>
                </section>
            </a>
        </div>


        <div class="login">
            <ul class="header_item_list">
                <!-- If user logged in suscessfully , the item below wil showup and hide item other li item  -->
                <c:if test="${requestScope.success != null }">
                    <li class="header_item header__navbar-user">
                        <span class="header_item_user-name">Hello,${requestScope.username}</span>
                        <ul class="header__navbar-user--menu">
                            <li class="header__navbar-user--item">
                                <a href="MainController?action=UserDetail">User detail</a>
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
                <c:if test="${requestScope.success == null }">
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
                        <a class="product-link" href="ViewProductController?categoryID=&status=True" class="header-nav__item-active">All</a>
                        <a class="product-link" href="ViewProductController?categoryID=MB&status=True">Mac</a>
                        <a class="product-link" href="ViewProductController?categoryID=ID&status=True">iPad</a>
                        <a class="product-link" href="ViewProductController?categoryID=IP&status=True">iPhone</a>
                        <a class="product-link" href="ViewProductController?categoryID=AW&status=True">Apple Watch</a>
                        <a class="product-link" href="ViewProductController?categoryID=AS&status=True">Accessories</a>
                    </div>
                    <div class="responsive-div" style="display: flex;">
                        <div class=" search-container">
                            <form action="" class="search-form">
                                <input type="text" placeholder="Search.." name="search">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>

                        <div class=" cart">
                            
                            <a class="cart-view" href="MainController?action=ViewCart">
                                <i class="carft-icon fas fa-shopping-cart"></i>
                                <c:forEach var="cartItem" items="${sessionScope.cart}">
                                    <c:set var="subtotalCount" value="${cartItem.quantity}"/>
                                    <c:set var="subtotal" value="${subtotal+cartItem.quantity}"/>
                                </c:forEach>
                                <span class="cart-items">${subtotal}</span>
                            
                            </a>
                            <c:choose>
                                <c:when test="${sessionScope.cart == null}">
                                     <div class="header__cart-list header__cart-list--no-cart">

                                         <img src="images/no-cart.png" alt="" class="header___cart--no-cart---img">
                                         <span class="header__cart-list--no-cart-msg">Empty Cart</span>

                                     </div>     
                                </c:when>
                                <c:otherwise>
                                    <div class="header__cart-list">                                                              
                                        <header class="header__cart-heading">
                                            <h4 >View cart</h4>
                                        </header>
                                        <ul class="header__cart-list--item">
                                            <c:forEach var="cartItem" items="${sessionScope.cart}">
                                                <li class="header__cart-item">
                                                    <img src="${cartItem.product.image}" alt="" class="header__cart-img">
                                                    <div class="header__cart-item--info">
                                                        <div class="header__cart-item--head">
                                                            <h5 class="header__cart-item--name">
                                                                ${cartItem.product.name}
                                                            </h5>
                                                            <div class="header__cart-item-price--wrap">
                                                            <span class="header__cart-item--price"><fmt:formatNumber type="number" maxFractionDigits = "0" value="${cartItem.product.price}"/>VND</span>
                                                            <span class="header__cart-item--multiplication">x</span>
                                                            <span class="header__cart-item--quantity">${cartItem.quantity}</span>
                                                            </div>
                                                        </div>
                                                        <div class="header__cart-item--body">
                                                            <span class="header__cart-item--description">
                                                                color:${cartItem.product.color} | ram-storage:${cartItem.product.ram}-${cartItem.product.storage}
                                                            </span>
                                                            <span class="header__cart-item--remove"><a 
                                                                    href="MainController?action=RemoveCart&page=<%=resource%>&productID=${cartItem.product.productID.trim()}&color=${cartItem.product.color.trim()}&ram=${cartItem.product.ram.trim()}&storage=${cartItem.product.storage.trim()}"
                                                            style="color:black;text-align: right;
                                                            padding:0;height: 20px;">Remove</a></span>
                                                        </div>
                                                    </div>
                                                                    
                                                </li>
                                            </c:forEach> 
                                        </ul>
                                        <a class="header__cart-view-cart btn btn__primary" href="MainController?action=ViewCart" style="background-color: #DDDDDD;color:black">View detail</a>
                                    </div> 
                                </c:otherwise>  
                        </c:choose>
                        </div>
                    </div>
                    
    
                </div>
            </div>
    <div class="app__container" style="margin-top: 20px;">
        <h1 class="orderList-header">Order History</h1>
             <form class="orderList-filter">
                 <input type="text" onkeyup="myFunction();" name="orderID" id="myInput" class="orderList-filter__input" placeholder="input orderId">

                 <select onchange="statusFilter();" name="status-filter" id="status-select">
                    <option hidden disabled selected value>Status</option>
                    <option value="">All</option>
                    <option value="received">Received</option>
                    <option value="shipping">Shipping</option>
                 </select>
            </form>
        <div class="table-responsive">
            <table class="table orderList-table table-striped align-middle" id="orderList-table" style="width: 95.5%;">
                <thead>
                  <tr>
                    <th scope="col">OrderID</th>
                    <th scope="col">Order Day</th>
                   
                    <th scope="col">Ship Address</th>
                    <th scope="col">Subtotal</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                    
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="table__row" style="width: 12%">#00000003</td>
                        <td class="table__row" style="width: 12%">14/5/2021</td>
                       
                        <td class="table__row" style="width: 12%">@mdo</td>
                        <td class="table__row" style="width: 12%">14/5/2021</td>
                        <td class="table__row" style="width: 12%">Shipping</td>
                        <td class="table__row" style="width: 12%" ><a href=""><button  class="btn btn-secondary action-btn">View</button></a></td>                
                    </tr>
                 
                </tbody>
              </table>
            </div>
    </div>

    <footer class="footer">
        <div class="grid">
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
                        <span class="foot-left-info__shop-address-text">Số 69 Phố Trần Duy Hưng Hà Nội</span>
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
                td = tr[i].getElementsByTagName("td")[1];
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
               function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            
            filter = input.value.toUpperCase();
            table = document.getElementById("orderList-table");
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
        function statusFilter(){
            var select, filter, table, tr, td, i, txtValue;
            select = document.getElementById("status-select");
            filter = select.value.toUpperCase();
            table = document.getElementById("orderList-table");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[4];
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
