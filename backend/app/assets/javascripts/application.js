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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require_jquery-ui

$(document).ready(function() {
    var slider = $("#money_slider").slider({
        range: true,
        min: 10000,
        max: 500000,
        values: [250000, 450000],
        slide: function(event, ui) {
            $("#hunter_profile_min_salary").val(ui.values[0]);
            $("#hunter_profile_max_salary").val(ui.values[1]);
        }
    });
    $("#hunter_profile_min_salary").val(slider.slider("values")[0]);
    $("#hunter_profile_max_salary").val(slider.slider("values")[1]);
});


