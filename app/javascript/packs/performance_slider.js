//var Swiper = require('swiper');

import Swiper from 'swiper';

const swiperContainer = document.querySelector('.swiper-container');
const cards = document.querySelectorAll('.card');

const swiperOptions = {
  freeMode: true,
  freeModeSticky: true,
  freeModeMomentumRatio: 0.1,
  slidesPerView: 1,
  spaceBetween: spaceBetweenValue(),
  slidesOffsetBefore: -10,
  autoHeight: true
};

const swiperOptions2 = {
  freeMode: true,
  freeModeSticky: true,
  freeModeMomentumRatio: 0.1,
  slidesPerView: 1,
  autoHeight: true,
  spaceBetween: spaceBetweenValue(),
  slidesOffsetAfter: spaceBetweenValue()
}

if (swiperContainer){
  if(swiperContainer.dataset.slider=="performances_index"){
    var mySwiper = new Swiper('.swiper-container', swiperOptions);

    window.addEventListener('resize', () => {
      mySwiper.destroy();
      mySwiper = new Swiper('.swiper-container', swiperOptions);
    })
  }
  else{
    var mySwiper2 = new Swiper('.swiper-container', swiperOptions2);
    window.addEventListener('resize', () => {
      mySwiper2.destroy();
      mySwiper2 = new Swiper('.swiper-container', swiperOptions2);
    })
  }
}

function getActiveSlide(){
    let activeSlide = swiperContainer.querySelector('.swiper-slide-active');
    return activeSlide.dataset.index
}

function animateActiveSlide(index){
  let cardActive = Array.from(cards).find((card) => {
    return card.dataset.index == index
  })
  performanceCards.forEach((card) => {
    card.classList.remove('card-active');
  })
  cardActive.classList.add('card-active');
}

function spaceBetweenValue(){
  if(cards[0]){
    let cardWidth = cards[0].clientWidth;
    let windowWidth = $(window).width();
    let noOfCardsPerView = windowWidth / cardWidth
    let spaceBetween = -((noOfCardsPerView - 1) * cardWidth) + 40;
    return spaceBetween;
  }
}


export { mySwiper, getActiveSlide, animateActiveSlide }
