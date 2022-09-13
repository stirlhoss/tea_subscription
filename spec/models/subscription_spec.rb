require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should have_many :customer_subscriptions }
    it { should have_many :subscription_teas }
    it { should have_many(:customers).through :customer_subscriptions }
    it { should have_many(:teas).through :subscription_teas }
  end

  describe 'factories' do
    it 'can make a Subscription with a factory' do
      sub = create(:subscription)

      expect(sub.title).to be_a String
      expect(sub.price).to be_a Float
      expect(sub.status).to eq 'Active' || 'Canceled'
      expect(sub.frequency).to eq 12
    end
  end
end
