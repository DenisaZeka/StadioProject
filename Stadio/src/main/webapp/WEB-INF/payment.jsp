<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
 <style><%@include file="/resources/css/payment.css"%></style>
<body>
   <div class="container">

    <div class="form">
      <button class="close-btn">&times;</button>
      <h1>Payment Form</h1><br>
      <form action="" method="POST">
        <div class="big">
          <div class="small">
            <!-- <label for="name">Owner name:</label> -->
            <input type="text" id="name" name="name" required placeholder="Owner's Name" />
          </div>
          <div class="small">
            <!-- <label for="name">Owner surname:</label> -->
            <input type="text" id="surname" name="surname" required placeholder="Owner's Surname" />
          </div>
        </div>
        <div class="big">
          <div class="small">
            <!-- <label for="card_number">Card Number:</label> -->
            <input type="text" id="card_number" name="card_number" required placeholder="Card Number" />
          </div>
          <div class="small">
            <!-- <label for="expiration_date">Expiration Date:</label> -->
            <input type="text" id="expiration_date" name="expiration_date" required placeholder="Expiration Date" />
          </div>
        </div class="big">
        <div class="small">
          <!-- <label for="cvv">CVV:</label> -->
          <input type="text" id="cvv" name="cvv" required placeholder="CVV" />
        </div>
        
    <span class="btn_final_buy">Pay now</span>
  </div>
  
<script>
const tickets = localStorage.getItem("tickets");
function showPaymentSuccessAlert() {
  alert("Payment went successful"); // Display the pop-up alert
  window.location.href="pay?tickets="+tickets;
}

document.querySelector(".btn_final_buy").addEventListener("click", () => {
	
	showPaymentSuccessAlert();
	//pay
})

</script>

<style>
.btn_final_buy {
  padding: 10px;
  background-color: white;
  color: black;
}
</style>
</body>
</html>
