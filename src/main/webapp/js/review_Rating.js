const rating = document.querySelector("#rating");
const ratingValue = document.querySelector("#ratingValue");
const score = document.querySelector("#score");

rating.addEventListener("input", function() {

    ratingValue.textContent = rating.value + "점";

    score.value = rating.value;

});