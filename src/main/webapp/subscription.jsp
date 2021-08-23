<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Payment Gateway</title>
    <style>
    	.box1{
    		float :left;
    		margin-right :5%;
    	}
    
    </style>
  </head>
  <body>
    <div class="container">
    	<div class="card box1" style="width: 18rem;">
		  <img class="card-img-top" src="razorpay.png" alt="Card image cap">
		  <div class="card-body">
		    <h5 class="card-title">Starter Plan (Rs. 500)</h5>
		    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		    <a href="#" class="btn btn-primary" onclick="paynow(500)">Pay Now</a>
		  </div>
		</div>
		
		<div class="card box1" style="width: 18rem;">
		  <img class="card-img-top" src="razorpay.png" alt="Card image cap">
		  <div class="card-body">
		    <h5 class="card-title">Silver Plan (Rs. 1000)</h5>
		    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		    <a href="#" class="btn btn-primary" onclick="paynow(1000)">Pay Now</a>
		  </div>
		</div>
		
		<div class="card box1" style="width: 18rem;">
		  <img class="card-img-top" src="razorpay.png" alt="Card image cap">
		  <div class="card-body">
		    <h5 class="card-title">Golden Plan (Rs. 2000)</h5>
		    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		    <a href="#" class="btn btn-primary" onclick="paynow(2000)">Pay Now</a>
		  </div>
		</div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.0.js" ></script>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script type="text/javascript">
    	function paynow(amount)
    	{
    		
    		$.ajax({
    			url:"subscription",
    			type:"POST",
    			data: {"amount": amount, "mobileno":"9831710104"},
    			success:function(result){
    				//alert(result);
				 var options = {
    				
    			    "key": "rzp_test_mQNHOsozLYW5D0", // Enter the Key ID generated from the Dashboard
    			    "amount": amount*100, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    			    "currency": "INR",
    			    "name": "Acme Corp",
    			    "description": "Test Transaction",
    			    "image": "razorpay.png",

    			    "handler": function (response){
    			    	/*alert(response);
    			        alert(response.razorpay_payment_id);
    			        alert(response.razorpay_order_id);
    			        alert(response.razorpay_signature);*/
    			        
    			        $.ajax({
    			        	url:"subscription",
    		    			type:"POST",
    		    			data: {"transactionid": response.razorpay_payment_id, "mobileno":"9831710104"},
    		    			success:function(result){
    		    				window.location.href="thankyou.jsp";
    		    			}
    			        });
    			    }
    			};
    			var rzp1 = new Razorpay(options);
    			rzp1.open();
    				
    			},
    			error: function(error){
    				console.log(error);
    			}
    		});
    		
    		
    	}
    
    
    </script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>