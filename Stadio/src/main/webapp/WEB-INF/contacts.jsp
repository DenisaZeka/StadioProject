<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <style><%@include file="/resources/css/contacts.css"%></style>
 <style><%@include file="/resources/css/global.css"%></style>
</head>
<body>
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

    <div class="main">
        <div class="main-container">
          <div class="text-container">
            <span class="title">Contact us</span>
            <span class="subtext">Need to get in touch with us? Either fill out the form with your inquiry.</span>
          </div>
          <div class="form-container">
            <form ac method="POST" id="form">
              <div class="form-group">
                <label for="email"></label>
                <input type="email" name="email" id="email_id" required placeholder="Email">
              </div>
              <div class="form-group">
                <label for="message"></label>
                <textarea id="message" class="" name="message" placeholder="Message" required ></textarea>
              </div>
              <button id="send" class="message-submit">SEND</button>
            </form>
          </div>
        </div>
      </div>

</body>
</html>