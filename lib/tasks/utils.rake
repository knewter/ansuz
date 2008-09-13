namespace :utils do
  desc "Create a first admin user if it does not exist"
  task(:create_admin => :environment) do
      # Check to see if it exists
      if User.first.nil?
        puts "Initial Admin User doesn't exist. Creating one with login: admin, password: admin, email: admin@example.com"
        u = User.new :login => 'admin', :email => 'admin@example.com', :password => 'admin', :password_confirmation => 'admin'
        u.save
      else
        puts "Initial user already exists, exiting"
      end    
  end
end
