/*
 * A simple JQuery plugin for an RSS-fed news box
 *
 * @author Francesco Vivoli <f.vivoli@gmail.com> - http://atalayasec.org	
 * Based on code found on the JQuery mailing list
 */
(function($) {
	
/**
 * Configure the news box container with url, maximum number of posts
 * to be fetched and their text length.
 * @example $('#newsbox').feedreader({
 *		targeturl: 'http://blogs.atalayasec.org/atalaya/?feed=rss2',
 *		items: 3,
 *		descLength: 15
 *	});
 * @desc fill the #newsbox element with at most 3 posts taken from the above url, and showig
 * a teaser of at most 15 words.
 *	
 */	
$.fn.feedreader = function(options) {
	var defaults = {
		targeturl: 'http://blogs.atalayasec.org/atalaya/?feed=rss2',
		items: 30,
		descLength: 150
	}
	if(!options.targeturl)	return false;
	var opts = $.extend(defaults, options);
	$(this).each(function(){
			var container = this;
			$.get(opts.targeturl,function(xml){
					var posts=[];
					var i=0;
					$("item", xml).each(function(){
									if(i>opts.items-1)	return;
									var post={};
									$(this).find("link").each(function(){
										post.link=getNodeText(this);
									});
									$(this).find("title").each(function(){
										post.title=getNodeText(this);
									});
									$(this).find("pubDate").each(function(){
										post.date=getNodeText(this);
									});
									$(this).find("description").each(function(){
										var t=getNodeText(this);
										post.desc=trimtext(t,opts.descLength)+'[...]';
									});
									posts[i++]=post;
					 });
					writeposts(container,posts);					
				
			})
	});	
	
};

function trimtext(text,length){
	var t = text.replace(/\s/g,' ');
	var words = t.split(' ');
	if(words.length<=length)	return text;
	var ret='';
	for(var i=0;i<length;i++){
		ret+=words[i]+' ';
	}
	return ret;
}

function writeposts(container,posts){
	$(container).empty();
	var html = '<dl>';
	for(var k in posts){
		html+=format(posts[k])
	}
	html += '</dl>';
	$(container).append(html);
}

function format(post){
	var html='<dt> <a href="'+post.link+'">'+post.title+'</a><br /></dt>';
	html+='<dd>'+post.desc+'</dd>';
  if(!post.title){
    html = '';
  }
	return html;	
}

function getNodeText(node)
{
        var text = "";
        if(node.text) text = node.text;
        if(node.firstChild) text = node.firstChild.nodeValue;
        return text;
}

})(jQuery);
