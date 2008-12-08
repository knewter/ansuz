module Ansuz
  module JAdams
    class FormBuilder < ActiveRecord::Base
      has_many :form_fields, :dependent => :destroy, :class_name => "Ansuz::JAdams::FormField"
      has_many :form_builder_responses, :dependent => :destroy, :class_name => "Ansuz::JAdams::FormBuilderResponse"

      before_save :ensure_submit_text

      def self.admin_partial
        "/admin/form_builders/edit"
      end

      def edit_path
        "/admin/form_builders/#{id}/edit"
      end

      def self.view_partial
        "/admin/form_builders/form_builder"
      end

      protected
      def ensure_submit_text
        if self.submit_text.blank?
          self.submit_text = "Submit"
        end
      end
    end
  end
end
