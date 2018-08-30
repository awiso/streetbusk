import "bootstrap";
import { signupfunction } from "../components/signup.js";
import { displayModal, radioButton } from "../components/contribute.js";
import { bannerTransitions } from "../components/banner.js";
import "../plugins/flatpickr";

displayModal();
radioButton();
bannerTransitions();
let signupButtons = document.querySelectorAll('#signup-button');
if( signupButtons.length > 0 ){
  signupButtons.forEach( function(button){
    button.addEventListener('click', signupfunction);
  })
}
