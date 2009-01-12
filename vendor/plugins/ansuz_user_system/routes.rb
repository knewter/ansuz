resource  :session
resend_activation "/send_activation_email", :controller => "sessions", :action => "resend_activation"
with_options :controller => 'sessions' do |session|
  session.login    'login',  :action => 'new'
  session.logout   'logout', :action => 'destroy'
  session.create_user 'create_user', :action => 'create_user'
end
