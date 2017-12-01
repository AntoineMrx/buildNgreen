//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require attachinary_template


let buttons = document.querySelectorAll(".fa-cart-plus");

for(var i = 0; i < buttons.length; i++) {
 buttons[i].addEventListener("click", function() {
  // Do something (callback)
  fetch("/add_item", {
    method: "POST",
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    body: JSON.stringify({ id: event.currentTarget.id, quantity:1 }),
    credentials: 'same-origin'
  })
});
}

let addItem = document.querySelector(".add-basket");

if (addItem) {
  addItem.addEventListener("click", function() {
    const selectedQuantity = document.getElementById("quantity").value;
    fetch("/add_item", {
      method: "POST",
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      body: JSON.stringify({ id: event.currentTarget.id, quantity:selectedQuantity }),
      credentials: 'same-origin'
    })
  })
}
