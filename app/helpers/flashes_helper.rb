module FlashesHelper
  include FamFamFamHelper

  def display_standard_flashes(message = 'There were some problems with your submission:')
    if flash[:notice]
      flash_to_display, level, icon = flash[:notice], 'notice', 'tick'
    elsif flash[:warning]
      flash_to_display, level, icon = flash[:warning], 'warning', 'delete'
    elsif flash[:error]
      level = 'error'
      if flash[:error].instance_of? ActiveRecord::Errors
        flash_to_display = message
        flash_to_display << activerecord_error_list(flash[:error])
      else
        flash_to_display = flash[:error]
      end
      icon = 'error'
    else
      return
    end
    content_tag 'div', famfamfam_icon(icon) + ' ' + flash_to_display, :class => "flash #{level}"
  end
end
