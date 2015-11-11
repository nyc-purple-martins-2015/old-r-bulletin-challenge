require 'spec_helper'
require 'rails_helper'

describe Category, type: :model do

  let(:user) { FactoryGirl.create :user}
  let(:category) { FactoryGirl.create :category}

  context 'validations' do
    it 'has many topics' do
      expect(Category.reflect_on_association(:topics).macro).to eq(:has_many)
    end
  end

end
