class PaymentsController < ApplicationController

	require "stripe"
  Stripe.api_key = 'sk_test_P9ZSzx6MHQxlxqRd1ZyMOKwZ'

  before_action :authenticate_user!

  def new
    if current_user.stripe_user_id.nil?
      @connected_accounts = Stripe::Account.list().data 
      if @connected_accounts.present?
        @index = @connected_accounts.pluck(:email).find_index(current_user.email)
        if @index.present?
          current_user.update(stripe_user_id: @connected_accounts[@index].id)
        end
      end
    end
  end

  def create
  end

  def thanks
  end

  def error

  end

end