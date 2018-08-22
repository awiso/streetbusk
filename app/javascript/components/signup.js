function signupfunction(e){
  var validate = require("validate.js");
  e.preventDefault();

  var constraints = [{
    "user[email]": {
    presence: true,
    format: {
      pattern: /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/,
      message: function(value, attribute, validatorOptions, attributes, globalOptions) {
        return validate.format("^%{num} is not a valid email", {
          num: value
        });
      }
    }
  }
},
  {
    "user[password]": {
    presence: true,
    length: {
      minimum: 6,
      message: "^Your password must be at least 6 characters"
    }
  },
  "user[password_confirmation]": {
  presence: true,
  equality: {
        attribute: "user[password]",
        message: "^Your confirmation password and password must match"
      }
  }

}

];

  const views = document.querySelectorAll('.signup-view');
  let counter = 0;
  const content = document.querySelectorAll('.signup-content');
  const continueButtons = document.querySelectorAll('.signup-continue');

  showSignupView(counter);

  continueButtons.forEach( button => {
    button.addEventListener('click', function(e){
      e.preventDefault();
      let validations = [];
      let signupinput = Array.from(views[counter].querySelectorAll('input'));
      let validation_fields = {}

      for (let i = 0; i < signupinput.length - 1; i++){
       validation_fields[signupinput[i].name] = signupinput[i].value
      }

      let validation = validate(validation_fields, constraints[counter]);

      if( validation == undefined){
        counter += 1;
        let transitionOutTime = 500; //time for the out transition of the view to finish in ms
        hideSignupView(counter - 1);
        showSignupView(counter);
      }
      else{
        let errors= Array.from(views[counter].querySelectorAll('.signup-error'));
        errors.forEach( err => {
          err.parentNode.removeChild(err);
        })
        Object.keys(validation).forEach( input_name => {
          let foundInput = signupinput.find((input) => {
            return input.name == input_name
          })
          foundInput.previousElementSibling.insertAdjacentHTML('afterend', `<p class="signup-error">${validation[input_name]}</p>`);
        })
      }

    })
  })

  function showSignupView(counter){
    views[counter].classList.add('signup-show');
    content[counter].classList.add('signup-transition-in');
    views[counter].querySelector('input').focus();
  }

  function hideSignupView(counter){

    content[counter].classList.remove('signup-transition-in');
    const transitionInTime = 1200;
    setTimeout(function(){
      content[counter].classList.add('signup-transition-out');
    }, 1200)
    views[counter].classList.remove('signup-show');
  }
}


export { signupfunction };
