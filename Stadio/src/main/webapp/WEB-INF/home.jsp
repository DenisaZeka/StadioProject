<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
 <style><%@include file="/resources/css/global.css"%></style>
 <style><%@include file="/resources/css/home.css"%></style>
</head>
<body>
<script>
function redirectToTicket() {
    window.location.href = "events";
  }
</script>


 	<div class="full">
      <div class="navbar">
      <img alt="" src="./resources/img/logo.svg">
        <ul>
          <li><a href="home">Home</a></li>
          <li><a href="events">Events</a></li>
           <li><a href="contacts">Contacts</a></li>
          <div class="login"><li><a href="login">Login /<span>Register</span></a></li>
          </div>      
        </ul>
      </div>
    </div>
    <div class="allin">
<% if (session.getAttribute("password") != null) { %>
  <div class="msg-important">${message}</div>
<% } %>

<div class="enjoy">Enjoy life with one ticket</div>
    <div class="text-container">
      <span>b</span>
      <span>u</span>
      <span>y</span>
      <span>-</span>
      <span>n</span>
      <span>o</span>
      <span>w</span>
    </div>
      <div class="button-clickb">
        <button class="button-click" onclick="redirectToTicket()" onclick="changeColor()">Ticket</button>
      </div>
      </div>
    </div>
    
    <div class="hits">
      <div class="hits-img">

        <div class="image-container">
          <a href="ticket"><img src="https://th.bing.com/th/id/OIP.pNVTgJe_8oxYqDv8ahJIZQHaEg?pid=ImgDet&rs=1" alt="">
          <h3>The Weekend</a></h3>
        </div>

        <div class="image-container">
          <a href="ticket"><img src="./resources/img/arcticmonkeys.jpg">
          <h3>Arctic Monkeys</a></h3>
        </div>

        <div class="image-container">
          <a href="ticket"><img src="https://th.bing.com/th/id/OIP.-Q8tR7OnxBjNWZOLig2BRgHaEr?pid=ImgDet&rs=1" alt="">
          <h3>Maneskin</a></h3>
        </div>

        <div class="image-container">
          <a href="ticket"><img src="https://th.bing.com/th/id/R.e7dabede4d4caff71790963fec301702?rik=EmqwycPiuW1cxQ&pid=ImgRaw&r=0" alt="">
          <h3>Pinguini tattici nucleari</a></h3>
        </div>
      </div>
    </div>
    <footer>
      <div>
        <p>
          &copy; 2023 Rozzano Stadium. Tutti i diritti riservati. | P.IVA
          1234567890
        </p>
        <p>Via dello Sport, 123 - 20148 Rozzano (MI) Italia</p>
        <p>
          Tel: +39 0123456789 | Email:
          <a href="mailto:info@rozzanostadium.com">info@rozzanostadium.com</a>
        </p>
      </div>

      <div>
        <p>Seguici sui social media:</p>
        <ul>
          <li>
            <a href="https://www.facebook.com/rozzanostadium">Facebook</a>
           
          </li>
          <li><a href="https://twitter.com/rozzanostadium">Twitter</a></li>
          <li>
            <a href="https://www.instagram.com/rozzanostadium">Instagram</a>
          </li>
        </ul>
      </div>

      <div>
        <p>
          <a href="#">Privacy Policy</a> | <a href="#">Termini e condizioni</a>
        </p>
      </div>
    </footer>
</body>
</html>