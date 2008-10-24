class CreateTestimonials < ActiveRecord::Migration
	def self.up
		create_table "testimonials", :force => true do |t|
	    t.text  "content"
	    t.string  "attributed_to"
      t.timestamps
	  end
  end

  def self.end
    drop_table "testimonials"
  end
end
