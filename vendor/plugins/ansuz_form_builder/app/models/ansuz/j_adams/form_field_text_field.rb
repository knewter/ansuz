# FIXME: The whole form builder should be built with inheritance, what the heck happened here?
module Ansuz
  module JAdams
    class FormFieldTextField < ActiveRecord::Base
      has_one :form_field, :as => :field, :class_name => "Ansuz::JAdams::FormField"
      before_create :ensure_label

      # This is the field that this form field's value should be stored in 
      # on the form field response
      def value_field
        "string"
      end

      protected
      def ensure_label
        self.label = "Field Label" unless self.label
      end
    end
  end
end
