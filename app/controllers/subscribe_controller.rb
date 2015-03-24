class SubscribeController < ApplicationController
  before_filter :authenticate_user!



  def new
  end

  def update
    #get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create a customer
    customer = Stripe::Customer.create(
      :card => token,
      :plan => 2499,
      :email => current_user.email
      )

      current_user.subscribed = true
      current_user.stripeid = customer.id
      current_user.save

      redirect_to spinoffs_index_path, :notice => "Your subscription was setup! You may now access the Spin-off subscription list!"
  end
end
