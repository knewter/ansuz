//
// Galeria v1.3
// Autor: Oscar Linares
// http://www.innovacionweb.com/galeria-accesible-jquery.php
// http://code.google.com/p/galeria-jquery-jsgal/
//
// Gracias a:
// Ariel Flesler por su plugin jQuery.Preload, aunque al final no lo uso (muy potente, demasiado
// para lo que necesito aquí).
// http://flesler.blogspot.com/2008/01/jquerypreload.html
// Para la precarga me inspire en (muchas gracias)
// http://www.noth.es/2007/11/25/actualizacion-del-jquery-gallery-v-0-2/
//
(function($) {
  //
  // plugin
  //
  $.fn.galimg = function() {
	// trabaja con cada elemento
	return this.each(function() {
	  var idCapaGaleria = $(this).attr("id");
	
	  $("a", this).click(function() {
		// otra posibilidad para mostrar el aviso de cargando.
		//$("#" + idCapaGaleria + " .imgprin").append("<div class='jsgalpre'>Cargando...</div>");
	  
		var rutaImagen = $(this).attr("href");
		var altImagen = $(this).children("img").attr("alt");
		
		$("#" + idCapaGaleria + " .imgprin img").fadeOut("normal").remove();
		
		var objImagen = new Image(); 
		
		$(objImagen).load(function() {
			$(this).hide();
			
            $("#" + idCapaGaleria + " .imgprin").append(this);
                                             
            $(this).fadeIn("slow");              
        });
		
		$(objImagen).attr("src", rutaImagen);
		
		//$("#" + idCapaGaleria + " .imgprin .jsgalpre").remove();
		
        return false;
      });
	});
  };
  //
  // fin del plugin
  //
})(jQuery);