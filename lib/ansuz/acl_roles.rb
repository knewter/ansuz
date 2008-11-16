module Ansuz
  module AclRoles
    STATIC_CAN_POST_ROLES = %w(admin author)
    STATIC_CAN_PUBLISH_ROLES = %w(admin final_reviewer)

    def can_post?
      can_do_thing? :post
    end

    def can_publish?
      can_do_thing? :publish
    end

    def can_do_thing? thing
      roles = case thing
              when :publish
                STATIC_CAN_PUBLISH_ROLES
              when :post
                STATIC_CAN_POST_ROLES
              end
      acceptable_roles = roles.select do |role|
                           self.has_role?(role)
                         end
      acceptable_roles.any?
    end
  end
end
