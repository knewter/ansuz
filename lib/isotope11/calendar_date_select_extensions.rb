class CalendarDateSelect
  module FormHelper
    alias_method :orig_calendar_date_select_tag, :calendar_date_select_tag
    alias_method :orig_calendar_date_select, :calendar_date_select
    def calendar_date_select_tag( name, value = nil, options = {})
      options[:class] ||= ""
      options[:class] <<  "text"
      orig_calendar_date_select_tag(name, value, options)
    end

    def calendar_date_select(object, method, options={})
      options[:class] ||= ""
      options[:class] <<  "text"
      orig_calendar_date_select(object, method, options)
    end
  end
end
