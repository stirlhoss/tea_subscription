require 'rails_helper'

RSpec.describe 'Customer Subscription Request' do
  it 'can create a subscription for a customer' do
    create_list(:customer, 3)
    sub = create(:subscription, status: 'Active')
    tea_1 = create(:tea)
    tea_2 = create(:tea)
    tea_3 = create(:tea)
    ts_1 = create(:subscription_tea, subscription_id: sub.id, tea_id: tea_1.id)

    post customer_subscription_path

  end
end
