module SqrlOnRails
  class ApplicationController < ActionController::Base
    helper SqrlOnRails::ApplicationHelper
    skip_before_filter  :verify_authenticity_token

    def attempt_login
      client = params[:client]
      server = params[:server]
      ids = params[:ids]
      pids = params[:pids]
      urs = params[:urs]

      p signed_challenge
      p server_url

      render status: :ok unless valid?(signed_challenge, server_url)

      respond
    end

    def valid?(signed_challenge, server_url)
      true
    end

    def am_loggedin
      nut = params[:nut]
      p "nut=#{nut}"

      auth_attempt = SqrlAuthentication.where( nut: nut ).first || nil

      if auth_attempt and auth_attempt.authenticated
        render json: {msg: 'yep', nut: auth_attempt.nut}
      else 
        render json: {msg: 'nope'}
      end
    end

    def loggedin
      render '/sqrl_on_rails/loggedin.html.erb'
    end

    def respond
      # return unless session_id.eql? session[:session_id]
      # return unless is_positive

      redirect_to '/'
    end
  end
end
