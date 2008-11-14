// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// This will provide a plugin to allow you to focus the first input field
// of a given form on page load
// So you can do $('#form1').focusFirstField();
(function(jQuery){
  jQuery.fn.focusFirstField = function(){
    $this = this;
    $this.find(":text:visible:enabled").filter(function(){
      return jQuery(this).parents(":hidden").size() == 0;
    }).slice(0,1).focus();
    return this;
  }
})(jQuery);
