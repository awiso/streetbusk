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
},
{},//empty object, as no validation needed
{},//empty object, as no validation needed
{
  "user[artist_name]": {
  presence: true
}
},
{
  "genre": {
  presence: true
}
}
];

  const views = document.querySelectorAll('.signup-view');
  let counter = 0;
  const content = document.querySelectorAll('.signup-content');
  const continueButtons = document.querySelectorAll('.signup-continue');
  const signupNavItems = document.querySelectorAll('#signup-nav li');

  document.querySelector('.signup').classList.add('show-signup');
  showSignupView(counter);

  // signupNavItems.forEach( li => {
  //   li.addEventListener('click', function(e){
  //     movetoSignupView(e.currentTarget.dataset.index);
  //   })
  // })

  const backButton = document.querySelector('.signup-back');
  backButton.addEventListener('click', function(e){
    counter -= 1;
    showSignupView(counter);
    hideSignupView(counter + 1);
    if(counter == -1){
      document.querySelector('.signup').classList.remove('show-signup');
    }
  })



  continueButtons.forEach( button => {
    button.addEventListener('click', function(e){
      e.preventDefault();
      let signupinput = Array.from(views[counter].querySelectorAll('input'));
      //on the "Are You An Artist" screen, the Yes button sets the artist field and moves on to the next view...
      //the No button diverts the view to the last view ("You are done")
      if (e.currentTarget.classList.contains("signup-split")){
          switch(e.currentTarget.value){
            case "No":
              showSignupView(views.length - 1);
              hideSignupView(counter);
              setUserArtistField(false);
              break;
            case "Yes":
              showNextView();
              setUserArtistField(true);
              break;
          }
      }
      else{
        // validate fields in view with validate.js
        let validation_fields = {}
        for (let i = 0; i < signupinput.length - 1; i++){
          validation_fields[signupinput[i].name] = signupinput[i].value
        }
        let validation = validate(validation_fields, constraints[counter]);
        //if validation successful, go to next view...
        if( validation == undefined){
          showNextView();
        }
        else{
          //...otherwise display errors
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
      }


    })
  })

  function showNextView(){
    counter += 1;
    hideSignupView(counter - 1);
    showSignupView(counter);
  }

  function showSignupView(counter){
    if(counter >= 0 && counter < views.length){
      signupNavItems[counter].classList.add('show-signup-navitem');
      signupNavItems[counter].classList.add('signup-navitem-active');
      views[counter].classList.add('signup-show');
      content[counter].classList.add('signup-transition-in');
      let viewInputFirst = views[counter].querySelector('input');
      if(viewInputFirst.type == "text" || viewInputFirst.type == "password")
        { viewInputFirst.focus();}
      else if(viewInputFirst.value == "Continue"){
          viewInputFirst.focus();
      }
      setTimeout(function(){
        content[counter].classList.remove('signup-transition-in');
      }, 1000);
    }

  }

  function hideSignupView(counter){
    if(counter >= 0 && counter < views.length){
      signupNavItems[counter].classList.remove('signup-navitem-active');
      const transitionTime = 1200;
      content[counter].classList.add('signup-transition-out');
      setTimeout(function(){
        //  content[counter + 1].classList.remove('signup-transition-in');
        content[counter].classList.remove('signup-transition-out');
        views[counter].classList.remove('signup-show');
      }, transitionTime);
    }
  }

  function setUserArtistField(boolean){
    document.querySelector('.signup-artist-hidden').value = boolean;
  }

  function movetoSignupView(index){
    hideSignupView(counter);
    showSignupView(index);
    counter = parseInt(index);
  }
}


export { signupfunction };
