$(document).ready(function(){
  $('.nav-item').on('click', navbar_click);
});

function navbar_click(){
  $('.nav-active').removeClass('nav-active');
  $(this).addClass('nav-active');
}
