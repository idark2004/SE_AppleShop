
			
			

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }
            function Loginstart(){
                currentSlide(1);
                setTimeout(function(){alert("Login Success");},500)
            }
            function Signupstart(){
                alert("SignUp Success");
            }
            function showSlides(n) {
				
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                if (n > slides.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = slides.length
                }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
            }
            function showMore(){
                //var needToShowMoreText = document.getElementsByClassName("description__detail");
                //document.getElementsByClassName("description__detail").style.color = "red";
                //document.getElementsByClassName("description__detail").style.overflow = "auto";
               // ​$(".description__detail").css("-webkit-line-clamp", "2");​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​
                // $(".description__detail").css("overflow", "auto");
                // $(".description__detail").css("text-overflow", "unset");
                // $(".description__detail").css("-webkit-line-clamp", "unset");
                
            }
            function myFunction() {
                var dots = document.getElementById("dots");
                var moreText = document.getElementById("more");
                var btnText = document.getElementById("myBtn");
              
                if (dots.style.display === "none") {
                  dots.style.display = "inline";
                  btnText.innerHTML = "Read more";
                  moreText.style.display = "none";
                } else {
                  dots.style.display = "none";
                  btnText.innerHTML = "Read less";
                  moreText.style.display = "inline";
                }
              }
              
            var loadFile = function(event) {
                var image = document.getElementById('output');
                image.src = URL.createObjectURL(event.target.files[0]);
            };
            function myFunction() {
                var dots = document.getElementById("dots");
                var moreText = document.getElementById("more");
                var btnText = document.getElementById("myBtn");
              
                if (dots.style.display === "none") {
                  dots.style.display = "inline";
                  btnText.innerHTML = "Read more";
                  moreText.style.display = "none";
                } else {
                  dots.style.display = "none";
                  btnText.innerHTML = "Read less";
                  moreText.style.display = "inline";
                }
              }
			function output(){
                var rates = document.getElementsByName('number');
                var rate_value = document.getElementById('outputvalue');
                for(var i = 0; i < rates.length; i++){
                    if(rates[i].checked){
                        rate_value.innerHTML = rates[i].value;
                    }
                }
                
                //var rates = document.getElementById('rates').value;
            }
            $('#myForm input').on('change', function() {
                alert($('input[name=number]:checked', '#myForm').val()); 
             });
             function priceChange(){
                 var price = document.getElementsByName('hardware');
                 
                 var output = document.getElementById('priceOfproduct');
                 for(var i = 0; i < price.length; i++){
                    if(price[i].checked){
                        var res = price[i].value.split("-");
                        output.innerHTML = Intl.NumberFormat('de-DE', { style: 'currency', currency: 'VND' }).format(res[2]) ;
                    }
                }
             }

             $('.hardware__lable span p').click(function(){
                var t= $(this).val;
                alert(t);
            });

            $('span').click(function(){ 
                alert($(this).attr("id")); 
              }); 
              function getId(element){
        
                var id =$(element).attr('id');
                
                }
		