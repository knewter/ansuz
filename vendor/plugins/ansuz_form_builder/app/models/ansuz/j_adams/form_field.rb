module Ansuz
  module JAdams
    class FormField < ActiveRecord::Base
      belongs_to :form_builder, :class_name => "Ansuz::JAdams::FormBuilder"
      belongs_to :field, :polymorphic => true

      def method_missing(method, *args)
        field.send(method, *args)
      end
    end
  end
end
