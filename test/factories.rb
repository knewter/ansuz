Factory.sequence :page_name do |pn|
  "home#{pn}"
end

Factory.sequence :user_login do |n|
  "test#{n}"
end

Factory.sequence :user_email do |n|
  "test#{n}@testitestifoo.com"
end

Factory.define :comment do |c|
  c.comments "These are some comments"
  c.association :commentable, :factory => :page
end

Factory.sequence :site_setting_name do |ssn|
  "ANSUZ-#{ssn}"
end

Factory.sequence :site_setting_user_theme_name do |tn|
  "ANSUZ-THEME-#{tn}"
end

Factory.sequence :site_setting_site_title do |st|
  "ANSUZ-SITE-TITLE-#{st}"
end

Factory.define :page do |p|
  p.name { Factory.next(:page_name)}
  p.title "Home"
  p.full_title "Home Page"
  p.published true
  p.status "published"
  p.linked true
end

Factory.define :user do |u|
  u.login{ Factory.next(:user_login) }
  u.password  'test1234'
  u.password_confirmation  'test1234'
  u.email{ Factory.next(:user_email) }
end

Factory.define :site_setting do |ss|
  ss.name { Factory.next(:site_setting_name) }
  ss.user_theme_name { Factory.next(:site_setting_user_theme_name)}
  ss.site_title { Factory.next(:site_setting_site_title) }
  ss.show_inline_edit_links false
  ss.custom_css ""
end

