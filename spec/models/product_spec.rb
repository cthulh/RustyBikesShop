require 'rails_helper'

describe Product do
  context 'when the product has comments' do
    before do
      @product1 = FactoryGirl.create(:product)
      FactoryGirl.create(:comment, product: @product1)
      FactoryGirl.create(:comment, rating: 3, product: @product1)
      FactoryGirl.create(:comment, rating: 5, product: @product1)
    end

    it 'return an average rating of all comments' do
      expect(@product1.average_rating).to be == 3
    end

    it 'is not valid' do
      expect(Product.new(description: 'new bike!')).not_to be_valid
    end
  end
end
