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
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require inputosaurus
//= require_tree .


var opts = {
  lines: 13, // The number of lines to draw
  length: 4, // The length of each line
  width: 3, // The line thickness
  radius: 12, // The radius of the inner circle
  corners: 1, // Corner roundness (0..1)
  rotate: 0, // The rotation offset
  direction: 1, // 1: clockwise, -1: counterclockwise
  color: '#000', // #rgb or #rrggbb or array of colors
  speed: 1, // Rounds per second
  trail: 60, // Afterglow percentage
  shadow: false, // Whether to render a shadow
  hwaccel: false, // Whether to use hardware acceleration
  className: 'spinner', // The CSS class to assign to the spinner
  zIndex: 2e9, // The z-index (defaults to 2000000000)
  top: 'auto', // Top position relative to parent in px
  left: 'auto' // Left position relative to parent in px
};
var target = document.getElementById('loadmoreajaxloader');
var spinner = new Spinner(opts).spin(target);

var page_counter = 2;

$(window).scroll(function()
{
    if($(window).scrollTop() == $(document).height() - $(window).height())
    {
        $('div#loadmoreajaxloader').show();
        $.ajax({
        url: "/snaps?page="+page_counter,
        success: function(html)
        {
            if($(html).find('li').length > 0 )
            {
                $('ul').append($(html).find('li'));
                $('div#loadmoreajaxloader').hide();
                page_counter++
            }else
            {
                $('div#loadmoreajaxloader').html('<center>Snap! No more snaps.</center>');
            }
        }
        });
    }
});

$('#tags').inputosaurus({
			width : '350px',
			allowDuplicates: false,
			nputDelimiters: [',', ';', " "],
			change : function(ev){
				$('#widget1_reflect').val(ev.target.value);
			}
		});


