require File.dirname(__FILE__) + '/abstract_unit'
require File.dirname(__FILE__) + '/../lib/form_label_helper'

class FormLabelHelperTest < Test::Unit::TestCase
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include FormLabelHelper::Helpers::FormHelper
  include FormLabelHelper::Helpers::TagHelper
  ActionView::Helpers::FormBuilder.send :include, FormLabelHelper::Helpers::FormBuilder
  
  silence_warnings do
    Post = Struct.new("Post", :title, :author_name, :body, :secret, :written_on, :cost)
    Post.class_eval do
      alias_method :title_before_type_cast, :title unless respond_to?(:title_before_type_cast)
      alias_method :body_before_type_cast, :body unless respond_to?(:body_before_type_cast)
      alias_method :author_name_before_type_cast, :author_name unless respond_to?(:author_name_before_type_cast)
    end
  end

  def setup
    @post = Post.new
    def @post.errors() Class.new{ def on(field) field == "author_name" end }.new end

    def @post.id; 123; end
    def @post.id_before_type_cast; 123; end

    @post.title       = "Hello World"
    @post.author_name = ""
    @post.body        = "Back to the hill and over it again!"
    @post.secret      = 1
    @post.written_on  = Date.new(2004, 6, 15)

    @controller = Class.new do
      attr_reader :url_for_options
      def url_for(options, *parameters_for_method_reference)
        @url_for_options = options
        "http://www.example.com"
      end
    end
    @controller = @controller.new
    @accesskey_list = []
  end

  def test_label_tag
    assert_dom_equal(
      '<label>my label</label>', label_tag("my label")
    )
    assert_dom_equal(
      '<label for="user_name">my label</label>', label_tag("my label", :for => "user_name")
    )
    assert_dom_equal(
      '<label accesskey="M"><kbd>m</kbd>y label</label>', label_tag("my label", :accesskey => "m")
    )
    assert_dom_equal(
    '<label for="user" accesskey="M"><kbd>m</kbd>y label</label>', label_tag("my label", :accesskey => "m", :for => "user")
    )
  end

  def test_label_for
    assert_dom_equal(
      '<label for="user_name" accesskey="N"><kbd>N</kbd>ame</label>', label_for(:user, :name)
    )
    assert_dom_equal(
      '<label for="user_name" accesskey="A">N<kbd>a</kbd>me</label>', label_for(:user, :name)
    )
    assert_dom_equal(
      '<label for="user_name" accesskey="M">Na<kbd>m</kbd>e</label>', label_for(:user, :name)
    )
  end


  def test_form_for_with_label
    _erbout = ''

    form_for(:post, @post, :html => { :id => 'create-post' }) do |f|
      _erbout.concat f.label(:title)
      _erbout.concat f.text_field(:title)
      _erbout.concat f.label(:body)
      _erbout.concat f.text_area(:body)
      _erbout.concat f.label(:secret)
      _erbout.concat f.label(:secret)
      _erbout.concat f.label(:secret, :text => "new secret")
      _erbout.concat f.label(:secret, :skip_auto_accesskey => true)
      _erbout.concat f.check_box(:secret)
    end

    expected = 
      "<form action='http://www.example.com' id='create-post' method='post'>" +
      "<label for='post_title' accesskey='T'><kbd>T</kbd>itle</label>" +
      "<input name='post[title]' size='30' type='text' id='post_title' value='Hello World' />" +
      "<label for='post_body' accesskey='B'><kbd>B</kbd>ody</label>" +
      "<textarea name='post[body]' id='post_body' rows='20' cols='40'>Back to the hill and over it again!</textarea>" +
      "<label for='post_secret' accesskey='S'><kbd>S</kbd>ecret</label>" +
      "<label for='post_secret' accesskey='E'>S<kbd>e</kbd>cret</label>" +
      "<label for='post_secret' accesskey='N'><kbd>n</kbd>ew secret</label>" +
      "<label for='post_secret'>Secret</label>" +
      "<input name='post[secret]' checked='checked' type='checkbox' id='post_secret' value='1' />" +
      "<input name='post[secret]' type='hidden' value='0' />" +
      "</form>"

    assert_dom_equal expected, _erbout
  end

end
