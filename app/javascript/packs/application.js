import "bootstrap";
import { signupfunction } from "../components/signup.js";
import { contribute } from "../components/contribute.js";

contribute();
let signupButton = document.querySelector('#signup-button')
if( signupButton ){
  signupButton.addEventListener('click', signupfunction);
}
