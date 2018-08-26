//var Swiper = require('swiper');

import Swiper from 'swiper';

const swiperContainer = document.querySelector('.swiper-container');

var mySwiper = new Swiper('.swiper-container', {
  // freeMode: true,
  // freeModeSticky: true,
  // freeModeMomentumRatio: 0.3
});

function getActiveSlide(){
    let activeSlide = swiperContainer.querySelector('.swiper-slide-active');
    return activeSlide.dataset.index
}

export { mySwiper, getActiveSlide }
