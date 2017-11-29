//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .


document.querySelector(".add").addEventListener("click", () => {
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
