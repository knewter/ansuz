module Ansuz
  module JAdams
    class FormFieldResponse < ActiveRecord::Base
      belongs_to :form_builder_response, :class_name => "Ansuz::JAdams::FormBuilderResponse"
      belongs_to :form_field, :class_name => "Ansuz::JAdams::FormField"

      def value
        self.send(form_field.field.value_field) || "N/A"
      end
    end
  end
end
