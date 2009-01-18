// CHANGE FOR APPS HOSTED IN SUBDIRECTORY
FCKRelativePath = '';

// DON'T CHANGE THESE
FCKConfig.LinkBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Connector='+FCKRelativePath+'/fckeditor/command';
FCKConfig.ImageBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Image&Connector='+FCKRelativePath+'/fckeditor/command';
FCKConfig.FlashBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Flash&Connector='+FCKRelativePath+'/fckeditor/command';

FCKConfig.LinkUploadURL = FCKRelativePath+'/fckeditor/upload';
FCKConfig.ImageUploadURL = FCKRelativePath+'/fckeditor/upload?Type=Image';
FCKConfig.FlashUploadURL = FCKRelativePath+'/fckeditor/upload?Type=Flash';
FCKConfig.SpellerPagesServerScript = FCKRelativePath+'/fckeditor/check_spelling';
FCKConfig.AllowQueryStringDebug = false;
FCKConfig.SpellChecker = 'SpellerPages';

// ONLY CHANGE BELOW HERE
FCKConfig.SkinPath = FCKConfig.BasePath + 'skins/silver/';

FCKConfig.ToolbarSets["Simple"] = [
  ['Source','-','Save','NewPage','Preview','-','Templates'],
  ['Cut','Copy','Paste','PasteText','PasteWord'],
  ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
  ['Form','Checkbox','Radio','TextField','Textarea','Select','Button','ImageButton','HiddenField'],
  '/',
  ['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
  ['OrderedList','UnorderedList','-','Outdent','Indent','Blockquote'],
  ['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
  ['Link','Unlink','Anchor'],
  ['Image','Flash','Table','Rule','Smiley','SpecialChar','PageBreak'],
  '/',
  ['Style','FontFormat','FontName','FontSize'],
  ['TextColor','BGColor'],
  ['Print','SpellCheck','-','FitWindow','ShowBlocks','-','About']   // No comma for the last row.
] ;


FCKConfig.EnterMode = 'br';
