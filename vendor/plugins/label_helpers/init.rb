require 'form_label_helper'

ActionView::Base.load_helpers(File.dirname(__FILE__) + "/lib/")

ActionView::Base.send :include, FormLabelHelper::Helpers::FormHelper
ActionView::Base.send :include, FormLabelHelper::Helpers::TagHelper
ActionView::Helpers::FormBuilder.send :include, FormLabelHelper::Helpers::FormBuilder