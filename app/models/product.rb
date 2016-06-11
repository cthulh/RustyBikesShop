class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments
	validates :name, presence: true
	validates :description, presence: true
	validates :colour, presence: true
	validates :price, presence: true

	# Calculating an average rating for a product for the #show
  def average_rating
    comments.average(:rating).to_f
  end

end
