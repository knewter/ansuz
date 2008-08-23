class CalendarEvent < ActiveRecord::Base
	belongs_to :calendar_tag
#	belongs_to :start_time, :class_name => "CalendarTime", :foreign_key => 'start_time_id'
#	belongs_to :end_time, :class_name => "CalendarTime", :foreign_key => 'end_time_id'

  def self.new_copy(old_event)
    if (old_event)
      new_event = CalendarEvent.new
      new_event.attributes = old_event.attributes 
      new_event
    end
  end
end
