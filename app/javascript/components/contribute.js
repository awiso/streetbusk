function contribute(){
  const contributeButton = document.querySelector('#contribute-button');
  const contributeModal = document.querySelector('#contribute-modal');

  // if(contributeButton){
  //   contributeButton.addEventListener('click', function(){
  //     contributeModal.classList.add('fade-in');
  //     contributeModal.classList.remove('fade');
  //     contributeModal.classList.add('show');
  //   })
  // }


  const contributeOptions = document.querySelector('.contribute_options');
  const otherAmountField = document.querySelector('.performance-other-amount');
  const contributionAmount = document.querySelector('#contribution_amount');
  console.log(contributeOptions)
  if(contributeOptions){
    contributeOptions.onchange = function(){
      let val = this.options[this.selectedIndex].value;
      if(val === "Other"){
        otherAmountField.classList.add('show-other-amount');
        contributionAmount.classList.add('show-contribution_amount');
      }
      else{
        otherAmountField.classList.remove('show-other-amount');
        contributionAmount.classList.remove('show-contribution_amount');
      }
      contributionAmount.addEventListener('keydown', function(e){
        
      })
    }
  }
}

function displayModal() {
  const button = document.getElementById('contribute-button');

  if (button.dataset.modal === 'true') {
    $('#contribute-modal').modal();
  }
}


export { contribute, displayModal };
