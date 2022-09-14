class Api::V1::CustomerSubscriptionsController < ApplicationController

  def show
    customer = Customer.find(params[:id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end
end
