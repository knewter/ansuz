require 'test_helper'

class PageControllerTest < ActionController::TestCase
  context "When hitting /pages/" do
    setup do
      # set up a page to visit
      @page = pages(:home)
    end
    context "as a public user" do
      context "for html" do
        setup do
          get :indexer, :path => ["home"]
        end

        should_respond_with :ok
        should "have the content section module's content included" do
          assert_select "div.page-plugin-0"
        end
      end

      context "for xml" do
        setup do
          get :indexer, :path => ["home.xml"]
        end

        should_respond_with :ok
        should "have the content section module's content included" do
          assert tag("page page-plugins page-plugin contents")
        end
      end
    end
  end
end
