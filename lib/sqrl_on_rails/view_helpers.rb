require 'rqrcode'
require 'securerandom'
require 'rbnacl/libsodium'
require "base64"

module SqrlOnRails
  module ViewHelpers

    def sqrlize
      client_ip = IPAddr.new(request.remote_ip).to_s
      nut = "#{RbNaCl::Random.random_bytes}#{Time.now.to_i}#{client_ip}#{session[:session_id]}"
      nut = RbNaCl::Hash.sha256 nut
      nut = Base64.urlsafe_encode64 nut, padding:false

      cookies[:nut] = nut

      #TODO server sfn
      url_options = Rails.application.config.sqrl_url_options
      sqrl_url = "sqrl://#{url_options[:host]}:#{url_options[:port]}/sqrl_auth?nut=#{nut}"

      qr = RQRCode::QRCode.new sqrl_url, size: 4, level: :l

      SqrlAuthentication.create! nut: nut, session: session[:session_id], client_ip: client_ip

      render partial: 'sqrl_on_rails/sqrlqrcode', locals: {qrcode_url: qr.as_png.to_data_url}
    end
  end
end
