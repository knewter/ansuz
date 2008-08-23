require 'action_view'
require 'action_view/helpers/tag_helper'
require 'action_view/helpers/form_helper'

module FormLabelHelper
  class Base
    @@field_error_proc = Proc.new{ |html_tag, instance, css_class| "<div class=\"#{css_class || "fieldWithErrors"}\">#{html_tag}</div>" }
    cattr_accessor :field_error_proc
  end
  module Helpers
    module TagHelper
      def label_tag(str, options = {})
        options[:accesskey].upcase! if options[:accesskey]
        "<label #{tag_options(options.stringify_keys) if options}>#{ options[:accesskey] ? str.sub(/#{options[:accesskey]}/i, '<kbd>\0</kbd>') : str }</label>"
      end

    end

    module FormHelper
      def label_for(object_name, method, options = {})
        options.merge!(:accesskey => get_first_available_accesskey(options[:text] || method.to_s)) unless options[:skip_auto_accesskey]
        options.delete(:skip_auto_accesskey)
        InstanceTag.new(object_name, method, self, nil, options.delete(:object)).to_label_tag(options)
      end

      private
        def get_first_available_accesskey(method)
          @accesskey_list ||= []
          ref_method = method.to_s.gsub(/\s/, '')
          @accesskey_list << ref_method.first.upcase and return ref_method.first.upcase if !@accesskey_list.include?(ref_method.first.upcase)
          return get_first_available_accesskey(ref_method[1..ref_method.size])
        end

    end

    class InstanceTag < ActionView::Helpers::InstanceTag #:nodoc:
      include FormLabelHelper::Helpers::TagHelper
#      alias_method :label_without_error_wrapping, :to_label_tag
      def to_label_tag(options)
        if object.respond_to?("errors") && object.errors.respond_to?("on")
          error_wrapping(to_label_without_error_wrapping(options), object.errors.on(@method_name), "labelWithError")
        else
          to_label_without_error_wrapping(options)
        end
      end

      def error_wrapping(html_tag, has_error, css_class = nil)
        has_error ? Base.field_error_proc.call(html_tag, self, css_class) : html_tag
      end

      def to_label_without_error_wrapping(options)
        ref_options = {}
        add_default_name_and_id(ref_options)
        options[:for] ||= ref_options["id"]
        label_tag(options[:text] ? options.delete(:text) : method_name.humanize, options)
      end
    end

    module FormBuilder
      
      def label(method, options = {})
        @template.label_for(@object_name, method, options.merge(:object => @object))
      end

    end
        
  end
end
