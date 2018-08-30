import "bootstrap";
import { signupfunction } from "../components/signup.js";
import { screenfullInit } from "./screenfull_init.js";
import { displayModal, radioButton } from "../components/contribute.js";
import "../plugins/flatpickr";

screenfullInit();
displayModal();
radioButton();
let signupButtons = document.querySelectorAll('#signup-button');
if( signupButtons.length > 0 ){
  signupButtons.forEach( function(button){
    button.addEventListener('click', signupfunction);
  })
}
