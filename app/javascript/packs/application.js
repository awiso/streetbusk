import "bootstrap";
import { signupfunction } from "../components/signup.js";
import { contribute, displayModal } from "../components/contribute.js";
import "../plugins/flatpickr";
import { tabfunction } from "../components/tab.js";


contribute();
displayModal();
let signupButtons = document.querySelectorAll('#signup-button');
if( signupButtons.length > 0 ){
  signupButtons.forEach( function(button){
    button.addEventListener('click', signupfunction);
  })
}
