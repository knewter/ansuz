require 'test/test_helper'

class SiteSettingTest < ActiveSupport::TestCase
  context "An instance of site setting" do
    setup do
      @site_setting = Factory(:site_setting, :user_theme_name => "Test")
    end

    context "with a valid theme name" do
      should "respond to get_theme_setting appropriately" do
        assert_equal("Test", @site_setting.get_theme_setting)
      end
    end

    context "with a no theme name" do
      setup do
        @site_setting.user_theme_name = ""
      end
      should "respond to get_theme_setting appropriately" do
        assert_equal("default", @site_setting.get_theme_setting)
      end
    end
  end
end
