<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart page</title>
</head>
 <style><%@include file="/resources/css/global.css"%></style>
  <style><%@include file="/resources/css/cart.css"%></style>
<body>
 ${message}
 <div class="container-full">
      <div class="full">
        <div class="navbar">
          <img alt="" src="./resources/img/logo.svg">
          <ul>
            <li><a href="home">Home</a></li>
            <li><a href="events">Events</a></li>
            <div class="login">
              <li>
                <a href="login">Login /<span>Register</span></a>
              </li>
            </div>
          </ul>
        </div>
      </div>
      <div class="content">
        <div class="left-column">
     
          </div>  
        <div class="right-column">
          <div class="buy" style="margin-top: 50px">
            <div>Numero biglietti</div>
            
            <div id="buyQuantity">1</div>
          </div>
          <div class=categoria-select>
          <select name="categorie-tariffa" id="categoriaTariffa"></select>
          </div>
          <div class="buy">
            <div>Totale</div>
            <div id="buyPrice">20Euro</div>
          </div>
          
          
    <div class="filter-btn" >Buy Now</div>
    
  
        </div>
      </div>
    </div>
 
    <div class="superpopup">
      <div class="popup">
        <button class="close" onclick="closePopup()">&times;</button>
        <h1>Sicuro di eliminare?</h1>

        <input type="submit" value="Delate" class="confirm"/>
      </div>
    </div>

    <script>
      // card - delete - click - openpopup - delete - card.remove()
	
     const categorie_tariffa = ${categorie_tariffa} 
      console.log(categorie_tariffa);
      
      const categorieSelect = document.querySelector("#categoriaTariffa");
      
      for(var i = 0; i < categorie_tariffa.length; i++){
    	  var option = document.createElement("option");
    	  option.value = categorie_tariffa[i].categoria_tariffa;
			option.setAttribute("id_categoria_tariffa", categorie_tariffa[i].id_categoria_tariffa)
			option.setAttribute("moltiplicatore_tariffa", categorie_tariffa[i].moltiplicatore_tariffa)
    	  // Aggiunta del testo all'elemento <option>
			option.textContent = categorie_tariffa[i].categoria_tariffa;
			categorieSelect.appendChild(option);
      }
      
      const tickets1 = localStorage.getItem("tickets");
      const tickets = JSON.parse(tickets1);
      console.log(tickets);
      
      const eventSelected1 = localStorage.getItem("eventSelected");
      const eventSelected = JSON.parse(eventSelected1);
      const cardsContainer = document.querySelector(".left-column");
      var ticketQuantity = 0;
      var ticketPrice = 0;
      for(var k = 0; k < tickets.length; k++) {
    	  ticketQuantity = parseInt(tickets[k].quantity) + ticketQuantity;
    	  ticketPrice = parseInt(tickets[k].price) + ticketPrice;
    	// Creazione dell'elemento <div> con la classe "card"
    	  var card = document.createElement("div");
    	  card.className = "card";
			card.setAttribute("FK_id_categoria_tariffa", "1")
			card.setAttribute("FK_id_posto_evento", tickets[k].id_posto_evento)
			card.setAttribute("originalPrice", tickets[k].price)
    	  // Creazione dell'elemento <div> con la classe "image"
    	  var imageDiv = document.createElement("div");
    	  imageDiv.className = "image";

    	  // Creazione dell'elemento <img> con l'attributo src e alt
    	  var image = document.createElement("img");
    	  image.src = eventSelected.imgSrc;
    	  image.alt = "";

    	  // Aggiunta dell'elemento <img> all'elemento <div> con la classe "image"
    	  imageDiv.appendChild(image);

    	  // Creazione dell'elemento <div> con la classe "box-info"
    	  var boxInfo = document.createElement("div");
    	  boxInfo.className = "box-info";

    	  // Creazione dell'elemento <div> con la classe "info"
    	  var info = document.createElement("div");
    	  info.className = "info";

    	  // Creazione dell'elemento <div> con la classe "name-event"
    	  var nameEvent = document.createElement("div");
    	  nameEvent.className = "name-event";
    	  nameEvent.textContent = eventSelected.eventName;

    	  var quantity = document.createElement("div");
    	  quantity.className = "quantity";
    	  quantity.textContent = "quantità posti"

    	  // Creazione dell'elemento <div> con la classe "enters"
    	  var enters = document.createElement("div");
    	  enters.className = "enters";
    	  enters.textContent = eventSelected.eventDate;

    	  // Aggiunta degli elementi <div> con le classi appropriate all'elemento <div> con la classe "info"
    	  info.appendChild(nameEvent);
    	  info.appendChild(quantity);
    	  info.appendChild(enters);

    	  // Creazione dell'elemento <div> con la classe "price-info"
    	  var priceInfo = document.createElement("div");
    	  priceInfo.className = "price-info";

    	  // Creazione dell'elemento <div> con la classe "price"
    	  var price = document.createElement("div");
    	  price.className = "price";
    	  price.textContent = tickets[k].price;
    	  

    	  // Creazione dell'elemento <div> con la classe "price"
    	  var quantity = document.createElement("div");
    	  quantity.className = "quantita_posti";
    	  quantity.textContent = tickets[k].quantity;

    	  // Creazione del pulsante <button> con la classe "delete" e l'ID "open"
    	  var button = document.createElement("button");
    	  button.className = "delete";
    	  button.id = "open";
    	  button.textContent = "Delete";

    	  // Aggiunta degli elementi <div> con le classi appropriate all'elemento <div> con la classe "price-info"
    	  priceInfo.appendChild(price);
    	  priceInfo.appendChild(quantity);
    	  priceInfo.appendChild(button);

    	  // Aggiunta degli elementi creati all'elemento <div> con la classe "card"
    	  boxInfo.appendChild(info);
    	  boxInfo.appendChild(priceInfo);
    	  card.appendChild(imageDiv);
    	  card.appendChild(boxInfo);

    	  cardsContainer.appendChild(card);
      }
      
      
    var cards = document.querySelectorAll(".card")

    cards.forEach(element => {
    var btn = element.querySelector(".delete");
    btn.addEventListener("click", ()=>{openPopUp(element)});
    });

     
      const buyQuantity = document.querySelector("#buyQuantity");
      const buyPrice = document.querySelector("#buyPrice");
      console.log(buyQuantity);
      console.log(buyPrice);
      buyQuantity.textContent = ticketQuantity;
      

      buyPrice.textContent = ticketPrice;

      categorieSelect.addEventListener('change', function handleChange(event) {
    	  let prezzoTot = 0;
    	  const moltiplicatore = categorieSelect.options[categorieSelect.selectedIndex].getAttribute('moltiplicatore_tariffa');
    	  const idCategoria = categorieSelect.options[categorieSelect.selectedIndex].getAttribute('id_categoria_tariffa');
    	  for(var i = 0; i< cards.length; i++){
    		  cards[i].setAttribute("FK_id_categoria_tariffa", idCategoria)
    		  console.log(cards[i].querySelector(".price"));
    		  const cardPrice = parseInt(cards[i].querySelector(".price").textContent);
    		  cards[i].querySelector(".price").textContent = parseFloat(cards[i].getAttribute("originalPrice")) * parseFloat(moltiplicatore);
    		  prezzoTot = prezzoTot + (parseFloat(cards[i].getAttribute("originalPrice")) * parseFloat(moltiplicatore));
    	  }
  		
  		console.log(parseInt(ticketPrice) * parseInt(moltiplicatore));
  		buyPrice.textContent = prezzoTot;
	  });
      

      const buyNowBtn = document.querySelector(".filter-btn");
            buyNowBtn.addEventListener("click", () => {
          	  let ticketString = "";
          	  for(var i = 0; i< cards.length; i++){
          		  const FK_id_categoria_tariffa = cards[i].getAttribute("FK_id_categoria_tariffa");
          		  const FK_id_posto_evento = cards[i].getAttribute("FK_id_posto_evento");
          		  const prezzo_finale = cards[i].querySelector(".price").textContent;
          		  const quantita_posti = cards[i].querySelector(".quantita_posti").textContent;
          		  ticketString = ticketString + FK_id_categoria_tariffa + "-" + FK_id_posto_evento  + "-" + prezzo_finale + "-" + quantita_posti;
      				if(i != cards.length - 1){
      				{
      					ticketString = ticketString + ",";
      				}
          	  }
          	  console.log(ticketString)
          	  localStorage.setItem("tickets", ticketString);
                window.location.href = "payment";
            }
         })
    </script>

</body>
</html>