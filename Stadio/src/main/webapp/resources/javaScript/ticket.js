/**
 * 
 */
const slider = document.getElementById("price");
const output = document.getElementById("price-text");
output.innerHTML = "€ 10 - € " + slider.value; // Display the default slider value

// Update the current slider value (each time you drag the slider handle)
slider.oninput = function () {
  output.innerHTML = "€ 10 - € " + this.value;
};

function bookNow() {
window.location.href = 'ticketDescription.html';
}