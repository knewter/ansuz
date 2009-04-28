require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    Factory(:user) # To test login uniqueness, else shoulda complains
  end

  should_validate_presence_of :login
  should_validate_presence_of :email
  should_validate_presence_of :password
  should_validate_presence_of :password_confirmation
  should_validate_uniqueness_of :login
  #FIXME How do we test these? Is there a macro?
  #should_validate_confirmation_of :password
  #should_validate_confirmation_of :email
  should_ensure_length_in_range :login,  3..40
  should_ensure_length_in_range :email,  3..100

  context "An instance of user" do
    setup do 
      @user = Factory(:user)
      # We need to test various roles
      Role.base_roles.each do |role_name|
        Role.find_or_create_by_name(role_name)
      end
    end
    context "with no roles" do
      setup do
        @user.roles.delete
      end

      should "not be able to do much" do
        assert_equal(nil, @user.has_a_role_from?(Role::PUBLISHING_ROLES))
        assert_equal(nil, @user.has_a_role_from?(Role::DRAFT_VIEWING_ROLES))
        assert_equal(nil, @user.has_a_role_from?(Role::STATIC_ROLES))
        assert_equal(nil, @user.has_a_role_from?(Role::CONTENT_APPROVER_ROLES))
        assert_equal(nil, @user.has_a_role_from?(Role::AUTHORING_ROLES))
      end
    end

    context "when sent #has_a_role_from?" do
      context "and is in the publishing roles array" do
        setup do
          @user.roles.delete # Start over at each test
          @user.has_role 'final_reviewer'
        end
        should "return true" do
          assert_equal('final_reviewer', @user.has_a_role_from?(Role::PUBLISHING_ROLES))
        end
      end
    end

    context "who can publish" do
      setup do
        @user.has_role 'final_reviewer'
      end

      should "return true from #can_publish?" do
          assert_equal('final_reviewer', @user.has_a_role_from?(Role::PUBLISHING_ROLES))
      end
    end

    context "who can view drafts" do
      setup do
        @user.has_role 'initial_reviewer'
      end

      should "return true from #can_view_drafts?" do
        assert_equal('initial_reviewer', @user.has_a_role_from?(Role::DRAFT_VIEWING_ROLES))
      end
    end

    context "who can author content" do
      setup do
        @user.has_role 'author'
      end

      should "return true from #can_author_content?" do
        assert_equal('author', @user.has_a_role_from?(Role::AUTHORING_ROLES))
      end
    end

    context "who can approve content" do
      setup do
        @user.has_role 'initial_reviewer'
      end

      should "return true from #can_approve_content?" do
        assert_equal('initial_reviewer', @user.has_a_role_from?(Role::CONTENT_APPROVER_ROLES))
      end
    end

  end
end
