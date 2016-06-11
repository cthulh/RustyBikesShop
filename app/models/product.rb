class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments

	 # Calculating an average rating for a product for the #show
  def average_rating
    comments.average(:rating).to_f
  end

end
