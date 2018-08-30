function bannerTransitions(){
  const bannerImages = document.querySelectorAll('.image-banner-options');
  const banner = $('.banner');
  if(bannerImages){
    let imageSources = [];

    bannerImages.forEach( (div) => {
      let img = new Image
      img.src = div.dataset.src
      imageSources.push(div.dataset.src);
    })

    setInterval(changebgImage, 6000);
    let counter = 0;
    function changebgImage(){

      if(counter===imageSources.length-1){counter=0;}
      else{counter++;}
      banner.fadeOut(750, function(){
        $(this).css("background-image", "url(" + imageSources[counter] + ")").fadeIn(750);
      });

    }

  }
}

export { bannerTransitions }
