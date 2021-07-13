
			
	
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
//            $('#myForm input').on('change', function() {
//                alert($('input[name=number]:checked', '#myForm').val()); 
//             });
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
            function PrevPage(){
                window.history.back();
            } 
            $(window).on( 'load', function() {
                alert("hhll");
              });    
            $( document ).ready(function() {
             alert("hhll11111");
            });  
		