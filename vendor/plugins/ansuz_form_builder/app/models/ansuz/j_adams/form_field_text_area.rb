module Ansuz
  module JAdams
    class FormFieldTextArea < ActiveRecord::Base
      has_one :form_field, :as => :field, :class_name => "Ansuz::JAdams::FormField"
      before_create :ensure_label
      has_settings

      # This is the field that this form field's value should be stored in 
      # on the form field response
      def value_field
        "text"
      end

      protected
      def ensure_label
        self.label = "Field Label" unless self.label
      end
    end
  end
end
