<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Java ticket project</title>
 <style><%@include file="/resources/css/login.css"%></style>
  <style><%@include file="/resources/css/global.css"%></style>
</head>
<body>

<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">


  <div class="full">
    <div class="navbar">
      <img alt="" src="./resources/img/logo.svg">
      <ul>
        <li><a href="home">Home</a></li>
        <li><a href="events">Events</a></li>
        <li><a href="contacts">Contacts</a></li>
        <div class="login">
        <li><a href="login" id="register-link">Login /<span>Register</span></a></li>
        </div>
      </ul>
    </div>
  </div>
  <div class="log-in" id="login-form">

    <div class="main-head">
    
      <h2 class="second-text"><span style="color:white;">Log in now </span>${message}</h2>
      <h2 class="second-text"><span style="color:white;"></span></h2>
      
        
      
    </div>

    <form action="check-login" method="get">
      <input type="text" id="email" name="email" style="color: black;" value="" placeholder="Enter your email">
      <input type="text" id="password" name="password" style="color: black;" placeholder="Enter your password">
      <button type="submit" id="submit">Submit</button>
      <ul style="list-style: none;">
        <li><a href="#" id="register-toggle" style="color: white;">New user/Register now</a></li>
       <div class=log-out><li><a href="logout" id="logOut">Log Out</a></li></div>
       
        
        <!--  --> 
      </ul>
      
    </form>
  </div>

  <div class="log-in" id="registration-form" style="display: none;">
    <div class="main-head">
      <h2 class="second-text"><span style="color: white; margin-bottom: 40px;">Register now </span></h2>
    </div>

    <!-- registration structure here -->
  
    <form action="registration" method="post">
     <input type="text" id="nome" name="nome" style="color: black;" placeholder="Enter your nome">
      <input type="text" id="cognome" name="cognome" style="color: black;" placeholder="Enter your cognome">
      <input type="email" id="email" name="email" style="color: black;" placeholder="Enter your email">
      <input type="password" id="password" name="password" style="color: black;" placeholder="Enter your password">
      <input type="text" id="codice_fiscale" name="codice_fiscale" style="color: black;" placeholder="Enter your codice_fiscale">
      <button type="submit" id="register-submit">Register</button>
    </form>
  </div>
<div class=logout>

</div>
</div>

<script>
  const loginForm = document.getElementById("login-form");
  const registrationForm = document.getElementById("registration-form");
  const registerLink = document.getElementById("register-link");
  const registerToggle = document.getElementById("register-toggle");

  registerToggle.addEventListener("click", function(event) {
    event.preventDefault();
    loginForm.style.display = "none";
    registrationForm.style.display = "block";
    document.getElementById("reg-username").value = ""; 
  });

  registerLink.addEventListener("click", function(event) {
    event.preventDefault();
    loginForm.style.display = "none";
    registrationForm.style.display = "block";
    document.getElementById("reg-username").value = "";
  });
  
 
  const logOutLink = document.getElementById("logOut");

  logOutLink.addEventListener("click", function(event) {
    event.preventDefault();
    showConfirmationPopup();
  });

  function showConfirmationPopup() {
    const confirmLogout = confirm("Are you sure you want to log out?");

    if (confirmLogout) {
      window.location.href = "logout";
    }
  }

</script>
</body>
</html>