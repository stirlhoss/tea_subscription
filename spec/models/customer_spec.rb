require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many :subscriptions }

  describe 'factories' do
    it 'can make a customer with a factory' do
      cust = create(:customer)

      expect(cust.first_name).to be_a String
      expect(cust.last_name).to be_a String
      expect(cust.email).to be_a String
      expect(cust.address).to be_a String
    end
  end
end
