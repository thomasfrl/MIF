// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require vendor.min
//= require app
//= require jquery3
//= require popper
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require alert_message

$("#myCarousel").carousel({
  interval: 10000
});

$(".carousel .item").each(function() {
  var next = $(this).next();
  if (!next.length) {
    next = $(this).siblings(":first");
  }
  next
    .children(":first-child")
    .clone()
    .appendTo($(this));

  if (next.next().length > 0) {
    next
      .next()
      .children(":first-child")
      .clone()
      .appendTo($(this));
  } else {
    $(this)
      .siblings(":first")
      .children(":first-child")
      .clone()
      .appendTo($(this));
  }
});
