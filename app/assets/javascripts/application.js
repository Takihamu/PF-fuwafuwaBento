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
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).ready(function () {
  $("#images").skippr({
    transition : 'fade',
    speed : 1000,
    easing : 'easeOutQuart',
    navType : 'block',
    childrenElementType : 'div',
    arrows : true,
    autoPlay : true,
    autoPlayDuration : 3000,
    keyboardOnAlways : true,
    hidePrevious : false
  });
});

$(function () {
    $(document).on('turbolinks:load', function () {
        function eventCalendar() {
            return $('#calendar').fullCalendar({});
        };
        function clearCalendar() {
            $('#calendar').html('');
        };
        $(document).on('turbolinks:load', function () {
          eventCalendar();
        });
        $(document).on('turbolinks:before-cache', clearCalendar);
//$('#customer_id').val()
// TODO: ここを動的に作り替える url(routing), hiddenで埋め込む, location.href適当なメソッドでとる
        $('#calendar').fullCalendar({
          events: '1.json'
        });
    });
});