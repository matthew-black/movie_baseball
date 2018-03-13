$(document).ready(function() {

  // Show login form:
  $("#session-manager").on("click", "#login-link", function(event) {
    event.preventDefault();
    var $li = $(this);
    var url = $li.find("a").attr("href");
    var request = $.ajax({
      url: url
    })
    request.done(function(response) {
      $li.closest("nav").siblings().remove();
      $li.closest("div").append(response);
    })
  })

  // Show login error or update with a logged-in view:
  $("#session-manager").on("submit", "#login-form", function(event) {
    event.preventDefault();
    var $loginForm = $(this)
    var url = $loginForm.attr("action");
    var method = $loginForm.attr("method");
    var data = $loginForm.serialize();
    $loginForm.children().remove();
    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response) {
      $loginForm.closest("#session-manager").children().remove();
      $("body").find("#session-manager").append(response);
    })
  })

  // Show registration form!
  $("#session-manager").on("click", "#register-link", function(event) {
    event.preventDefault();
    var $li = $(this);
    var url = $li.find("a").attr("href");
    var request = $.ajax({
      url: url
    })
    request.done(function(response) {
      $li.closest("nav").siblings().remove();
      $li.closest("div").append(response);
    })
  })

  // Show registration error(s) or update with a logged-in view:
  $("#session-manager").on("submit", "#registration-form", function(event) {
    event.preventDefault();
    var $registrationForm = $(this);
    var url = $registrationForm.attr("action");
    var method = $registrationForm.attr("method");
    var data = $registrationForm.serialize();
    $registrationForm.children().remove();
    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response) {
      $registrationForm.closest("#session-manager").children().remove();
      $("body").find("#session-manager").append(response);
    })
  })

  // When "Start Game" is clicked, show a movie:
  $("#game-space").on("submit", "#start-game", function(event) {
    event.preventDefault();
    $startForm = $(this);
    var url = $startForm.attr("action");
    var method = $startForm.attr("method");
    $startForm.remove();
    var request = $.ajax({
      url: url,
      method: method
    })
    request.done(function(response) {
      $("#game-space").append(response);
    })

  })

  $("#game-space").on("submit", "#actor-guess", function(event) {
    event.preventDefault();
    $actorForm = $(this);
    var url = $actorForm.attr("action");
    var method = $actorForm.attr("method");
    var data = $actorForm.serialize();
    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response) {
      $("#game-space").append(response);
    })
  })

  $("#game-space").on("submit", "#movie-guess", function(event) {
    event.preventDefault();
    $movieForm = $(this);
    var url = $movieForm.attr("action");
    var method = $movieForm.attr("method");
    var data = $movieForm.serialize();
    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response) {
      $("#game-space").append(response);
    })
  })

});











