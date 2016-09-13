$( function(){
  $('form').submit( function(event) {
    event.preventDefault();
    if ((this["firstname"].value == '') || (this["email"].value == '')) {
      alert("Please complete the form");
    }
    console.log(this["firstname"].value);
    console.log(this["email"].value);
    return true;
  })
})
