
function displayModal() {
  const button = document.getElementById('contribute-button');

  if (button) {
    if (button.dataset.modal === 'true') {
      $('#contribute-modal').modal();
    }
  }
}


export { displayModal };
