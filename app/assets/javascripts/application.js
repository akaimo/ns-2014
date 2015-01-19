// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui/core
//= require jquery-ui/widget
//= require jquery-ui/effect-fade
//= require jquery-ui/tabs
//= require jquery_ujs

$(function(){
  $("#tabs").css({opacity:'0'});
  setTimeout(function(){
    $("#tabs").stop().animate({opacity:'1'},500);
  },500);
});

$(function() {
  $( "#tabs" ).tabs({ show: { effect: "fade", duration: "fast" },
        hide: { effect: "fade", duration: "fast" } });
});

$(function(){
    $(".treemenu .lv1btn,.treemenu .lv1body").click(function() {
        $(this).next().slideToggle(100);
    });
});

$(function() {
    $('input[type=radio]').change(function() {
        $('#tr1,#tr2,#tr3,#tr4,#tr5').removeClass('invisible');

        if ($("input:radio[name='tour_infomation[category]']:checked").val() == "空") {
            $('#tr2,#tr3,#tr4,#tr5').addClass('invisible');
            $('.tri2,.tri3,.tri4,.tri5').attr("checked", false);
        } else if($("input:radio[name='tour_infomation[category]']:checked").val() == "海") {
            $('#tr1,#tr3,#tr4,#tr5').addClass('invisible');
            $('.tri1,.tri3,.tri4,.tri5').attr("checked", false);
        } else if($("input:radio[name='tour_infomation[category]']:checked").val() == "山") {
            $('#tr1,#tr2,#tr4,#tr5').addClass('invisible');
            $('.tri1,.tri2,.tri4,.tri5').attr("checked", false);
        } else if($("input:radio[name='tour_infomation[category]']:checked").val() == "乗り物") {
            $('#tr1,#tr2,#tr3,#tr5').addClass('invisible');
            $('.tri1,.tri2,.tri3,.tri5').attr("checked", false);
        } else if($("input:radio[name='tour_infomation[category]']:checked").val() == "観光") {
            $('#tr1,#tr2,#tr3,#tr4').addClass('invisible');
            $('.tri1,.tri2,.tri3,.tri4').attr("checked", false);
        }
    }).trigger('change');
});

$(function(){
  $('.detail').addClass('invisible');
  $('select').change(function() {
    $('.detail').addClass('invisible');
    $('#' + $("#detail_date option:selected").attr("class")).removeClass("invisible");
  });
});