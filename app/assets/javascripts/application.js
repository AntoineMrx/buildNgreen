//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .


let buttons = document.querySelectorAll(".fa-cart-plus")

for(var i = 0; i < buttons.length; i++) {
 buttons[i].addEventListener("click", function() {
  // Do something (callback)
  fetch("/add_item", {
    method: "POST",
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    body: JSON.stringify({ id: event.currentTarget.id }),
    credentials: 'same-origin'
  })
});
}
