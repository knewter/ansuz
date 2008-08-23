class CalendarTag < ActiveRecord::Base
	has_many :calendar_events
end
