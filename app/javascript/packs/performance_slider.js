//var Swiper = require('swiper');

import Swiper from 'swiper';

const swiperContainer = document.querySelector('.swiper-container');
const performanceCards = document.querySelectorAll('.card');

var mySwiper = new Swiper('.swiper-container', {
  freeMode: true,
  freeModeSticky: true,
  freeModeMomentumRatio: 0.1,
  slidesPerView: 4,
  spaceBetween: -70,
  slidesOffsetBefore: -10,
  breakpoints: {
    // when window width is <= 320px
    430: {
      slidesPerView: 1,
      spaceBetween: -70
    },
    460: {
      slidesPerView: 1,
      spaceBetween: -120
    },
    510: {
      slidesPerView: 1,
      spaceBetween: -155,
    },
    545: {
      slidesPerView: 1,
      spaceBetween: -200,
    },
    570: {
      slidesPerView: 1,
      spaceBetween: -235,
    },
    640: {
      slidesPerView: 1,
      spaceBetween: -275,
    },
    700: {
      slidesPerView: 1,
      spaceBetween: -340
    },
    750: {
      slidesPerView: 1,
      spaceBetween: -390
    },
    800: {
      slidesPerView: 1,
      spaceBetween: -445
    },
    860: {
      slidesPerView: 1,
      spaceBetween: -490
    },
    930: {
      slidesPerView: 1,
      spaceBetween: -550
    },
    1000: {
      slidesPerView: 1,
      spaceBetween: -650
    },
    1050: {
      slidesPerView: 1,
      spaceBetween: -700
    },
    1100: {
      slidesPerView: 1,
      spaceBetween: -780
    },
    1150: {
      slidesPerView: 1,
      spaceBetween: -800
    },
    1200: {
      slidesPerView: 1,
      spaceBetween: -820
    },
    1400: {
      slidesPerView: 3,
      spaceBetween: -200
    },
    1600: {
      slidesPerView: 3,
      spaceBetween: -360
    },
    2000: {
      slidesPerView: 4,
      spaceBetween: -340
    },
  }
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

export { mySwiper, getActiveSlide, animateActiveSlide }
