
function displayModal() {
  const button = document.getElementById('contribute-button');

  if (button) {
    if (button.dataset.modal === 'true') {
      $('#contribute-modal').modal();
    }
  }
}

function radioButton() {
  const divs = document.querySelectorAll(".contribute-option");
  // convert divs into array
  divs.forEach((div) => {
    div.addEventListener("click", function(e) {

      divs.forEach((option) => {
        option.classList.remove("contribute-active")
      })

      e.currentTarget.classList.add("contribute-active");
      this.querySelector("input").click()
    })
  })
}

export { displayModal, radioButton };


