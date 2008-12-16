class HasSettingsSetting < ActiveRecord::Base
  serialize :settings
  belongs_to :configurable, :polymorphic => :true
end
