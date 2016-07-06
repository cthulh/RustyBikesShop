require 'rails_helper'

describe Product do

	context "when the product has comments" do

		before do
			@product = Product.create!(name: "race bike", description: "brown", colour: "brown", price: 1.2)
			@user = User.create!(first_name: "john", last_name: "john", email: "jojo@jojo.jo", password: "jojojo666")
			@product.comments.create!(rating: 1, user: @user, body: "Terrible bike!")
			@product.comments.create!(rating: 3, user: @user, body: "Average bike!")
			@product.comments.create!(rating: 5, user: @user, body: "Superb bike!")
		end

		it "return an average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end

		it "is not valid" do
			expect(Product.new(description: "new bike!")).not_to be_valid
		end

	end

end