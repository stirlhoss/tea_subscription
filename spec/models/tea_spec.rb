require 'rails_helper'

RSpec.describe Tea, type: :model do
  it { should have_many :subscriptions }

  describe 'factories' do
    it 'can make a tea with a factory' do
      tea = create(:tea)

      expect(tea.title).to be_a String
      expect(tea.description).to be_a String
      expect(tea.temperature).to be_a Float
      expect(tea.brew_time).to be_a Integer
    end
  end
end
