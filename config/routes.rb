Rails.application.routes.draw do
  post 'signed_challenge' => 'sqrl_on_rails/sqrl_on_rails#signed_challenge'
  get 'am_loggedin' => 'sqrl_on_rails/sqrl_on_rails#am_loggedin'
  get 'loggedin', :controller => 'sqrl_on_rails/sqrl_on_rails', :action => 'loggedin', :as => 'loggedin'
end