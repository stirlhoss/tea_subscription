require 'rails_helper'

RSpec.describe 'Subscription Request' do
  it 'can create a subscription for a customer' do
    cust = create(:customer)
    tea_1 = create(:tea)
    tea_2 = create(:tea)
    tea_3 = create(:tea)

    sub_params = {
      title: "tea time",
      price: 25.55,
      status: "Active",
      frequency: 5,
      customer_id: cust.id,
      tea_id: tea_1.id
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/subscriptions', headers: headers, params: JSON.generate(subscription: sub_params)

    expect(response).to be_successful

    created_sub = Subscription.last

    expect(created_sub).to be_a Subscription
  end
end
