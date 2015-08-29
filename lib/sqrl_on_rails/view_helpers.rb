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

      sqrl_url = "sqrl://www.example.com/sqrl?nut=#{nut}"

      qr = RQRCode::QRCode.new sqrl_url, size: 4, level: :l

      SqrlAuthentication.create! nut: nut, session: session[:session_id], client_ip: client_ip

      render partial: 'sqrl_on_rails/sqrlqrcode', locals: {qrcode_url: qr.as_png.to_data_url}
    end

    def decrypt_session_cookie(cookie, key)

      # Rails.application.config.session_store :cookie_store, key: '_testapp_session')
      cookie = CGI::unescape(cookie)
      
      # Default values for Rails 4 apps
      key_iter_num = 1000
      key_size     = 64
      salt         = "encrypted cookie"         
      signed_salt  = "signed encrypted cookie"

      p Rails.application.secrets.secret_key_base
     
      key_generator = ActiveSupport::KeyGenerator.new(Rails.application.secrets.secret_key_base, iterations: key_iter_num)
      secret = key_generator.generate_key(salt)
      sign_secret = key_generator.generate_key(signed_salt)
     
      encryptor = ActiveSupport::MessageEncryptor.new(secret, sign_secret)
      p encryptor.decrypt_and_verify(cookie)
    end
  end
end
