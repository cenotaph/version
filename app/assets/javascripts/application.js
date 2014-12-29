//= require jquery
//= require jquery_ujs
//= require jquery.viewport.mini
//= require slick.min

jQuery.expr.filters.offscreen = function(el) {
  return (
              (el.offsetLeft + el.offsetWidth) < 0 
              || (el.offsetTop + el.offsetHeight) < 0
              || (el.offsetLeft > window.innerWidth || el.offsetTop > window.innerHeight)
         );
};

function check_overlay(destination) {
  $("#overlay").css({top: destination.top, left: destination.left - $('body').offset().left - 10 });

  $("#overlay").fadeIn();
  if ($('#overlay').is(':off-right')) {
    $("#overlay").css({top: destination.top, left: destination.left - $('body').offset().left - 350 });
  }
  if ($('#overlay').is(':off-left')) {
    $("#overlay").css({top: destination.top, left: "10px" });
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


