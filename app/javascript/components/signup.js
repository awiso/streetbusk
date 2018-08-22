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
  const signupNavItems = document.querySelectorAll('#signup-nav li');

  document.querySelector('.signup').classList.add('show-signup');
  showSignupView(counter);

  signupNavItems.forEach( li => {
    li.addEventListener('click', function(e){
      movetoSignupView(e.currentTarget.dataset.index);
    })
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
              setUserArtistField(false);
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
    signupNavItems[counter].classList.add('show-signup-navitem');
    signupNavItems[counter].classList.add('signup-navitem-active');
    views[counter].classList.add('signup-show');
    content[counter].classList.add('signup-transition-in');
    let viewInputFirst = views[counter].querySelector('input');
    if(viewInputFirst.type == "text" || viewInputFirst.type == "password"){ viewInputFirst.focus();}
  }

  function hideSignupView(counter){
    signupNavItems[counter].classList.remove('signup-navitem-active');
    content[counter].classList.remove('signup-transition-in');
    const transitionInTime = 1200;
    setTimeout(function(){
      content[counter].classList.add('signup-transition-out');
    }, 1200);
    views[counter].classList.remove('signup-show');
    content[counter].classList.remove('signup-transition-out');
  }

  function setUserArtistField(boolean){
    document.querySelector('.signup-artist-hidden').value = boolean;
  }

  function movetoSignupView(index){
    views[index].classList.add('signup-show');
    showSignupView(index);
    hideSignupView(counter);
    console.log(index);
    console.log(counter);
    counter = index;
    // for (i = 0; i < views.length; i++){
    //   if i == index{
    //
    //   }
    //   else{
    //     signupNavItems[counter].classList.remove('signup-navitem-active');
    //   }
    // }
  }
}


export { signupfunction };
