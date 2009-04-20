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
