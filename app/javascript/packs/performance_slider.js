//var Swiper = require('swiper');

import Swiper from 'swiper';

const swiperContainer = document.querySelector('.swiper-container');
const performanceCards = document.querySelectorAll('.card');

var mySwiper = new Swiper('.swiper-container', {
  freeMode: true,
  freeModeSticky: true,
  freeModeMomentumRatio: 0.1,
  slidesPerView: 1,
  spaceBetween: spaceBetweenValue(),
  slidesOffsetBefore: -10,
});

function getActiveSlide(){
    let activeSlide = swiperContainer.querySelector('.swiper-slide-active');
    return activeSlide.dataset.index
}

function animateActiveSlide(index){
  let cardActive = Array.from(performanceCards).find((card) => {
    return card.dataset.index == index
  })
  performanceCards.forEach((card) => {
    card.classList.remove('card-active');
  })
  cardActive.classList.add('card-active');
}

function spaceBetweenValue(){
  if(performanceCards[0]){
    let cardWidth = performanceCards[0].clientWidth;
    let windowWidth = $(window).width();
    let noOfCardsPerView = windowWidth / cardWidth
    let spaceBetween = -((noOfCardsPerView - 1) * cardWidth) + 40;
    return spaceBetween;
  }
}

window.addEventListener('resize', () => {
  mySwiper.destroy();
  mySwiper = new Swiper('.swiper-container', {
    freeMode: true,
    freeModeSticky: true,
    freeModeMomentumRatio: 0.1,
    slidesPerView: 1,
    spaceBetween: spaceBetweenValue(),
    slidesOffsetBefore: -10,
  });
})

export { mySwiper, getActiveSlide, animateActiveSlide }
