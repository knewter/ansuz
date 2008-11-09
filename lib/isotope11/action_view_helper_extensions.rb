# override some default rails behaviour for easier styling
module ActionView
  module Helpers
    module FormHelper
      alias_method :orig_text_field, :text_field
      alias_method :orig_password_field, :password_field
      def text_field(object_name, method, options = {})
        orig_text_field(object_name, method, {:class => 'text'}.merge(options))
      end
      def password_field(object_name, method, options = {})
        orig_password_field(object_name, method, {:class => 'text'}.merge(options))
      end
    end
    module FormTagHelper
      alias_method :orig_submit_tag, :submit_tag
      alias_method :orig_text_field_tag, :text_field_tag
      alias_method :orig_password_field_tag, :password_field_tag
      alias_method :orig_check_box_tag, :check_box_tag
      def submit_tag(value = "Save changes", options = {})
        orig_submit_tag(value, {:class => 'button'}.merge(options))
      end
      def text_field_tag(name, value = nil, options = {})
        orig_text_field_tag(name, value, {:class => 'text'}.merge(options))
      end
      def password_field_tag(name, value = nil, options = {})
        orig_password_field_tag(name, value, {:class => 'text'}.merge(options))
      end
      def check_box_tag(name, value = "1", checked = false, options = {})
        orig_check_box_tag(name, value, checked, {:class => 'crirHiddenJS'}.merge(options))
      end
    end
  end
end
