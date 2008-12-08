module Ansuz
  module JAdams
    class FormBuilderResponse < ActiveRecord::Base
      belongs_to :form_builder, :class_name => "Ansuz::JAdams::FormBuilder"
      has_many   :form_field_responses, :class_name => "Ansuz::JAdams::FormFieldResponse"
    end
  end
end
