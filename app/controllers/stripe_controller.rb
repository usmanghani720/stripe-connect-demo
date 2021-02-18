class StripeController < ApplicationController
  require "stripe"
  require 'httparty'
  Stripe.api_key = 'sk_test_P9ZSzx6MHQxlxqRd1ZyMOKwZ'
    before_action :authenticate_user!
    def connect
      response = HTTParty.post("https://connect.stripe.com/oauth/token",
        query: {
          client_secret: 'sk_test_P9ZSzx6MHQxlxqRd1ZyMOKwZ',
          code: params[:code],
          grant_type: "authorization_code",
        }
      )
      if response.parsed_response.key?("error")
          redirect_to payments_new_path
          #notice: response.parsed_response["error_description"]
      else
        stripe_user_id = response.parsed_response["stripe_user_id"]
        current_user.update_attribute(:stripe_user_id, stripe_user_id)
        Stripe::Account.update_capability(
          stripe_user_id,
          'card_payments',
          {requested: true},
        )
        redirect_to payments_new_path
        #notice: 'User successfully connected with Stripe!'
      end
    end

    def dashboard
      account = Stripe::Account.retrieve(current_user.stripe_user_id)
      login_links = account.login_links.create
  
      redirect_to login_links.url
    end
end
