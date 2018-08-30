
function displayModal() {
  const button = document.getElementById('contribute-button');

  if (button) {
    if (button.dataset.modal === 'true') {
      $('#contribute-modal').modal();
    }
  }
}

function radioButton() {
  const divs = document.querySelectorAll(".contribute-option");  console.log(divs);
  // convert divs into array
  divs.forEach((div) => {
    div.addEventListener("click", function(e) {
      this.querySelector("input").click()
    })
  })
}

export { displayModal, radioButton };


