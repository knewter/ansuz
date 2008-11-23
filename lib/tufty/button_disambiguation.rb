# from http://blog.tufty.ath.cx/articles/2007/05/23/dry-and-accessible-javascript
# This fixes rails' problem with multiple submit buttons in an ajax request.
 module Tufty
  module ActionController
    module ButtonDisambiguation
      # Detect submission using either ajax or non-ajax, using a particular button
      def submitted_using_button?(value)
        if request.xhr?
          value == params[:_commit]
        else
          request.post? && params[:commit] == value
        end
      end
    end
  end
  module ActionView
    module FormTagHelperExtensions
      def self.included(base)
        base.alias_method_chain :submit_tag, :button_detection
        base.alias_method_chain :form_tag, :button_detection
      end
      # Submit tag that tells you which button was clicked 
      def submit_tag_with_button_detection(value = "Save changes", options = {})
        if options[:onclick]
          options[:onclick] = "Form.getInputs(this.form,'hidden','_commit')[0].setAttribute('value',this.getAttribute('value'));#{options[:onclick]}" 
        else
          options[:onclick] = "Form.getInputs(this.form,'hidden','_commit')[0].setAttribute('value',this.getAttribute('value'));" 
        end
        submit_tag_without_button_detection(value, options)
      end

      # Completely override form tag to add a hidden field.
      def form_tag_with_button_detection(url_for_options = {}, options = {}, *parameters_for_url, &block)
        html_options = options.stringify_keys
        html_options["enctype"] = "multipart/form-data" if html_options.delete("multipart")
        html_options["action"]  = url_for(url_for_options, *parameters_for_url)

        method_tag = "" 

        case method = html_options.delete("method").to_s
          when /^get$/i # must be case-insentive, but can't use downcase as might be nil
            html_options["method"] = "get" 
          when /^post$/i, "", nil
            html_options["method"] = "post" 
          else
            html_options["method"] = "post" 
            method_tag = content_tag(:div, tag(:input, :type => "hidden", :name => "_method", :value => method), :style => 'margin:0;padding:0')
        end

        if block_given?
          content = capture(&block)
          concat(tag(:form, html_options, true) + method_tag, block.binding)
          concat(tag(:input, :type => "hidden", :name => "_commit", :value => ''), block.binding)
          concat(content, block.binding)
          concat("</form>", block.binding)
        else
          tag(:form, html_options, true) + method_tag + tag(:input, :type => "hidden", :name => "_commit", :value => '')
        end
      end

    end

    module PrototypeHelperExtensions
      def self.included(base)
        base.alias_method_chain :link_to_remote, :degradation
        base.alias_method_chain :submit_to_remote, :button_detection
      end

      # Cleanly degrading link_to_remote
      def link_to_remote_with_degradation(name, options = {}, html_options = {})
        html_options[:href] ||= url_for(options[:url]) 
        link_to_remote_without_degradation(name, options, html_options)
      end
      # Submit_to_remote that tells you which button was clicked
      def submit_to_remote_with_button_detection(name, value, options = {})
        options[:before] ||= ''
        options[:before] = "Form.getInputs(this.form,'hidden','_commit')[0].setAttribute('value',this.getAttribute('value'));#{options[:before]}" 
        submit_to_remote_without_button_detection(name, value, options)
      end
    end
  end
end

ActionView::Helpers::PrototypeHelper.send(:include, Tufty::ActionView::PrototypeHelperExtensions)
ActionView::Helpers::FormTagHelper.send(:include, Tufty::ActionView::FormTagHelperExtensions)
ActionController::Base.send(:include, Tufty::ActionController::ButtonDisambiguation)
