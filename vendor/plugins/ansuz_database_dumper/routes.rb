namespace :admin do |admin|
  admin.resource :database_dumper, :collection => [:mysql_dump]
end
