require 'rails_helper'

RSpec.describe 'Subscription Request' do
  describe 'happy path' do
    it 'can create a subscription for a customer' do
      cust = create(:customer)
      tea = create(:tea)

      sub_params = {
        title: "tea time",
        price: 25.55,
        status: "Active",
        frequency: 5,
        customer_id: cust.id,
        tea_id: tea.id
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post api_v1_subscriptions_path, headers: headers, params: JSON.generate(sub_params)

      expect(response).to be_successful
      expect(response.status).to eq 201

      created_sub = Subscription.last

      expect(created_sub).to be_a Subscription
    end

    it 'can cancel a subscription' do
      cust = create(:customer)
      tea = create(:tea)
      sub = create(:subscription, customer_id: cust.id, tea_id: tea.id)

      sub_params = {
        id: sub.id,
        status: 'Cancelled'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      patch api_v1_subscription_path(sub), headers: headers, params: JSON.generate(sub_params)

      updated_sub = Subscription.last

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(updated_sub.status).to eq 'Cancelled'
    end
  end

  describe 'sad path' do
    it 'errors when the correct information is not available' do
      cust = create(:customer)
      tea = create(:tea)

      sub_params = {
        price: 25.55,
        status: 'Active',
        frequency: 5,
        customer_id: cust.id,
        tea_id: tea.id
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post api_v1_subscriptions_path, headers: headers, params: JSON.generate(sub_params)

      expect(response).to_not be_successful
      expect(response.status).to eq 400
    end
  end
end
