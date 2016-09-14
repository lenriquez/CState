
function signIn(){
  $.auth.emailSignIn({
    email: $("#input-email").val(),
    password: $("#input-password").val()
  }).then(function(data){
    console.log(data);
    $("#message-login").text(data);
    $('#modal').modal('hide');
  });
}

function signUp(){
  $.post("/api/v1/register",
    { email: $("#input-email").val(),
      password: $("#input-password").val()
    }).fail(function(data){
      $("#message-login").text(data);
    });
}

function changeForm(){
  if (isSignInForm()){
    $("#confirmation-div").show();
    $("#sing-up a").text("Sign In");
    $("#sign").text("Sign Up");
  } else {
    $("#confirmation-div").hide();
    $("#sing-up a").text("Sign Up");
    $("#sign").text("Sign In");
  }
}

// If the confirmation for is hidden it should be on "sign in" state otherwise
// "sign up
function isSignInForm(){
  return $("#confirmation-div").is(":hidden");
}

document.addEventListener('DOMContentLoaded',function(){
  $.auth.configure({apiUrl: '/api/v1'});

  // Show fields for "Sign Up" for email confirmation
  $('#sing-up').click(function(){
    changeForm();
  });

  //Check request depending if it is "Sign Up" "Sign In"
  $('#sign').click( function(){
    if (isSignInForm()){
      signIn();
    } else {
      signUp();
    }
  });
});
