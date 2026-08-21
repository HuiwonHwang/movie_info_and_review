const rating = document.querySelector('#rating');
const ratingValue = document.querySelector('#ratingValue');

rating.addEventListener('input', () => {
    ratingValue.textContent = Number(rating.value).toFixed(1);
});