require 'rails_helper'

describe StaticPagesController, type: :controller do
	context "GET #index" do
		before do
			get :index
		end

		it "renders the index template" do
			expect(response).to render_template("index")
		end
	end
	
end