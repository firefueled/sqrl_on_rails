require 'rqrcode'
require 'securerandom'
require 'rbnacl/libsodium'

module SqrlOnRails
  module ViewHelpers
    
    def sqrlize

      nut = random_nut
      p 'session'
      p session
      csrf = session[:_csrf_token].delete '='

      sqrl_url = "sqrl://www.example.com/sqrl?nut=#{nut}&_csrf_token=#{csrf}"

      qr = RQRCode::QRCode.new sqrl_url, size: 6, level: :l

      SqrlAuthentication.create! nut: nut, csrf: csrf, session: session[:session_id]

      output = '<img class="qr" src="' + qr.as_png.to_data_url + '" title="Click here to login"></img>'
      output = output.html_safe if output.respond_to? :html_safe
    end

    def random_nut
      SecureRandom.urlsafe_base64.to_s
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
