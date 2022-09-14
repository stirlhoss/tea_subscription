require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to :tea }
    it { should belong_to :customer }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :status }
    it { should validate_presence_of :frequency }
    it { should validate_presence_of :customer_id }
    it { should validate_presence_of :tea_id }
  end

  describe 'factories' do
    it 'can make a Subscription with a factory' do
      tea = create(:tea)
      cust = create(:customer)
      sub = create(:subscription, tea_id: tea.id, customer_id: cust.id)

      expect(sub.title).to be_a String
      expect(sub.price).to be_a Float
      expect(sub.status).to eq 'Active' || 'Canceled'
      expect(sub.frequency).to eq 12
    end
  end
end
