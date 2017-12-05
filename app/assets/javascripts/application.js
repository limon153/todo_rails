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
//
//= require jquery
//= require jquery_ujs
//= require vendor/icheck
//= require vendor/select2
//= require_tree .

$(document).ready(function() {

  var checkboxesArr = $('input[type="checkbox"]').toArray();

  var label;
  for(var i = 0; i < checkboxesArr.length; i++) {
    if(checkboxesArr[i].getAttribute('checked')) {
      label = $("label[for='"+checkboxesArr[i].getAttribute('id')+"']");
      label.addClass('line-through');
    }
  }

  $('input').on('checked', function() {
    $element = $(this);
    
    var $label = $("label[for='"+$element.attr('id')+"']");
    $label.toggleClass('line-through');

    var $form = $element.parent().parent();
    $form.submit();
  });

  $('select').select2({
    placeholder: 'Категория',
    minimumResultsForSearch: -1
  });

  $('input').iCheck({
    cursor: true,
    increaseArea: '20%',
    checkboxClass: 'icheckbox_square-blue'
  });

  $('input').on('ifToggled', function() {
    $element = $(this)
    
    var $label = $("label[for='"+$element.attr('id')+"']");
    $label.toggleClass('line-through');

    var $form = $element.parent().parent();
    $form.submit();
  });

  $('#submit-link').click(function() {
    $('#todo-create-form').submit();
    event.preventDefault();
  });

  $('#cancel-link').click(function() {
    $('#add-todo-form').css('visibility', 'hidden');
    $('#add-todo-form').css('opacity', '0');
    event.preventDefault();
  });

  $('#add-todo-link').click(function() {
    $('#add-todo-form').css('visibility', 'visible');
    $('#add-todo-form').css('opacity', '1');
    event.preventDefault();
  });

  $('.form-bg').click(function() {
    $('#add-todo-form').css('visibility', 'hidden');
    $('#add-todo-form').css('opacity', '0');
  });

});

