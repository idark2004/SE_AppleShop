<%-- 
    Document   : cartForm
    Created on : May 29, 2021, 8:32:07 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    

    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/cartForm.css">

    <title>Your Cart</title>
</head>

<body>
    <form>

        
        <div class="imgcontainer">
            <a href="Homepage.jsp" class="home-link" style="float:left;">
                <i class="fas fa-arrow-left"></i>Homepage
            </a>
            <a href="Homepage.jsp" class="home-link">
                <img style="max-width: 10rem;" src="images/shop_logo.png" alt="Logo" class="shop-logo">
            </a>
        </div>

        <div class="row">
            <div class="col-75">
                <div class="container">

                    <c:set var="total" value="0"/>
                    <c:choose>
                        <c:when test="${sessionScope.cart != null}">
                        <c:forEach var="cartItem" items="${sessionScope.cart}">
                        <section id="cart">
                            <article class="product">
                                <header>
                                    <a class="remove" href="MainController?action=RemoveCart&productID=${cartItem.product.productID.trim()}&color=${cartItem.product.color.trim()}&ram=${cartItem.product.ram.trim()}&storage=${cartItem.product.storage.trim()}">
                                        <img src="${cartItem.product.image}" alt="">

                                        <h3>Remove product</h3>


                                    </a>
                                </header>

                                <div class="content">

                                    <h1>${cartItem.product.name}</h1>

                                    Color: ${cartItem.product.color}
                                    Ram: ${cartItem.product.ram}
                                    Storage: ${cartItem.product.storage}
                                    <div title="You have selected this product to be shipped in the color yellow." style="top: 0" class="color yellow"></div>
                                </div>

                                <footer class="content">
                                    <span class="qt-minus">-</span>
                                    <span class="qt">${cartItem.quantity}</span>
                                    <span class="qt-plus" >+</span>

                                    <h2 class="full-price">
                                        <fmt:formatNumber type="number" maxFractionDigits = "0" value="${cartItem.quantity * cartItem.product.price}" />
                                    </h2>

                                    <h2 class="price">
                                        <fmt:formatNumber type="number" maxFractionDigits = "0" value="${cartItem.product.price}" />
                                    </h2>
                                </footer>
                                        <c:set var="total" value="${total + (cartItem.quantity * cartItem.product.price)}"/>
                            </article>
                        </section>
                        </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h1>no item in the cart</h1>
                        </c:otherwise>
                    </c:choose>
                    
                    <div class="promoCode">
                        <label for="promo">Have A Promo Code?</label><input type="text" name="promo" placholder="Enter Code" />
                        <a href="#" class="btn"></a>
                    </div>

                    <div class="total-price">
                        <h1 class="total">Subtotal: <span><fmt:formatNumber type="number" maxFractionDigits = "0" value="${total}" /></span> VND</h1>
                        <h1 class="total">Total: <span>  <fmt:formatNumber type="number" maxFractionDigits = "0" value="${total}" /></span> VND</h1>
                    </div>
                </div>


            </div>


            <div class="col-25">
                <div class="container">
                    <form action="MainController">

                        <div class="row">
                            <div class="col-50">
                                <h3>Billing Address</h3>
                                <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                                <input type="text" id="fname" name="name" placeholder="Trần Văn A">
                                <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                <input type="text" id="email" name="email" placeholder="abc@example.com">
                                <label for="phone"><i class="fas fa-phone-square-alt"></i>Phone Number</label>
                                <input type="text" id="phone" name="phone" placeholder="0912345678">
                                <label for="adr"><i class="fa fa-address-card"></i> Address</label>
                                <input type="text" id="adr" name="address" placeholder="69 Phố Trần Duy Hưng">
                                <label for="city"><i class="fa fa-institution"></i> City</label>
                                <input type="text" id="city" name="city" placeholder="Hà Nội">
                            </div>
                        </div>

                        <div>
                            <div class="policy-check">
                                <input type="checkbox" checked="checked" name="sameadr">

                            </div>

                            <div class="policy-check">
                                <p>By finishing checking out, please accept our policies <a href="#" style="color:dodgerblue">Sale and refund</a>.</p>
                            </div>

                            <div class="payment-method">
                                <div>
                                    <input type="radio" checked="checked" name="method" value="cod"> Pay after delivery (Using the billing address above as shipping address)
                                </div>
                                <div>
                                    <input type="radio" checked="checked" name="method" value="direct"> Pay at shop
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="price" value="${total}">
                        <div style="margin-top: 2rem;">
                            <input type="submit" name="action" value="Continue Shopping" class="cancel">
                            <input type="submit" name="action" value="Finish Checkout" class="btn">
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </form>

    <!-- Script tham khao: remove san pham, doi gia total theo tang giam so luong -->
    <script>
        var check = false;

        function changeVal(el) {
            var qt = parseFloat(el.parent().children(".qt").html());
            var price = parseFloat(el.parent().children(".price").html());
            var eq = Math.round(price * qt * 100) / 100;

            el.parent().children(".full-price").html(eq + "€");

            changeTotal();
        }

        function changeTotal() {

            var price = 0;

            $(".full-price").each(function(index) {
                price += parseFloat($(".full-price").eq(index).html());
            });

            price = Math.round(price * 100) / 100;
            var tax = Math.round(price * 0.05 * 100) / 100
            var shipping = parseFloat($(".shipping span").html());
            var fullPrice = Math.round((price + tax + shipping) * 100) / 100;

            if (price == 0) {
                fullPrice = 0;
            }



            $(".subtotal span").html(price);
            $(".total span").html(fullPrice);
        }

        $(document).ready(function() {

            $(".remove").click(function() {
                var el = $(this);
                el.parent().parent().addClass("removed");
                window.setTimeout(
                    function() {
                        el.parent().parent().slideUp('fast', function() {
                            el.parent().parent().remove();
                            if ($(".product").length == 0) {
                                if (check) {
                                    $("#cart").html("<h1>The shop does not function, yet!</h1>");
                                } else {
                                    $("#cart").html("<h1>No products!</h1>");
                                }
                            }
                            changeTotal();
                        });
                    }, 200);
            });

            $(".qt-plus").click(function() {
                $(this).parent().children(".qt").html(parseInt($(this).parent().children(".qt").html()) + 1);

                $(this).parent().children(".full-price").addClass("added");

                var el = $(this);
                window.setTimeout(function() {
                    el.parent().children(".full-price").removeClass("added");
                    changeVal(el);
                }, 150);
            });

            $(".qt-minus").click(function() {

                child = $(this).parent().children(".qt");

                if (parseInt(child.html()) > 1) {
                    child.html(parseInt(child.html()) - 1);
                }

                $(this).parent().children(".full-price").addClass("minused");

                var el = $(this);
                window.setTimeout(function() {
                    el.parent().children(".full-price").removeClass("minused");
                    changeVal(el);
                }, 150);
            });

            window.setTimeout(function() {
                $(".is-open").removeClass("is-open")
            }, 1200);

            $(".btn").click(function() {
                check = true;
                $(".remove").click();
            });
        });
    </script>
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
</body>

</html>
