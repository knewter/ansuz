require File.dirname(__FILE__) + '/../spec_helper'

describe User do

  before(:all) do
    @user = User.new
  end

  describe "authorization" do

    describe "publishing" do
      it "should be allowed if not in Publishing role" do
        @user.expects(:has_a_role_from?).with(Role::PUBLISHING_ROLES).returns(true)
        @user.can_publish?.should == true
      end
    end

    describe "viewing drafts" do
      it "should be allowed if not in View Drafts role" do
        @user.expects(:has_a_role_from?).with(Role::DRAFT_VIEWING_ROLES).returns(true)
        @user.can_view_drafts?.should == true
      end
    end

    describe "authoring content" do
      it "should be allowed if not in Author Content role" do
        @user.expects(:has_a_role_from?).with(Role::AUTHORING_ROLES).returns(true)
        @user.can_author_content?.should == true
      end
    end

    describe "approving content" do
      it "should be allowed if not in Approve Content role" do
        @user.expects(:has_a_role_from?).with(Role::CONTENT_APPROVER_ROLES).returns(true)
        @user.can_approve_content?.should == true
      end
    end

  end
end
