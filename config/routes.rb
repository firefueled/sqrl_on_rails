Rails.application.routes.draw do
  post 'authenticate' => 'sqrl_on_rails/sqrl_on_rails#authenticate'
  get 'am_loggedin' => 'sqrl_on_rails/application#am_loggedin'
  get 'loggedin', :controller => 'sqrl_on_rails/sqrl_on_rails', :action => 'loggedin', :as => 'loggedin'
end
