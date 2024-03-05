<%@page import="com.project.bean.Eventi, java.util.*"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket Page</title>
   <style><%@include file="/resources/css/ticket.css"%></style>
    <style><%@include file="/resources/css/global.css"%></style>
    
</head>
<body>
 <div class="navbar">
   <img alt="" src="./resources/img/logo.svg">
      <ul>
        <li><a href="home">Home</a></li>
        <li><a href="events">Events</a></li>
        <li><a href="contacts">Contacts</a></li>
        <div class="login">
          <li>
            <a href="login" id="register-link"
              >Login /<span>Register</span></a
            >
          </li>
        </div>
      </ul>
    </div>
    <div class="container">
      <div class="filters-container">
        <div class="filter-section">
          <span class="filter-title">Event category</span>
          <select name="category" id="category">
            <option value="all" class="option" id="category">all</option>
            <option value="" class="option" id="category">concert</option>
            <option value="" class="option" id="category">
              theater performance
            </option>
            <option value="" class="option" id="category">
              exhibition/showcase
            </option>
            <option value="" class="option" id="category">
              film screening
            </option>
            <option value="" class="option" id="category">sports event</option>
          </select>
        </div>
        <div class="filter-section">
          <span class="filter-title">Event date</span>
          <div class="date-container">
            <select name="month" id="month">
              <option value="all" class="option" id="month">all</option>
              <option value="" class="option" id="month">january</option>
              <option value="" class="option" id="month">february</option>
              <option value="" class="option" id="month">march</option>
              <option value="" class="option" id="month">april</option>
              <option value="" class="option" id="month">may</option>
              <option value="" class="option" id="month">june</option>
              <option value="" class="option" id="month">july</option>
              <option value="" class="option" id="month">august</option>
              <option value="" class="option" id="month">september</option>
              <option value="" class="option" id="month">october</option>
              <option value="" class="option" id="month">november</option>
              <option value="" class="option" id="month">december</option>
            </select>
            <select name="year" id="year">
              <option value="all" class="option" id="year">all</option>
              <option value="" class="option" id="year">2023</option>
              <option value="" class="option" id="year">2024</option>
              <option value="" class="option" id="year">2025</option>
              <option value="" class="option" id="year">2026</option>
            </select>
          </div>
        </div>
        <div class="filter-section">
          <span class="filter-title">Event price</span>
          <span class="filter-subtitle" id="price-text limits"
            ><span id="min">10</span><span class="max">100</span></span
          >
          <input
            type="range"
            name="price"
            id="price"
            min="10"
            max="100"
            value="50"
          />
          <span class="filter-subtitle" id="price-text"></span>
        </div>
        <div class="filter-btn">FILTER</div>
      </div>
      <div class="events-container">
      
         <% 
         
         List<Eventi> eventi=(List<Eventi>)request.getAttribute("eventi");
         
         
         for(int i = 0;i <eventi.size(); i++){
             Eventi e = eventi.get(i); 
         %>
        
        <div class="event-card" id_evento="<%=e.getId_evento()%>">
          <div class="event-img">
         
        
            <img
              src="<%=e.getImmagine_evento()%>"
              alt=""
            />
          </div>
          <div class="event-descritpion">
          <span class="event-title" id="event-name"><%= e.getNome_evento()%></span>
		  <span class="event-title" id="event-date"><%= e.getData_ora_evento()%></span>
          <span class="event-title" id="event-price"><%=e.getPrezzo_base_evento()%></span>
         
          </div>
          <div class="event-btn" onclick="bookNow(event)">BOOK NOW</div>
        </div>
       
         <% } %>
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

<script>
var slider = document.getElementById("price");
var output = document.getElementById("price-text");
output.innerHTML = "$ 10 - $ " + slider.value; // Display the default slider value

// Update the current slider value (each time you drag the slider handle)
slider.oninput = function () {
  output.innerHTML = "$ 10 - $ " + this.value;
};

function bookNow(event) {
  var eventCard = event.currentTarget.parentNode;
  console.log(eventCard);
  var eventId = eventCard.getAttribute("id_evento");
  console.log(eventId);
  var imgSrc = eventCard.querySelector(".event-img img").src;
  var eventName = eventCard.querySelector(
    ".event-title#event-name"
  ).textContent;
  var eventDate = eventCard.querySelector(
    ".event-title#event-date"
  ).textContent;
  var eventPrice = eventCard.querySelector(
    ".event-title#event-price"
  ).textContent;

  const eventObjetct = {
    eventId: eventId,
    imgSrc: imgSrc,
    eventName: eventName,
    eventDate: eventDate,
    eventPrice: eventPrice,
  };

  localStorage.setItem("eventSelected", JSON.stringify(eventObjetct));

  window.location.href="settori";
}
</script>
</html>