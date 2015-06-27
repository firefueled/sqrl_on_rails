module SqrlOnRails
  class SqrlOnRailsController < ::ApplicationController
  	skip_before_filter  :verify_authenticity_token

    def signed_challenge
  		signed_challenge = params[:signed_challenge]
  		server_url = params[:server_url]

  		p signed_challenge
  		p server_url

      render status: :ok unless valid?

      respond
    end

    def valid?
      true
    end

    def am_loggedin
      p "param=#{params[:session_id]}"
      p "session=#{session[:session_id]}"

      render head unless params[:session_id]

      # if session[:session_id].eql? params[:session_id] 
      render json: {status: :ok, session_id: session[:session_id]}
      # end
      # else
      # end
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