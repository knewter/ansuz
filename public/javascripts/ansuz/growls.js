// TODO: change css and image to be error-ish
function error_growl_template()
{
		jQuery.growl.settings.displayTimeout = 6000;
		jQuery.growl.settings.noticeTemplate = ''
			+ '<div>'
			+ '<div style="float: right; background-image: url(my.growlTheme/normalTop.png); position: relative; width: 259px; height: 16px; margin: 0pt;"></div>'
			+ '<div style="float: right; background-image: url(my.growlTheme/normalBackground.png); position: relative; display: block; color: #ffffff; font-family: Arial; font-size: 12px; line-height: 14px; width: 259px; margin: 0pt;">'
			+ ' <img style="margin: 14px; margin-top: 0px; float: left;" src="%image%" />'
			+ ' <h3 style="margin: 0pt; margin-left: 77px; padding-bottom: 10px; font-size: 13px;">%title%</h3>'
			+ ' <p style="margin: 0pt 14px; margin-left: 77px; font-size: 12px;">%message%</p>'
			+ '</div>'
			+ '<div style="float: right; background-image: url(my.growlTheme/normalBottom.png); position: relative; width: 259px; height: 16px; margin-bottom: 10px;"></div>'
			+ '</div>';
		jQuery.growl.settings.noticeCss = {
			position: 'relative'
		};	
}

// TODO: add real image paths..
function notice_growl_template()
{
		jQuery.growl.settings.displayTimeout = 4000;
		jQuery.growl.settings.noticeTemplate = ''
			+ '<div>'
			+ '<div style="float: right; background-image: url(my.growlTheme/normalTop.png); position: relative; width: 259px; height: 16px; margin: 0pt;"></div>'
			+ '<div style="float: right; background-image: url(my.growlTheme/normalBackground.png); position: relative; display: block; color: #ffffff; font-family: Arial; font-size: 12px; line-height: 14px; width: 259px; margin: 0pt;">'
			+ ' <img style="margin: 14px; margin-top: 0px; float: left;" src="%image%" />'
			+ ' <h3 style="margin: 0pt; margin-left: 77px; padding-bottom: 10px; font-size: 13px;">%title%</h3>'
			+ ' <p style="margin: 0pt 14px; margin-left: 77px; font-size: 12px;">%message%</p>'
			+ '</div>'
			+ '<div style="float: right; background-image: url(my.growlTheme/normalBottom.png); position: relative; width: 259px; height: 16px; margin-bottom: 10px;"></div>'
			+ '</div>';
		jQuery.growl.settings.noticeCss = {
			position: 'relative'
		};	
}

// Trigger a growl alert. Call one of the above template methods before this guy if you want to style it
function notify(message, title)
{
	jQuery.growl(title || 'Notice', message || '');
	jQuery.growl.settings = $default_growl_settings;
}


jQuery(document).ready(function()
{
	// Prevent the default growl settings from being overwritten.
	$default_growl_settings = jQuery.growl.settings;
	
	var jq = jQuery.noConflict();	
	jq('a.edit_page_plugin', jq('#page_plugins')).click(function()
	{
		var modal = jq('#modal');
		if(modal.html() == "")
		{
			jq.ajax({
				type: 'GET',
				url: jq(this).attr('href'),
				complete: function(transport)
				{
					modal.jqm({overlay: 50});

					jq('a.jqmClose').click(function(){
						jq(this).jqmHide();
						return false;
					});
					
					modal.jqmHide();				
					modal.html(transport.responseText)
					modal.jqmShow();
				}
			});
		} else {
			// Don't load it again
			modal.jqmShow();
		}
		return false
	});
	
	// Make ESC close modal windows
	jq(document).keypress(function(e)
	{
		if( e.which === 0 )
		{
			var windows = jq('#modal, .jqmWindow');
			if( windows )
			{
				windows.jqmHide(); // doesn't seem to work with the iframe > textarea thing focused. meh
			}
		}
	})
});
