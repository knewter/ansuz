class CalendarTime < ActiveRecord::Base
  has_many :events_starting, :class_name => "CalendarEvent", :foreign_key => "start_time_id"
  has_many :events_ending, :class_name => "CalendarEvent", :foreign_key => "end_time_id"
end
