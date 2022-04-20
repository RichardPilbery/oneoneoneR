$( document ).ready(function() {
  Shiny.addCustomMessageHandler('testmessage', function(message) {
    alert(JSON.stringify(message));
  })
});
