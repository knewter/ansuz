module Ansuz
  module JAdams
    class FormFieldResponse < ActiveRecord::Base
      belongs_to :form_builder_response, :class_name => "Ansuz::JAdams::FormBuilderResponse"
      belongs_to :form_field, :class_name => "Ansuz::JAdams::FormField"
    end
  end
end
