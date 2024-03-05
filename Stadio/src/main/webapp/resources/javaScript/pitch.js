/**
 * 
 */
const sectors = document.querySelectorAll(".sector");
const mainContainer = document.querySelector(".main-container");
const sectorZoomContainer = document.querySelector(".sector-zoom-container");

sectors.forEach((sector) => {
  sector.addEventListener("click", () => {
    const sectorId = sector.id;
    console.log(sectorId);
    const seatContainer = document.querySelector(".seats-container");
    const seatNum = 180;
    const seatCol = 15;
    const seatRow = seatNum / seatCol;
    console.log(seatRow);
    const letters = [
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "q",
      "r",
      "s",
      "t",
      "u",
      "v",
      "w",
      "x",
      "y",
      "z",
    ];
    seatContainer.innerHTML = ``;
    for (let i = 0; i < seatRow; i++) {
      for (let x = 1; x <= seatCol; x++) {
        seatContainer.innerHTML += `<div class="seat" id="">${letters[
          i
        ].toUpperCase()} ${x}</div>`;
      }
    }
    const sectorName = sector.textContent;
    const sectorNameZoom = document.querySelector(".sector-name-zoom");
    sectorNameZoom.innerHTML = sectorName;
    seatContainer.style.gridTemplateColumns = `repeat(${seatCol}, 1fr)`;
    sectorZoomContainer.style.zIndex = "999";
    sectorZoomContainer.style.display = "flex";

    const closeZoom = document.querySelector(".close-zoom");
    closeZoom.addEventListener("click", () => {
      sectorZoomContainer.style.zIndex = "-999";
      sectorZoomContainer.style.display = "none";
    });
  });
});
