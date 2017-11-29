//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .


document.querySelector(".fa-cart-plus").addEventListener("click", function() {
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
