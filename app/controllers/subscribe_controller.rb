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

  def create
    @current_user.subscribed = current_user.subscribed.new(params[:current_user.subscribed])
 
    respond_to do |format|
      if current_current_user.subscribed.save
        # Tell the current_user.subscribedMailer to send a welcome email after save
        current_user.subscribedMailer.welcome_email(@current_user.subscribed).deliver_later
 
        format.html { redirect_to(@current_user.subscribed, notice: 'current_user.subscribed was successfully created.') }
        format.json { render json: @current_user.subscribed, status: :created, location: @current_user.subscribed }
      else
        format.html { render action: 'new' }
        format.json { render json: @current_user.subscribed.errors, status: :unprocessable_entity }
      end
    end
  end

end
