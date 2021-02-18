class PaymentsController < ApplicationController

	require "stripe"
  Stripe.api_key = 'sk_test_P9ZSzx6MHQxlxqRd1ZyMOKwZ'

  before_action :authenticate_user!

  def new
  end

  def create
  end

  def thanks
  end

end