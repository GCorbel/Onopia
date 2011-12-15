/**
 * Functions required for the template documentation
 */

$('a[href^="content/"]').live('click', function(event)
{
	event.preventDefault();
	var href = $(this).attr('href');
	
	// Load content
	$('#content').load(href, '', function(responseText, textStatus, XMLHttpRequest)
	{
		$(this).applyTemplateSetup().buildTableOfContent();
	});
	window.location.hash = '#'+href;
	
	// Get nav link
	var a = $('#menu a[href="'+href+'"]');
	if (a.length > 0)
	{
		// Mark as current
		$('#menu a').removeClass('current');
		a.addClass('current');
		
		// Update breadcrumb
		var breadcrumb = $('#breadcrumb').empty();
		while (a.length > 0)
		{
			if (a.get(0).nodeName.toUpperCase() == 'A')
			{
				var target = a;
			}
			else
			{
				var target = a.parent().find('a:first');
			}
			breadcrumb.prepend('<li><a href="'+target.attr('href')+'">'+a.html()+'</a></li>');
			
			// Check if opened
			var li = a.parent();
			if (li.hasClass('closed'))
			{
				li.removeClass('closed');
			}
			
			a = li.parent().parent().children('a, span');
		}
	}
});

// Function for building table of content
$.fn.buildTableOfContent = function()
{
	var h2 = this.find('h2');
	if (h2.length > 0)
	{
		var h1 = this.find('h1:first');
		if (h1.length == 0)
		{
			h1 = this.prepend('<h1>Help</h1>').children(':first');
		}
		var menu = h1.wrap('<div class="h1 with-menu"></div>')
					 .after('<div class="menu"><img src="images/menu-open-arrow.png" width="16" height="16"><ul></ul></div>')
					 .next().children('ul');
		
		h2.each(function(i)
		{
			this.id = 'step'+i;
			menu.append('<li class="icon_down"><a href="#step'+i+'">'+$(this).html()+'</a></li>');
		});
		menu.find('a').click(function(event)
		{
			event.preventDefault();
			$('html, body').animate({scrollTop: $($(this).attr('href')).offset().top });
		});
	}
	
	return this;
};

// Initial page
$(document).ready(function()
{
	var hash = $.trim(window.location.hash || '');
	if (hash.length < 2)
	{
		$('#home a').click();
	}
	else
	{
		hash = hash.substring(1);
		var a = $('a[href="'+hash+'"]');
		if (a.length > 0)
		{
			a.click();
		}
		else
		{
			$('#home a').click();
		}
	}
	
	// Enable back/next buttons
	$(window).bind('hashchange', function()
	{
		var hash = $.trim(window.location.hash || '');
		if (hash.length > 1)
		{
			hash = hash.substring(1);
			var a = $('a[href="'+hash+'"]');
			if (a.length > 0 && !a.hasClass('current'))
			{
				a.click();
			}
		}
	});
});