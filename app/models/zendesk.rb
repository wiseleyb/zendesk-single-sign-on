# Using JWT from Ruby is straight forward. The below example expects you to have `jwt`
# in your Gemfile, you can read more about that gem at https://github.com/progrium/ruby-jwt.
# Assuming that you've set your shared secret and Zendesk subdomain in the environment, you
# can use Zendesk SSO from your controller like this example.
require 'securerandom' unless defined?(SecureRandom)

class Zendesk
  ZENDESK_SHARED_SECRET = ENV["ZENDESK_SHARED_SECRET"]
  ZENDESK_SUBDOMAIN     = ENV["ZENDESK_SUBDOMAIN"]

  class << self
    def sign_into_zendesk(user)
      # This is the meat of the business, set up the parameters you wish
      # to forward to Zendesk. All parameters are documented in this page.
      iat = Time.now.to_i
      jti = "#{iat}/#{SecureRandom.hex(18)}"

      payload = JWT.encode({
        :iat   => iat, # Seconds since epoch, determine when this token is stale
        :jti   => jti, # Unique token id, helps prevent replay attacks
        :name  => user.username,
        :email => user.email,
      }, ZENDESK_SHARED_SECRET)

      zendesk_sso_url(payload)
    end

    def zendesk_sso_url(payload, return_to = nil)
      url = "https://#{ZENDESK_SUBDOMAIN}.zendesk.com/access/jwt?jwt=#{payload}"
      url += "&return_to=#{URI.escape(return_to)}" unless return_to.nil?
      url
    end
  end
end
