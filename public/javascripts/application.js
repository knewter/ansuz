// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


// TESTING. I know this stuff doesn't go here
jQuery(document).ready(function()
{
	jQuery("div.page_controls ul li.direction a").click(function()
	{
	  var easing;
		var link		= jQuery(this);
		var li			= link.parents('li');
		var parent_li = li.parents('li:first');
		
		var above   = parent_li.prevAll('li');
		var below   = parent_li.nextAll('li');
		var cur_offset = link.parents('li.main_node').offset();

	
		if( parent_li.hasClass('up') )
		{
			if( above.length > 0 )
			{
				easing = "+=25px";			
			} 

		} else {
			if( below.length > 0 )
			{
				easing = "-=25px";	
			}
		}
	
		if( easing !== undefined)
		{
			var container = jQuery("yui-g");
			li.css("top", cur_offset.top);
			li.css("left", cur_offset.left);
			var last_position = li.css("position");
			li.css("position", "fixed");
			//container.animate({"height": easing}, "fast", "swing" });
			li.animate({"top": easing}, "slow", "swing", function() { li.css("position", last_position)});		
		}
	
		return false;
	});

	// Clone a given list item, hide it and insert it above the specified <li>.
	function add_new_list_item(list_item)
	{
	
	}
});
