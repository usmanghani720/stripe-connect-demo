module ApplicationHelper

    def stripe_button_link
        stripe_url = "https://connect.stripe.com/express/oauth/authorize"
        redirect_uri = stripe_connect_url
        client_id = 'ca_GNMJI68nk1rDCZHkkRQJ2ElN4RUdeUlZ'
      
        "#{stripe_url}?redirect_uri=#{redirect_uri}&client_id=#{client_id}"
      end
end