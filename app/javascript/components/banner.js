function bannerTransitions(){
  const bannerImages = document.querySelectorAll('.image-banner-options');
  const banner = document.querySelector('.banner');
  if(bannerImages){
    let imageSources = [];

    bannerImages.forEach( (div) => {
      let img = new Image
      img.src = div.dataset.src
      imageSources.push(div.dataset.src);
    })

    setInterval(changebgImage, 2000);
    let counter = 0
    console.log(counter)
    function changebgImage(){

      if(counter===backgroundimages.length-1){counter=0;}
      else{counter++;}
      banner.fadeOut(750, function(){
        $(this).css("background-image", "url(" + imageSources[counter].src + ")").fadeIn(750);
      });

    }

  }
}

export default bannerTransitions
