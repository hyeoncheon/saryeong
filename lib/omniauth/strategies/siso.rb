require 'omniauth'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Siso < OmniAuth::Strategies::OAuth2
      option :name, "siso"

      # default values
      option :client_options, {
        :site => "http://sandbox.example.com",
        :authorize_url => "/siso/oauth/authorize",
        :token_url => "/siso/oauth/token"
      }

      uid { raw_info['id'] }

      info do
        {
          :name => raw_info['name'],
          :email => raw_info['mail'],
          :nickname => raw_info['mail'],
          :image => raw_info['image'],
          :phone => raw_info['phone'].to_s + ' ' + raw_info['mobile'].to_s
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/siso/api/v1/me.json').parsed
      end
    end
  end
end
