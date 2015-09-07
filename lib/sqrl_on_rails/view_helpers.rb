require 'rqrcode'
require 'securerandom'
require 'rbnacl/libsodium'

module SqrlOnRails
  module ViewHelpers
    
    def sqrlize

      # client ip will be 0.0.0.0 when not over ssl
      client_ip = IPAddr.new("0.0.0.0").to_s
      client_ip = IPAddr.new(request.remote_ip).to_s if request.ssl?

      # 20 bytes of entropy. '='s are not present
      nut = SecureRandom.urlsafe_base64 160/8
      cookies[:nut] = nut

      sqrl_url = "sqrl://www.example.com/sqrl?nut=#{nut}"

      qr = RQRCode::QRCode.new sqrl_url, size: 4, level: :l

      SqrlAuthentication.create! nut: nut, session: session[:session_id], client_ip: client_ip

      render partial: 'sqrl_on_rails/sqrlqrcode', locals: {qrcode_url: qr.as_png.to_data_url}
    end
  end
end
