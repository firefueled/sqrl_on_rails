module SqrlOnRails
  class ApplicationController < ActionController::Base
    helper SqrlOnRails::ApplicationHelper
    skip_before_filter  :verify_authenticity_token

    def authenticate
      client = params[:client]
      server = params[:server]
      ids = params[:ids]
      pids = params[:pids]
      urs = params[:urs]

      # validate all that crap

        # extract the nut somehow
        # check if valid
        # change authenticated to true

      # get the user and store id in the session

      if user
        session[:user_id] = user.id
        redirect_to root_url, :notice => "Logged in!"
      end

      render status: :ok unless valid?(signed_challenge, server_url)

      respond
    end

    def valid?(signed_challenge, server_url)
      true
    end

    def am_loggedin
      nut = params[:nut]

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
