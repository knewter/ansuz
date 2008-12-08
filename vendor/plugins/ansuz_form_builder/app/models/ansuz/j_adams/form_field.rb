module Ansuz
  module JAdams
    class FormField < ActiveRecord::Base
      belongs_to :form_builder, :class_name => "Ansuz::JAdams::FormBuilder"
      belongs_to :field, :polymorphic => true

      def method_missing(method, *args)
        if field and field.respond_to?(method)
          field.send(method, *args)
        else
          super(method, *args)
        end
      end
    end
  end
end
