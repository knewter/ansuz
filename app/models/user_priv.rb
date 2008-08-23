class UserPriv < ActiveRecord::Base
  def self.authorize(user_id, priv)
    p = find_first(["user_id = ? AND priv = ?", user_id, priv])
    (p != nil)? true: false;
  end
end
