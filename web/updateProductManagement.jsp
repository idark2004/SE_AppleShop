<%-- 
    Document   : productDetailManagement
    Created on : Jun 3, 2021, 4:04:10 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        
        <title>SE15 Apple Shop</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/mainHoang.css">
        <link rel="stylesheet" href="css/carticon.css">
        <link rel="stylesheet" href="css/cartListIcon.css">
        <link rel="stylesheet" href="css/productDetailManagement1.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link href="fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
        <script>
        <% 
          String uri = request.getRequestURI();
          int lastIndex = uri.lastIndexOf("/");
          String resource = uri.substring(lastIndex + 1);
        %>
        var loadFile = function(event) {
                var image = document.getElementById('image');
                image.src = URL.createObjectURL(event.target.files[0]);
        };
        </script>
</head>
<body >
    <div class="page__user-profile">
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
                    <c:if test="${requestScope.success != null }">
                    <li class="header_item header__navbar-user">
                            <span class="header_item_user-name">Hello,${requestScope.username}</span>
                            <ul class="header__navbar-user--menu">
                                    <li class="header__navbar-user--item">
                                         <a href="UserDetailController?userid=${sessionScope.user.userID}">User detail</a>
                                    </li>
                                    
                                    <li class="header__navbar-user--item">
                                        <a href="cartForm.jsp">Order detail</a>
                                    </li>
                                     <li class="header__navbar-user--item">
                                        <a href="orderHisotry.html">Order History</a>
                                    </li>
                                     <li class="header__navbar-user--item">
                                        <a href="changePass.jsp">Update Password</a>
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
                        <a class="product-link" href="MainController?action=ProductListManagement&categoryID=">Test Management</a>
                    </div>
                    <div class="responsive-div" style="display: flex; ">
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

        <div class="container__product-detail">
            <div class="frame__product-detail">
                <h2 class="tittle__product-detail">Product Update</h2>
                <form class="form__product-detail" action="MainController" method="post" enctype="multipart/form-data">
                    <div class="user-info-left">
                        <img class="product__img" for="imageFile" id="image" src="${requestScope.product.image}" alt="${requestScope.product.name}">
                        <input class="file-input" name="Photo" onchange="loadFile(event)" type="file">
                    </div>
                    <div class="user-info__right">
                        <div class="product-infor product-id">
                            <span class="product-detail__tittle product-name__tittle">Product id</span>
                            <input type="text" class="input__product-detail full-name__input" name="productID" value="${requestScope.product.productID}" readonly>
                        </div>
                        
                        <div class="product-infor product-name">
                            <span class="product-detail__tittle product-name__tittle">Product Name</span>
                            <input type="text" class="input__product-detail full-name__input" name="name" value="${requestScope.product.name}" >
                        </div>
                        
                        <div class="product-infor product-quantity">
                            <span class="product-detail__tittle total-quantity__tittle">Total Quantity</span>
                            <input type="number" class="input__product-detail address__input" name="totalQuantity" value="${requestScope.product.totalQuantity}" >
                        </div>
                        
                        <div class="color-list"><p>Color:</p>
                            <div class="color-option__container">
                                            
                                <c:set var="i" value="1" scope="page"/>
                                <c:forEach var="color" items="${requestScope.color}">
                                <div class="option-color">
                                    <c:if test = "${color.color == requestScope.colorChosen}">
                                        <input onClick="window.location = 'MainController?action=UpdateProductManagement&productID=${product.productID.trim()}&color=${color.color}';" type="radio" class="input__radio-color" id="color-${i}" name="color" value="${color.color}" checked required>
                                    </c:if>
                                    <c:if test = "${color.color != requestScope.colorChosen}">
                                        <input onClick="window.location = 'MainController?action=UpdateProductManagement&productID=${product.productID.trim()}&color=${color.color}';" type="radio" class="input__radio-color" id="color-${i}" name="color" value="${color.color}" required>
                                    </c:if>
                                  
                                    <label class="label-color" for="color-${i}" >
                                        <span class="img-span" style="background-color: ${color.color}" >
                                            <i class="icon-check fas fa-check"></i>                                               
                                        </span>
                                    </label>
                                    <span class="remove-btn"><a href="youtube.com" class="remove-link">Remove color</a></span>        
                                    <c:set var="i" value="${i + 1}" scope="page"/>
                                </div>
                                
                                </c:forEach>
                                
                            </div>                   
                            
                        </div>
                        <div class="hardware-list">
                            <p class="hardware-tittle">Hardware:</p>
                            <ul class="list-hardware-option">                      
                                <c:set var="i" value="1" scope="page"/>
                                    <c:forEach var="hardware" items="${requestScope.hardware}">
                                    <li class="hardware-item">
                                        <c:if test = "${hardware.specID.trim() == requestScope.specID}">
                                            <input class="input__radio-hardware" onClick="window.location = 'MainController?action=UpdateProductManagement&productID=${product.productID.trim()}&color=${requestScope.colorChosen}&specID=${hardware.specID.trim()}';" type="radio" name="hardware" id="hardware__option-${i}" value="${hardware.ram}-${hardware.storage}" checked required>
                                        </c:if>
                                        <c:if test = "${hardware.specID.trim() != requestScope.specID}">
                                            <input class="input__radio-hardware" onClick="window.location = 'MainController?action=UpdateProductManagement&productID=${product.productID.trim()}&color=${requestScope.colorChosen}&specID=${hardware.specID.trim()}';" type="radio" name="hardware" id="hardware__option-${i}" value="${hardware.ram}-${hardware.storage}" required>
                                        </c:if>
                                        <label class="hardware__lable" for="hardware__option-${i}">
                                            <span class="hardwar__span"><p>${hardware.ram}-${hardware.storage}
                                                    <br><strong><fmt:formatNumber type="number" maxFractionDigits = "0" value="${hardware.price}" /> VND</strong></p>
                                            </span>
                                        </label>
                                        <c:set var="i" value="${i + 1}" scope="page"/>
                                        <span class="remove-btn"><a href="youtube.com" class="remove-link">Remove option</a></span>
                                    </li>
                                    </c:forEach>
                                            
                            </ul>
                        </div>
                        <c:if test="${requestScope.spec!=null}">
                        <div class="product-infor product-price">
                            <span class="product-detail__tittle price__tittle">Price</span>
                            <input type="text" class="input__product-detail email__input" name="price" value="<fmt:formatNumber type="number" maxFractionDigits = "0" value="${spec.price}" />"  >
                        </div>
                        
                        <div class="product-infor product-quantity">
                            <span class="product-detail__tittle total-quantity__tittle">Spec Quantity</span>
                            <input type="text" class="input__product-detail address__input" name="quantity" value="${requestScope.spec.totalQuantity}" >
                        </div>
                            <input type="hidden" name="specID" value="${requestScope.spec.specID}" >
                        </c:if>
                        <input class="button-update" type="submit" name="action" value="Update Product Detail">
                    </div>
                    
                </form>  
               
            </div>
            <div class="spec-frame">
                <h4 class="spec-tittle">Create new Spec</h4>
                <form action="MainController" method="post" class="spec-form">
                    <input type="hidden" name="productID" value="${requestScope.product.productID}">
                    <div class="spec-infor spec-id">
                        <span class="spec-detail__tittle product-name__tittle">SpecID</span>
                        <input type="text" class="input__spec-detail full-name__input" name="newSpecID" value="" >
                    </div>
                    <div class="spec-infor color">
                        <span class="spec-detail__tittle price__tittle">New Color</span>
                        <input type="text" class="input__spec-detail email__input" name="newColor" value=""  >
                    </div>
                    <div class="spec-infor new-option">
                        <span class="spec-detail__tittle new-option__tittle">Ram</span>
                        <input type="text" class="input__spec-detail new-option__input" name="newRam" value="" >
                    </div>
                    <div class="spec-infor new-option">
                        <span class="spec-detail__tittle new-option__tittle">Storage</span>
                        <input type="text" class="input__spec-detail new-option__input" name="newStorage" value="" >
                    </div>
                    <div class="spec-infor price">
                        <span class="spec-detail__tittle price__tittle">Price</span>
                        <input type="text" class="input__spec-detail email__input" name="newPrice" value=""  >
                    </div>
                    <div class="spec-infor quantity">
                        <span class="spec-detail__tittle total-quantity__tittle">Quantity</span>
                        <input type="text" class="input__spec-detail address__input" name="newQuantity" value="" >
                    </div>
                    <input type="submit" name="action" value="Create new option" class="submit-option">
                </form>
            </div>
               <div class="frame-discription">
                   <h2 class="tittle-des" >Description</h2>
                   <button id="activate-edit" onclick="editMode()">Change to Edit Mode</button>
                   <input id="ch" type="checkbox" onchange="textResize()" >
                   <label  for="ch" id="la"></label>                  
                   <textarea class="input-des" id="input-des" name="des"  readonly>
                    Google LLC là một công ty công nghệ đa quốc gia của Mỹ, chuyên về các dịch vụ và sản phẩm liên quan đến Internet, bao gồm các công nghệ quảng cáo trực tuyến, công cụ tìm kiếm, điện toán đám mây, phần mềm và phần cứng. Đây được coi là một trong những công ty công nghệ Big Four, cùng với Amazon, Apple và Facebook.

                    Google được thành lập vào năm 1998 bởi Larry Page và Sergey Brin trong khi họ là nghiên cứu sinh đã có bằng tiến sĩ tại Đại học Stanford ở California. Họ cùng nhau sở hữu khoảng 14% cổ phần và kiểm soát 56% quyền biểu quyết của cổ đông thông qua cổ phiếu ưu đãi. Họ đã hợp nhất Google thành một công ty tư nhân vào ngày 4 tháng 9 năm 1998. Một đợt chào bán công khai lần đầu (IPO) diễn ra vào ngày 19 tháng 8 năm 2004 và Google chuyển đến trụ sở chính tại Mountain View, California với tên Googleplex. Vào tháng 8 năm 2015, Google đã công bố kế hoạch tổ chức lại công ty với tư cách là một tập đoàn có tên là Alphabet Inc. Google là công ty con hàng đầu của Alphabet và sẽ tiếp tục là công ty ô dù vì lợi ích Internet của Alphabet. Sundar Pichai được bổ nhiệm làm CEO của Google, thay thế Larry Page trở thành CEO của Alphabet.

                    Sự phát triển nhanh chóng của công ty kể từ khi thành lập đã kích hoạt một chuỗi các sản phẩm, mua lại để sáp nhập và hợp tác ngoài công cụ tìm kiếm cốt lõi của Google (Google Tìm kiếm). Nó cung cấp các dịch vụ được thiết kế cho công việc và năng suất (Google Docs, Google Sheets và Google Slides), email (Gmail/Inbox), lập lịch và quản lý thời gian (Lịch Google), lưu trữ đám mây (Google Drive), mạng xã hội (Google+), nhắn tin và trò chuyện video trực tiếp (Google Allo, Duo, Hangouts), dịch ngôn ngữ (Google Dịch), lập bản đồ và điều hướng (Google Maps, Waze, Google Earth, Chế độ xem phố), chia sẻ video (YouTube), ghi chú (Google Keep) và tổ chức và chỉnh sửa ảnh (Google Ảnh). Công ty dẫn đầu sự phát triển của hệ điều hành di động Android, trình duyệt web Google Chrome và Chrome OS, một hệ điều hành nhẹ dựa trên trình duyệt Chrome. Google đã ngày càng chuyển sang phần cứng; từ năm 2010 đến 2015, nó hợp tác với các nhà sản xuất điện tử lớn trong việc sản xuất các thiết bị Nexus của mình và đã phát hành nhiều sản phẩm phần cứng vào tháng 10 năm 2016, bao gồm điện thoại thông minh Google Pixel, loa thông minh Google Home, bộ định tuyến không dây Google Wifi và Daydream-tai nghe thực tế ảo. Google cũng đã thử nghiệm trở thành nhà cung cấp dịch vụ Internet (Google Fiber, Project Fi và Google Station).

                    Google.com là trang web được truy cập nhiều nhất trên thế giới. Một số dịch vụ khác của Google cũng nằm trong top 100 trang web được truy cập nhiều nhất trên thế giới, bao gồm YouTube và Blogger. Google là thương hiệu có giá trị nhất thế giới tính đến năm 2017 nhưng đã nhận được sự chỉ trích đáng kể liên quan đến các vấn đề như lo ngại về quyền riêng tư, tránh thuế, chống độc quyền, kiểm duyệt và trung lập trong tìm kiếm. Tuyên bố sứ mệnh của Google là "tổ chức thông tin của thế giới", và khẩu hiệu không chính thức là "Don't be evil" (Đừng trở nên xấu xa) cho đến khi cụm từ này được xóa khỏi quy tắc ứng xử của công ty vào khoảng tháng 5 năm 2018, nhưng lại được đưa vào trở lại ngày 31 tháng 7 năm 2018.[8][9]


                    Mục lục
                    1	Lịch sử
                    1.1	Ban đầu
                    1.2	Tài chính (1998) và chào bán công khai lần đầu (2004)
                    1.3	Phát triển
                    1.4	2013 trở đi
                    1.5	Mua lại và hợp tác
                    1.5.1	2000-2009
                    1.5.2	2010-Hiện tại
                    1.6	Trung tâm dữ liệu Google
                    1.7	Alphabet
                    1.8	Phát hành cổ phiếu lần đầu
                    2	Sự phát triển
                    3	Các thương vụ mua bán và sự cộng tác
                    3.1	Các thương vụ mua bán
                    3.2	Sự cộng tác
                    4	Sản phẩm và dịch vụ
                    4.1	Quảng cáo
                    4.2	Công cụ tìm kiếm
                    4.3	Dịch vụ doanh nghiệp
                    4.3.1	Vườn ươm doanh nghiệp
                    4.4	Dịch vụ tiêu dùng
                    4.4.1	Dịch vụ dựa trên web
                    4.4.2	Phần mềm
                    4.4.3	Phần cứng
                    4.5	Dịch vụ Internet
                    4.6	Sản phẩm khác
                    4.7	API
                    4.8	Các trang web khác
                    4.9	Ứng dụng
                    4.10	Sản phẩm phục vụ kinh doanh
                    5	Các dịch vụ chính
                    5.1	Chương trình
                    5.2	Ứng dụng để bàn
                    6	Chỉ trích
                    7	Tham khảo
                    8	Liên kết ngoài
                    Lịch sử
                    Bài chi tiết: Lịch sử Google
                    Ban đầu

                    Trang chủ ban đầu của Google có thiết kế đơn giản vì những người sáng lập công ty có ít kinh nghiệm về HTML, ngôn ngữ đánh dấu được sử dụng để thiết kế các trang web.
                    Google ban đầu là một công trình nghiên cứu của Larry Page và Sergey Brin, hai nghiên cứu sinh bằng tiến sĩ tại trường Đại học Stanford, California vào tháng 1 năm 1996.

                    Trong khi các công cụ tìm kiếm thông thường xếp hạng kết quả bằng cách đếm số lần tìm kiếm xuất hiện trên trang, hai lý thuyết đã đưa ra giả thuyết về một hệ thống tốt hơn phân tích mối quan hệ giữa các trang web. Họ gọi công nghệ mới này là PageRank; nó xác định mức độ liên quan của một trang web theo số lượng trang và tầm quan trọng của những trang được liên kết trở lại trang web gốc.

                    Page và Brin ban đầu đặt biệt danh cho công cụ tìm kiếm mới của họ là "BackRub" (Gãi lưng) tại vì hệ thống này dùng các liên kết đến để ước tính tầm quan trọng của trang. Họ cũng tin rằng những trang có nhiều liên kết đến nhất từ các trang thích hợp khác sẽ là những trang thích hợp nhất. Cuối cùng, họ đã đổi tên thành Google; tên của công cụ tìm kiếm bắt nguồn từ một lỗi chính tả của từ "googol" có nghĩa là số 1 ​​đầu và theo sau là 100 số không, được chọn để biểu thị rằng công cụ tìm kiếm nhằm cung cấp số lượng lớn thông tin. Ban đầu, Google hoạt động dưới trang web của đại học Stanford với các tên miền google.stanford.edu và z.stanford.edu. Họ đã quyết định thử nghiệm giả thuyết trong nghiên cứu của họ, tạo nền móng cho công cụ Google hiện đại bây giờ. Tên miền www.google.com được đăng ký ngày 15 tháng 9 năm 1997. Họ chính thức thành lập công ty Google, Inc. ngày 4 tháng 9 năm 1998 tại một ga ra của nhà Susan Wojcicki (được thuê làm nhân viên đầu tiên của Google, Phó Chủ tịch cấp cao, phụ trách bộ phận quảng cáo) tại Menlo Park, California.

                    Tài chính (1998) và chào bán công khai lần đầu (2004)

                    Máy chủ đầu tiên của Google.
                    Google ban đầu được tài trợ bởi khoản đóng góp 100.000 đô la tháng 8 năm 1998 từ Andy Bechtolsheim, đồng sáng lập của Sun Microsystems; tiền đã được đưa ra trước khi Google được hợp nhất. Google đã nhận được tiền từ ba nhà đầu tư thiên thần khác vào năm 1998: Jeff Bezos, người sáng lập Amazon.com, giáo sư khoa học máy tính David Cheriton và doanh nhân Ram Shriram.

                    Sau một số khoản đầu tư nhỏ, từ cuối năm 1998 đến đầu năm 1999, một vòng tài trợ mới trị giá 25 triệu đô la đã được công bố vào ngày 7 tháng 6 năm 1999, với các nhà đầu tư lớn bao gồm các công ty đầu tư mạo hiểm Kleiner Perkins và Sequoia Capital.[10][11]

                    Đầu năm 1999, Brin và Page quyết định họ muốn bán Google cho Excite. Họ đã đến gặp CEO Excite George Bell và đề nghị bán nó cho anh ta với giá 1 triệu đô la. Anh từ chối lời đề nghị. Vinod Khosla, một trong những nhà đầu tư mạo hiểm của Excite, đã nói họ giảm xuống còn 750.000 đô la, nhưng Bell vẫn từ chối.

                    Chào bán công khai ban đầu của Google (IPO) diễn ra năm năm sau đó, vào ngày 19 tháng 8 năm 2004. Vào thời điểm đó, Larry Page, Serge Brin và Eric Schmidt đã đồng ý làm việc cùng nhau tại Google trong 20 năm, cho đến năm 2024.

                    Tại đợt IPO, công ty đã chào bán 19.605.052 cổ phiếu với mức giá 85 USD/cổ phiếu. Cổ phần đã được bán theo một hình thức đấu giá trực tuyến bằng cách sử dụng một hệ thống được xây dựng bởi Morgan Stanley và Credit Suisse, người bảo lãnh cho thỏa thuận này. Việc bán 1,67 tỷ đô la đã mang lại cho Google vốn hóa thị trường hơn 23 tỷ đô la. Đến tháng 1 năm 2014, vốn hóa thị trường của nó đã tăng lên 397 tỷ đô la. Phần lớn trong số 271 triệu cổ phiếu vẫn nằm dưới sự kiểm soát của Google và nhiều nhân viên của Google đã trở thành triệu phú ngay lập tức. Yahoo!, một đối thủ cạnh tranh của Google, cũng được hưởng lợi vì sở hữu 8.4 triệu cổ phiếu Google trước khi IPO diễn ra.

                    Đã có những lo ngại rằng IPO của Google sẽ dẫn đến những thay đổi trong văn hóa công ty. Lý do dao động từ áp lực của cổ đông đối với việc giảm lợi ích của nhân viên cho đến việc nhiều giám đốc điều hành của công ty sẽ trở thành triệu phú ngay lập tức. Để trả lời cho mối quan tâm này, đồng sáng lập Brin và Page đã hứa trong một báo cáo cho các nhà đầu tư tiềm năng rằng IPO sẽ không thay đổi văn hóa của công ty. Năm 2005, các bài báo trên The New York Times và các nguồn khác bắt đầu cho thấy Google đã mất đi tính chống đối, không có triết lý độc ác. Trong nỗ lực duy trì văn hóa độc đáo của công ty, Google đã chỉ định một Giám đốc Văn hóa, người cũng là Giám đốc Nhân sự. Mục đích của Giám đốc Văn hóa là phát triển và duy trì văn hóa và làm việc theo những cách để giữ đúng với các giá trị cốt lõi mà công ty được thành lập: một tổ chức phẳng với môi trường hợp tác hòa nhập. Google cũng đã phải đối mặt với các cáo buộc về chủ nghĩa phân biệt giới tính và tuổi tác từ các nhân viên cũ. Vào năm 2013, một vụ kiện tập thể chống lại một số công ty ở Thung lũng Silicon, bao gồm Google, đã được đệ trình vì các thỏa thuận đã hạn chế việc tuyển dụng nhân viên công nghệ cao.

                    Cổ phiếu hoạt động tốt sau IPO, với cổ phiếu lần đầu tiên đạt 350 đô la vào ngày 31 tháng 10 năm 2007, chủ yếu vì doanh thu và thu nhập mạnh mẽ trên thị trường quảng cáo trực tuyến. Sự tăng vọt của giá cổ phiếu được thúc đẩy chủ yếu bởi các nhà đầu tư cá nhân, trái ngược với các nhà đầu tư tổ chức lớn và các quỹ tương hỗ. Cổ phiếu GOOG được chia thành cổ phiếu GOOG loại C và cổ phiếu GOOGL loại A. Công ty được liệt kê trên sàn giao dịch chứng khoán NASDAQ với các ký hiệu GOOGL và GOOG và trên sàn giao dịch chứng khoán Frankfurt dưới ký hiệu GGQ1. Các ký hiệu này hiện đề cập đến công ty cổ phần của Alphabet Inc., kể từ quý IV năm 2015.
                   </textarea>     
                   <div class="fadeout"></div> 
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
    </div>
</body>
    <script>
        function textResize() {
        var elmnt = document.getElementById("input-des");
        var y = elmnt.scrollHeight;
        var x = elmnt.scrollWidth;
        var height = y+"px";
        if(document.getElementById("ch").checked) {
            elmnt.style.height = height;   
        }
        else{
            elmnt.style.height = "200px" ;
        }
      }
      function editMode(){
          var btn = document.getElementById("activate-edit");
          var elmnt = document.getElementById("input-des");
          var la = document.getElementById("la");
          var y = elmnt.scrollHeight;
          var height = y+"px";
          if(btn.innerHTML === "Change to Edit Mode"){
            elmnt.style.height = height;
            elmnt.removeAttribute("readonly");  
            elmnt.style.borderWidth = "1px";
            la.style.display = "none";
            btn.innerHTML = "Change to View Mode";
          }
          else{
            elmnt.style.height = null;
            elmnt.readOnly = true;  
            elmnt.style.borderWidth = null;
            la.style.display = null;
            btn.innerHTML = "Change to Edit Mode";
          }
         
      }
    </script>
</html>