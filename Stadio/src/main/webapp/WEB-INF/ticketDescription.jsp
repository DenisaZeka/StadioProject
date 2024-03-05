<%@page import="com.project.bean.Posti_evento"%>
<%@page import="com.project.bean.Settori_e_sottosettori, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket description page</title>
 <style><%@include file="/resources/css/description.css"%></style>
  <style><%@include file="/resources/css/global.css"%></style>
  <style><%@include file="/resources/css/pitch.css"%></style>
</head>
<body>
 ${message}
    <div class="full-page">
        <div class="full">
            <div class="navbar">
              <img alt="" src="./resources/img/logo.svg">
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="events">Events</a></li>
                    <li><a href="contacts">Contacts</a></li>
                    <div class="login"><li><a href="login">Login /<span>Register</span></a></li></div>
                </ul>
            </div>
        </div>
    
        <div class="all">
            <div class="img-cart">
                <img src="${imgSrc}" alt="" width="250">
            </div>
            
    
            <div class="info">
                <h1>Maneskin-2023</h1>
                <p>lunedi 24 lugio 2023 - H 21:00 | Rozzano Stadio</p>
            </div>
        </div>
        <div class="main-container">
            <div class="pitch-container">
              <div class="stage-container">
                <div class="stage">STAGE</div>
              </div>
              <div class="sectors-container">
                <div class="sectors" id="left">
                  <span class="sector-name">CORRIDOIO OVEST</span>
                  <div class="subsectors-container"></div>
                </div>
                <div class="sectors" id="center">
                  <span class="sector-name">PARTERRE</span>
                  <div class="subsectors-container" id="top"></div>
                </div>
                <div class="sectors" id="right">
                  <span class="sector-name">CORRIDOIO EST</span>
                  <div class="subsectors-container"></div>
                </div>
              </div>
            </div>
            <div class="side-tickets-container">
              <span class="title">TICKETS</span>
              <div class="tickets-container"></div>
              <div class="btn big" id="confirm" onclick="AddtoCart()">CONFIRM</div>
            </div>
          </div>
      
    </div>
    
    <script>
    function AddtoCart() {
    	console.log("clicked confirm");
    	const ticketsContainer = document.querySelector(".tickets-container");
    	if(ticketsContainer.childElementCount == "0"){
    		alert("select a sector");
    	}else{
        	console.log("ticket exsist")
    		const tickets = document.querySelectorAll(".ticket");
    		const ticketArray = [];
    		for(var t = 0; t < tickets.length; t++){
    			const idPosto = tickets[t].getAttribute("id_posto_evento");
    			const price = tickets[t].querySelector(".priceDiv").querySelector("#price").textContent;
    			const quantity = tickets[t].querySelector(".btn-container").querySelector("#quantity").textContent;
    			console.log(idPosto + "-" + price +"-"+quantity);
				const posto = {
						id_posto_evento: idPosto,
						price: price,
						quantity: quantity};
				ticketArray.push(posto);
    		}
    		localStorage.setItem("tickets", JSON.stringify(ticketArray));
    		console.log(ticketArray);
        	window.location.href = 'cart';
    	}
    	}
   
 // Retrieve query parameters from the URL
    const selectedProduct = (localStorage.getItem("eventSelected"));
    const oggeto = JSON.parse(selectedProduct);
    console.log(oggeto);

    const urlParams = new URLSearchParams(window.location.search);
    const imgSrc = oggeto.imgSrc;
    const eventName = oggeto.eventName;
    const eventDate =oggeto.eventDate;
    const eventPrice = oggeto.eventPrice;
    const eventId = oggeto.eventId;
    console.log(eventId);

    // Populate the elements with the received data
    const imgElement = document.querySelector(".img-cart img");
    imgElement.src = imgSrc;

    const eventNameElement = document.querySelector(".info h1");
    eventNameElement.textContent = eventName;

    const eventDateElement = document.querySelector(".info p");
    eventDateElement.textContent = eventDate;

    const eventi = {
        imgSrc:imgSrc,eventName:eventName,eventDate:eventDate,eventPrice:eventPrice

    }
    localStorage.setItem("eventSelected",JSON.stringify(eventi));


    function mappa() {
        window.location.href = 'pitch';
    }


    const settori = ${settori};
    console.log(settori);

    let oggettiFiltrati = [];

    for (var i = 0; i < settori.length; i++) {
    	console.log("enter for")
    	console.log(settori[i])
    	console.log(eventId)
      if (settori[i].evento.id_evento == eventId && settori[i].numero_posti_disponibili_per_sottosettore > 0) {
    		console.log("enter if")
        oggettiFiltrati.push(settori[i]);
      }
    }

    const letters = ["A", "B", "C", "D", "E", "F", "G", "H"];

    const sectorsLeft = document.querySelector(
      ".sectors#left .subsectors-container"
    );
    const sectorsRight = document.querySelector(
      ".sectors#right .subsectors-container"
    );
    const sectorsCenter = document.querySelector(
      ".sectors#center .subsectors-container"
    );
    
    const subsectors = [];

    function createSubsectors(type) {
      if (type === "left") {
        for (let index = 0; index < 5; index++) {
          const subsector = createSubsector(index);
          subsector.setAttribute("position", "Corridoio_Ovest " + letters[index]);
          subsector.innerHTML = letters[index];
          subsector.addEventListener("click", () => {
            const ticketsContainer = document.querySelector(".tickets-container");
            if (subsector.classList.contains("clickable")) {
              if (ticketsContainer.childElementCount == 3) {
                alert("reached maximum number of selected positions");
              } else {
                createTicket(subsector);
              }
            }
          });
          subsectors.push(subsector);
          sectorsLeft.appendChild(subsector);
        }
      }
      if (type === "right") {
        for (let index = 0; index < 5; index++) {
          const subsector = createSubsector(index);
          subsector.setAttribute("position", "Corridoio_Est " + letters[index]);
          subsector.innerHTML = letters[index];
          subsector.addEventListener("click", () => {
            const ticketsContainer = document.querySelector(".tickets-container");
            if (subsector.classList.contains("clickable")) {
              if (ticketsContainer.childElementCount == 3) {
                alert("reached maximum number of selected positions");
              } else {
                createTicket(subsector);
              }
            }
          });
          subsectors.push(subsector);
          sectorsRight.appendChild(subsector);
        }
      }
      if (type === "center") {
        for (let index = 0; index < 8; index++) {
          const subsector = document.createElement("div");
          subsector.classList.add("subsector");
          subsector.setAttribute("position", "Parterre " + letters[index]);
          if (index >= 6) {
            subsector.id = "center-center";
          } else {
            subsector.id = "normal";
          }
          subsector.innerHTML = letters[index];
          subsector.addEventListener("click", () => {
            const ticketsContainer = document.querySelector(".tickets-container");
            if (subsector.classList.contains("clickable")) {
              if (ticketsContainer.childElementCount == 3) {
                alert("reached maximum number of selected positions");
              } else {
                createTicket(subsector);
              }
            }
          });
          subsectors.push(subsector);
          sectorsCenter.appendChild(subsector);
        }
      }
    }

    createSubsectors("center");
    createSubsectors("right");
    createSubsectors("left");

    function createSubsector(x) {
      const subsector = document.createElement("div");
      subsector.classList.add("subsector");
      if (x == 4) {
        subsector.id = "lateral-center";
      }
      return subsector;
    }

    console.log(oggettiFiltrati);

    for (var i = 0; i < oggettiFiltrati.length; i++) {
    	  console.log("enter forn2");
    	  
    	}
    
    function createTicket(subsector) {
      subsector.classList.toggle("clickable");
      const sectorClicked = subsector.getAttribute("position");

      const ticketsContainer = document.querySelector(".tickets-container");
      // Creazione dell'elemento div.ticket
      const ticketDiv = document.createElement("div");
      ticketDiv.className = "ticket";
      ticketDiv.setAttribute("id_posto_evento", subsector.getAttribute("id_posto_evento"));

      // Creazione dell'elemento div.ticket-description-container
      const descriptionContainerDiv = document.createElement("div");
      descriptionContainerDiv.className = "ticket-description-container";

      // Creazione dell'elemento span.subtitle per il nome del settore
      const sectorNameSpan = document.createElement("span");
      sectorNameSpan.className = "subtitle";
      sectorNameSpan.id = "sector-name";
      sectorNameSpan.textContent = sectorClicked; // Assumendo che sectorClicked sia una constiabile con il valore desiderato

      // Creazione dell'elemento div.removeTicket per l'icona di rimozione
      const removeTicketDiv = document.createElement("div");
      removeTicketDiv.className = "removeTicket";
      removeTicketDiv.addEventListener("click", () => {
        subsector.classList.toggle("clickable");
        ticketDiv.remove();
      });

      // Creazione dell'elemento img per l'icona di rimozione
      const removeIconImg = document.createElement("img");
      removeIconImg.src = "./resources/img/closeIcon.jpg";

      // Aggiunta dell'immagine all'elemento div.removeTicket
      removeTicketDiv.appendChild(removeIconImg);

      // Aggiunta del nome del settore e del div.removeTicket all'elemento div.ticket-description-container
      descriptionContainerDiv.appendChild(sectorNameSpan);
      descriptionContainerDiv.appendChild(removeTicketDiv);

      // Creazione dell'elemento div.btn-container
      const btnContainerDiv = document.createElement("div");
      btnContainerDiv.className = "btn-container";

      // Creazione dell'elemento span.subtitle per il prezzo
      const quantitySpan = document.createElement("span");
      quantitySpan.className = "subtitle";
      quantitySpan.id = "quantity";
      quantitySpan.textContent = "1";

      // Creazione dell'elemento div.btn.small per il pulsante di aumento
      const plusBtnDiv = document.createElement("div");
      plusBtnDiv.className = "btn small";
      plusBtnDiv.id = "plus";
      plusBtnDiv.textContent = "+";
      plusBtnDiv.addEventListener("click", () => {
        if (quantitySpan.textContent === "5") {
          alert("reached maximum number of tickets for this position");
        } else {
        	quantitySpan.textContent = parseInt(quantitySpan.textContent) + 1;
        	priceSpan.textContent = parseInt(priceSpan.textContent) + parseInt(subsector.getAttribute("price"));
        }
      });

      // Creazione dell'elemento div.btn.small per il pulsante di diminuzione
      const minusBtnDiv = document.createElement("div");
      minusBtnDiv.className = "btn small";
      minusBtnDiv.id = "minus";
      minusBtnDiv.textContent = "-";
      minusBtnDiv.addEventListener("click", () => {
        if (quantitySpan.textContent != "1") {
        	quantitySpan.textContent = parseInt(quantitySpan.textContent) - 1;
        	priceSpan.textContent = parseInt(priceSpan.textContent) - parseInt(subsector.getAttribute("price"));
        }
      });

      // Aggiunta dei pulsanti e del prezzo all'elemento div.btn-container
      btnContainerDiv.appendChild(minusBtnDiv);
      btnContainerDiv.appendChild(quantitySpan);
      btnContainerDiv.appendChild(plusBtnDiv);
      

      // Creazione dell'elemento span.subtitle per il prezzo
      const priceDiv = document.createElement("div")
      priceDiv.classList.add("priceDiv");
      const priceDollarSpan = document.createElement("span");
      priceDollarSpan.textContent = " $";
      const priceSpan = document.createElement("span");
      priceSpan.className = "subtitle";
      priceSpan.id = "price";
      priceSpan.textContent = subsector.getAttribute("price");
      priceDiv.appendChild(priceSpan);
      priceDiv.appendChild(priceDollarSpan);

      // Aggiunta dei contenitori di descrizione e pulsanti all'elemento div.ticket
      ticketDiv.appendChild(descriptionContainerDiv);
      ticketDiv.appendChild(priceDiv);
      ticketDiv.appendChild(btnContainerDiv);

      // Aggiunta dell'elemento div.ticket al documento HTML
      ticketsContainer.appendChild(ticketDiv);
    }
    
    console.log(oggettiFiltrati);
    for (var i = 0; i < oggettiFiltrati.length; i++) {
        var control = false;
        for(var y = 0; y < subsectors.length; y++){
            if(control == false) {
                const pos = oggettiFiltrati[i].settore_e_sottosettore.settore.nome_settore + " " + oggettiFiltrati[i].settore_e_sottosettore.sottosettori.sottosettore;
                const price = oggettiFiltrati[i].evento.prezzo_base_evento * oggettiFiltrati[i].settore_e_sottosettore.settore.moltiplicatore_tariffa_settore;
                const postoEvento = oggettiFiltrati[i].id_posto_evento;
                console.log(pos + " - " + subsectors[y].getAttribute("position"));
                if(subsectors[y].getAttribute("position") == pos){
                    console.log("uguali");
                    console.log("clickable");
                    subsectors[y].setAttribute("price", price);
                    subsectors[y].setAttribute("id_posto_evento", postoEvento);
                    subsectors[y].classList.toggle("clickable");
                    control = true;
                }
            }
        }
    }
</script>
</body>
</html>