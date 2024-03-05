<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pitch here</title>
<style>
  <%@include file="/resources/css/pitch.css"%>
  <%@include file="/resources/css/global.css"%>
</style>
</head>
<body>
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
    <div class="btn big" id="confirm">CONFIRM</div>
  </div>
</div>
<script>
  const letters = ["A", "B", "C", "D", "E", "F", "G", "H"];

  const sectorsLeft = document.querySelector(".sectors#left .subsectors-container");
  const sectorsRight = document.querySelector(".sectors#right .subsectors-container");
  const sectorsCenter = document.querySelector(".sectors#center .subsectors-container");

  function createSubsectors(type) {
    if (type === "left") {
      for (let index = 0; index < 5; index++) {
        const subsector = createSubsector(index);
        subsector.setAttribute("position", `CORRIDOIO OVEST ${letters[index]}`);
        subsector.innerHTML = letters[index];
        subsector.addEventListener("click", () => {
          const ticketsContainer = document.querySelector(".tickets-container");
          if (ticketsContainer.childElementCount == 3) {
            alert("Reached the maximum number of selected positions");
          } else {
            if (subsector.classList.contains("clickable")) {
              createTicket(subsector);
            }
          }
        });
        sectorsLeft.appendChild(subsector);
      }
    }
    if (type === "right") {
      for (let index = 0; index < 5; index++) {
        const subsector = createSubsector(index);
        subsector.setAttribute("position", `CORRIDOIO EST ${letters[index]}`);
        subsector.innerHTML = letters[index];
        subsector.addEventListener("click", () => {
          const ticketsContainer = document.querySelector(".tickets-container");
          if (ticketsContainer.childElementCount == 3) {
            alert("Reached the maximum number of selected positions");
          } else {
            if (subsector.classList.contains("clickable")) {
              createTicket(subsector);
            }
          }
        });
        sectorsRight.appendChild(subsector);
      }
    }
    if (type === "center") {
      for (let index = 0; index < 8; index++) {
        const subsector = document.createElement("div");
        subsector.classList.add("subsector");
        subsector.classList.add("clickable");
        subsector.setAttribute("position", `PARTERRE ${letters[index]}`);
        if (index >= 6) {
          subsector.id = "center-center";
        } else {
          subsector.id = "normal";
        }
        subsector.innerHTML = letters[index];
        subsector.addEventListener("click", () => {
          const ticketsContainer = document.querySelector(".tickets-container");
          if (ticketsContainer.childElementCount == 3) {
            alert("Reached the maximum number of selected positions");
          } else {
            if (subsector.classList.contains("clickable")) {
              createTicket(subsector);
            }
          }
        });
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
    subsector.classList.add("clickable");
    if (x == 4) {
      subsector.id = "lateral-center";
    }
    return subsector;
  }

  function createTicket(subsector) {
    subsector.classList.toggle("clickable");
    const sectorClicked = subsector.getAttribute("position");

    const ticketsContainer = document.querySelector(".tickets-container");
    // Creazione dell'elemento div.ticket
    const ticketDiv = document.createElement("div");
    ticketDiv.className = "ticket";

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
    removeIconImg.src = "x-menu-icon.svg";

    // Aggiunta dell'immagine all'elemento div.removeTicket
    removeTicketDiv.appendChild(removeIconImg);

    // Aggiunta del nome del settore e del div.removeTicket all'elemento div.ticket-description-container
    descriptionContainerDiv.appendChild(sectorNameSpan);
    descriptionContainerDiv.appendChild(removeTicketDiv);

    // Creazione dell'elemento div.btn-container
    const btnContainerDiv = document.createElement("div");
    btnContainerDiv.className = "btn-container";

    // Creazione dell'elemento span.subtitle per il prezzo
    const priceSpan = document.createElement("span");
    priceSpan.className = "subtitle";
    priceSpan.id = "price";
    priceSpan.textContent = "1";

    // Creazione dell'elemento span.subtitle per il testo "Price"
    const priceTextSpan = document.createElement("span");
    priceTextSpan.className = "subtitle";
    priceTextSpan.textContent = "Price";

    // Creazione dell'elemento div.btn.small per il pulsante di aumento
    const plusBtnDiv = document.createElement("div");
    plusBtnDiv.className = "btn small";
    plusBtnDiv.id = "plus";
    plusBtnDiv.textContent = "+";
    plusBtnDiv.addEventListener("click", () => {
      if (priceSpan.textContent === "5") {
        alert("Reached the maximum number of tickets for this position");
      } else {
        priceSpan.textContent = parseInt(priceSpan.textContent) + 1;
      }
    });

    // Creazione dell'elemento div.btn.small per il pulsante di diminuzione
    const minusBtnDiv = document.createElement("div");
    minusBtnDiv.className = "btn small";
    minusBtnDiv.id = "minus";
    minusBtnDiv.textContent = "-";
    minusBtnDiv.addEventListener("click", () => {
      if (priceSpan.textContent != "1") {
        priceSpan.textContent = parseInt(priceSpan.textContent) - 1;
      }
    });

    // Aggiunta del testo "Price" e dell'input del prezzo all'elemento div.btn-container
    btnContainerDiv.appendChild(priceTextSpan);
    btnContainerDiv.appendChild(minusBtnDiv);
    btnContainerDiv.appendChild(priceSpan);
    btnContainerDiv.appendChild(plusBtnDiv);

    // Aggiunta dei contenitori di descrizione e pulsanti all'elemento div.ticket
    ticketDiv.appendChild(descriptionContainerDiv);
    ticketDiv.appendChild(btnContainerDiv);

    // Aggiunta dell'elemento div.ticket al documento HTML
    ticketsContainer.appendChild(ticketDiv);
  }
</script>
</body>
</html>
