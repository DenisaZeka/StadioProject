<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User page</title>
<style><%@include file="/resources/css/UserProfile.css"%></style>
</head>
<body>
  <!-- cambiare credenziali
consultare biglietti passati
consultare biglietti acquistati ma non usufruiti
richiesta rimborsi
cancellazione profilo -->

<!-- color: white; text-align: center; -->
<div class="sidenav">
  <!-- <div style="height: 13vh; width: 190px;"><img src="../Rozzano_Stadium_logo.svg" style="height: 13vh; width: 190px;" onclick="window.location.href='../home.html'"></div> -->
  <div class="logo"><a href="../Home/home.html" style="padding: 0%;"><img src="../General_Resurces/Rozzano_Stadium_Logo.svg" style="height: 13vh; width: 190px;"></a></div>
  <a href="#" class="sidebar-link" id="menuUtenteLink">Torna al Menu Utente</a>
  <a href="#credenziali" class="sidebar-link">Modifica Credenziali</a>
  <a href="#prenotazioniPassate" class="sidebar-link">Prenotazioni Passate</a>
  <a href="#eventiPrenotati" class="sidebar-link">Eventi Prenotati</a>
  <a href="#cancellazioneProfilo" class="sidebar-link">Cancellazione Profilo</a>
</div>

<div class="main" id="mainContent">
  <h2>Benvenuto Utente!</h2>
  <p>Da questa pagina puoi gestire le tue credenziali e le tue prenotazioni in tutta tranquillità.</p><br>
  <p>Informazioni personali:</p><br>
  <p>Nome: ${nome}</p>
  <p>Cognome: ${cognome}</p>
  <p>Codice Fiscale: ${codice_fiscale}</p>
  <p>Email: ${email}</p>
  <p>Password: ${password}</p>
</div>

  <script>

document.addEventListener("DOMContentLoaded", function () {
  // Funzione per gestire il click sui link della sidebar
  function handleSidebarClick(event) {
    event.preventDefault(); // Evita il comportamento predefinito del click sul link

    // Rimuovi la classe "active" da tutti i link della sidebar
    var sidebarLinks = document.querySelectorAll(".sidenav a");
    sidebarLinks.forEach(function (link) {
      link.classList.remove("active");
    });

    // Aggiungi la classe "active" al link corrente
    var currentLink = event.currentTarget;
    currentLink.classList.add("active");

    // Ottieni l'ID del link corrente
    var linkID = currentLink.getAttribute("href");

    // Ottieni l'elemento della sezione principale in cui verranno mostrate le opzioni
    var mainContent = document.getElementById("mainContent");

    // Modifica il contenuto della sezione principale in base all'ID del link
    switch (linkID) {
      case "#credenziali":
        mainContent.innerHTML = `<form id="credenzialiForm" >
          <h2>Modifica Credenziali</h2>
          <div class="big">
            <div class="small">
              <label for="nomeInput">Nome:</label>
              <input type="text" id="nomeInput" name="nome" required>
            </div>
            <div class="small">
            <label for="cognomeInput">Cognome:</label>
            <input type="text" id="cognomeInput" name="cognome" required>
            </div>
            </div>  
          <div class="big">
            <div class="small">
            <label for="codiceFiscaleInput">Codice Fiscale:</label>
            <input type="text" id="codiceFiscaleInput" name="codiceFiscale" required>
            </div>
            <div class="small">
            <label for="emailInput">Email:</label>
            <input type="email" id="emailInput" name="email" required>
            </div>
            </div>
          <div class="big"> 
            <div class="small">
            <label for="passwordInput">Password:</label>
            <input type="password" id="passwordInput" name="password" required>
            </div>
          
          <button type="submit">Salva nuove credenziali</button>
          </div>
        </form>`;
        

        break;

      case "#prenotazioniPassate":
        mainContent.innerHTML = `<h2>Prenotazioni Passate</h2><p>Contenuto delle prenotazioni passate...</p>
          
      <div class="events-container">
        <div class="event-card">
          <div class="event-img">
            <img
              src="https://media.istockphoto.com/id/974238866/it/foto/il-pubblico-ascolta-il-docente-alla-conferenza.jpg?s=612x612&w=0&k=20&c=bWTpVn6Jmql_U-amLXVy6VDqEGDAAL0u5hSymS77-yM="
              alt=""
            />
          </div>
          <div class="event-descritpion">
            <span class="event-title" id="event-name">Summer concert</span>
            <span class="event-title" id="event-date">12 / 08 / 2023</span>
            <span class="event-title" id="event-price">$ 50.00</span>
          </div>
        </div>
        <div class="event-card">
          <div class="event-img">
            <img
              src="https://media.istockphoto.com/id/974238866/it/foto/il-pubblico-ascolta-il-docente-alla-conferenza.jpg?s=612x612&w=0&k=20&c=bWTpVn6Jmql_U-amLXVy6VDqEGDAAL0u5hSymS77-yM="
              alt=""
            />
          </div>
          <div class="event-descritpion">
            <span class="event-title" id="event-name">Summer concert</span>
            <span class="event-title" id="event-date">12 / 08 / 2023</span>
            <span class="event-title" id="event-price">$ 50.00</span>
          </div>
        </div>
        <div class="event-card">
          <div class="event-img">
            <img
              src="https://media.istockphoto.com/id/974238866/it/foto/il-pubblico-ascolta-il-docente-alla-conferenza.jpg?s=612x612&w=0&k=20&c=bWTpVn6Jmql_U-amLXVy6VDqEGDAAL0u5hSymS77-yM="
              alt=""
            />
          </div>
          <div class="event-descritpion">
            <span class="event-title" id="event-name">Summer concert</span>
            <span class="event-title" id="event-date">12 / 08 / 2023</span>
            <span class="event-title" id="event-price">$ 50.00</span>
          </div>
        </div>`;

        break;
      case "#eventiPrenotati":
        mainContent.innerHTML = `<h2>Eventi Prenotati</h2>
          
          <br><p>Contenuto degli eventi prenotati CANCELLABILI.</p><br>
          <div class="superContainer">
            <div class="events-container">
                <div class="event-card">
                  <div class="event-img">
                    <img
                      src="https://media.istockphoto.com/id/974238866/it/foto/il-pubblico-ascolta-il-docente-alla-conferenza.jpg?s=612x612&w=0&k=20&c=bWTpVn6Jmql_U-amLXVy6VDqEGDAAL0u5hSymS77-yM="
                      alt=""
                    />
                  </div>
                  <div class="event-descritpion">
                    <span class="event-title" id="event-name">Summer concert</span>
                    <span class="event-title" id="event-date">12 / 08 / 2023</span>
                    <span class="event-title" id="event-price">$ 50.00</span>
                  </div>
                  <div class="event-btn">Cancella Prenotazione</div>
                </div>
                <div class="event-card">
                  <div class="event-img">
                    <img
                      src="https://media.istockphoto.com/id/974238866/it/foto/il-pubblico-ascolta-il-docente-alla-conferenza.jpg?s=612x612&w=0&k=20&c=bWTpVn6Jmql_U-amLXVy6VDqEGDAAL0u5hSymS77-yM="
                      alt=""
                    />
                  </div>
                  <div class="event-descritpion">
                    <span class="event-title" id="event-name">Summer concert</span>
                    <span class="event-title" id="event-date">12 / 08 / 2023</span>
                    <span class="event-title" id="event-price">$ 50.00</span>
                  </div>
                  <div class="event-btn">Cancella Prenotazione</div>
                </div>
                <div class="event-card">
                  <div class="event-img">
                    <img
                      src="https://media.istockphoto.com/id/974238866/it/foto/il-pubblico-ascolta-il-docente-alla-conferenza.jpg?s=612x612&w=0&k=20&c=bWTpVn6Jmql_U-amLXVy6VDqEGDAAL0u5hSymS77-yM="
                      alt=""
                    />
                  </div>
                  <div class="event-descritpion">
                    <span class="event-title" id="event-name">Summer concert</span>
                    <span class="event-title" id="event-date">12 / 08 / 2023</span>
                    <span class="event-title" id="event-price">$ 50.00</span>
                  </div>
                  <div class="event-btn">Cancella Prenotazione</div>
                </div>
            </div>

          <br><p>Contenuto degli eventi prenotati NON cancellabili.</p><br>

          <div class="events-container">
            <div class="event-card">
              <div class="event-img">
                <img
                  src="https://media.istockphoto.com/id/974238866/it/foto/il-pubblico-ascolta-il-docente-alla-conferenza.jpg?s=612x612&w=0&k=20&c=bWTpVn6Jmql_U-amLXVy6VDqEGDAAL0u5hSymS77-yM="
                  alt=""
                />
              </div>
              <div class="event-descritpion">
                <span class="event-title" id="event-name">Summer concert</span>
                <span class="event-title" id="event-date">12 / 08 / 2023</span>
                <span class="event-title" id="event-price">$ 50.00</span>
              </div>
            </div>
            <div class="event-card">
              <div class="event-img">
                <img
                  src="https://media.istockphoto.com/id/974238866/it/foto/il-pubblico-ascolta-il-docente-alla-conferenza.jpg?s=612x612&w=0&k=20&c=bWTpVn6Jmql_U-amLXVy6VDqEGDAAL0u5hSymS77-yM="
                  alt=""
                />
              </div>
              <div class="event-descritpion">
                <span class="event-title" id="event-name">Summer concert</span>
                <span class="event-title" id="event-date">12 / 08 / 2023</span>
                <span class="event-title" id="event-price">$ 50.00</span>
              </div>
            </div>
            <div class="event-card">
              <div class="event-img">
                <img
                  src="https://media.istockphoto.com/id/974238866/it/foto/il-pubblico-ascolta-il-docente-alla-conferenza.jpg?s=612x612&w=0&k=20&c=bWTpVn6Jmql_U-amLXVy6VDqEGDAAL0u5hSymS77-yM="
                  alt=""
                />
              </div>
              <div class="event-descritpion">
                <span class="event-title" id="event-name">Summer concert</span>
                <span class="event-title" id="event-date">12 / 08 / 2023</span>
                <span class="event-title" id="event-price">$ 50.00</span>
              </div>
            </div>
          </div>
        </div>`;

        break;
      case "#cancellazioneProfilo":
        mainContent.innerHTML = `<form id="cancellazioneProfilo"  style="text-align: center; align-items: center;">
          <h3>Eliminazione Profilo</h3>
          <h4>Premendo il pulsante sottostante il profilo correnete sarà cancellato.<br>Sei sicuro di volerlo fare?</h4>
          <h3>ATTENZIONE! Questo processo è IRREVERSIBILE.</h3>
          <button type="confermaCancellazione">Conferma Cancellazione</button>
        </form>`;
        break;
      default:
        mainContent.innerHTML = "";
        break;
    }
  }

  // Funzione per gestire il click sul pulsante "Torna al Menu Utente"
  function handleMenuUtenteClick(event) {
    event.preventDefault(); // Evita il comportamento predefinito del click sul link
    window.location.reload(); // Ricarica la pagina
  }

  // Aggiungi l'evento di click a tutti i link della sidebar
  var sidebarLinks = document.querySelectorAll(".sidebar-link");
  sidebarLinks.forEach(function (link) {
    link.addEventListener("click", handleSidebarClick);
  });

  // Aggiungi l'evento di click al pulsante "Torna al Menu Utente"
  var menuUtenteLink = document.getElementById("menuUtenteLink");
  menuUtenteLink.addEventListener("click", handleMenuUtenteClick);
});


  </script>
</body>
</html>