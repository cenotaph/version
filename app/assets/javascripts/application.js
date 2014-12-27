//= require jquery
//= require jquery_ujs
//= require jquery.viewport.mini

jQuery.expr.filters.offscreen = function(el) {
  return (
              (el.offsetLeft + el.offsetWidth) < 0 
              || (el.offsetTop + el.offsetHeight) < 0
              || (el.offsetLeft > window.innerWidth || el.offsetTop > window.innerHeight)
         );
};

function scrollTo(target) { 
  $('html, body').stop().animate({
      'scrollTop': $(target).offset().top - 40
  }, 900, 'swing', function () {
      window.location.hash = target;
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


