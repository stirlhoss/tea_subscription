class Api::V1::SubscriptionsController < ApplicationController

  def create
    sub = Subscription.new(subscription_params)
    if sub.save
      render json: SubscriptionSerializer.new(sub), status: :created
    else
      render json: { errors: { details: 'Subscription could not be created with this data.' } }, status: :bad_request
    end
  end

  def update
    sub = Subscription.find(params[:id])
    sub.update(status: params[:status])
    render json: { response: 'Subscription has been cancelled.' }
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :quantity, :customer_id, :tea_id)
  end
end
