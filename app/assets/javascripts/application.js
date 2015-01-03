//= require jquery
//= require jquery_ujs
//= require jquery.viewport.mini
//= require slick.min
//= require jplayer

 
jQuery.expr.filters.offscreen = function(el) {
  return (
              (el.offsetLeft + el.offsetWidth) < 0 
              || (el.offsetTop + el.offsetHeight) < 0
              || (el.offsetLeft > window.innerWidth || el.offsetTop > window.innerHeight)
         );
};

function check_overlay(destination) {
  if (parseInt($('body').css('width')) < 715) {
    $("#overlay").css({top: destination.top, left: $('.version_wrapper').offset().left});
  } else {
    $("#overlay").css({top: destination.top, left: (destination.left - 5)});
  }
  $("#overlay").fadeIn();

  if ($('#ajaxtarget').is(':off-right')) {

    if (parseInt($('body').css('width')) < 715) {

      $("#overlay").css({top: destination.top, left: $('.version_wrapper').offset().left });

    } else {
      $("#overlay").css({top: destination.top, left: destination.left - $('body').offset().left - 350 });
    }
  }
  if ($('#ajaxtarget').is(':off-left')) {

    $("#overlay").css({top: destination.top, left: $('.version_wrapper').offset().left});
 

  }
  
}

function fix_url(id, new_url) {
  window.history.pushState(id, '', new_url);
}

function resize_wrapper() {

 if ($('.version_module_closed.opened').length) {
   check_overlay($('.version_module_closed.opened').offset());
 }
}

$(window).on('resize', function() {
  resize_wrapper();
});


function audio_launch(id,  url) {
    $('.jp-jplayer').jPlayer("destroy");
    $("#" + id).jPlayer({
    ready: function() {
             $(this).jPlayer("setMedia", {
                mp3: url
              }).jPlayer("play");
          },

    supplied: "mp3",
    wmode: "window",
   remainingDuration: true,
   toggleDuration: true
  });
}

function removeHash () { 
  history.pushState("", document.title, window.location.pathname + window.location.search);
}

function remove_permalink() {
  fix_url('version', '/posts');
  return true;
}

function scrollTo(target) { 
  $('html, body').stop().animate({
      'scrollTop': $(target).offset().top - 40
  }, 900, 'swing', function () {
      window.location.hash = target;
      removeHash();
  });
  return false;
}


(function($) {
	$.extend($.expr[':'], {
		'off-top': function(el) {
			return $(el).offset().top < $(window).scrollTop();
		},
		'off-right': function(el) {
			return $(el).offset().left + $(el).outerWidth() - $(window).scrollLeft() > $(window).width();
		},
		'off-bottom': function(el) {
			return $(el).offset().top + $(el).outerHeight() - $(window).scrollTop() > $(window).height();
		},
		'off-left': function(el) {
			return $(el).offset().left < $(window).scrollLeft();
		}
	});
})(jQuery);


