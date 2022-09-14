require 'rails_helper'

RSpec.describe Api::V1::CustomerSubscriptionsController do
  it 'should return a list of all of a customers subscriptions' do
    tea1 = create(:tea)
    tea2 = create(:tea)
    customer = create(:customer)
    sub1 = create(:subscription, tea: tea1, customer: customer)
    sub2 = create(:subscription, tea: tea2, customer: customer)

    get api_v1_customer_subscription_path(customer)

    expect(response).to be_successful
    expect(response.status).to eq 200
  end
end
