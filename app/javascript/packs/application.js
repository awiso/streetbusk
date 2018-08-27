import "bootstrap";
import { signupfunction } from "../components/signup.js";
import { contribute } from "../components/contribute.js";
import { tabfunction } from "../components/tab.js";

contribute();
let signupButtons = document.querySelectorAll('#signup-button');
if( signupButtons.length > 0 ){
  signupButtons.forEach( function(button){
    button.addEventListener('click', signupfunction);
  })
}
