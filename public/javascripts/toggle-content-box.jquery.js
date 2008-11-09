jQuery(document).ready(function(){
  jQuery('.toggle-content-box .toggle-contents').hide();
  jQuery('.toggle-content-box .toggle-link').click(function(){
    var content = jQuery(this).next();
    var current_rotation = content.data('rotation') || 0
    content.data('rotation', current_rotation + 1)
    if(content.data('rotation') % 2){
      content.slideDown();
    }else{
      content.slideUp();
    }

    return false;
  });
});
