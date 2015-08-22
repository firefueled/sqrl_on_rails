SqrlOnRails::Engine.routes.draw do
  post 'attempt_login' => 'sqrl_on_rails/sqrl_on_rails#attempt_login'
  get 'am_loggedin' => 'sqrl_on_rails/sqrl_on_rails#am_loggedin'
  get 'loggedin', :controller => 'sqrl_on_rails/sqrl_on_rails', :action => 'loggedin', :as => 'loggedin'
end
