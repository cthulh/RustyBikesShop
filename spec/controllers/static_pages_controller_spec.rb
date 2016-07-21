require 'rails_helper'
#test StaticPagesController
describe StaticPagesController, type: :controller do

	context "GET #index" do
		#load index page
		before do
			get :index
		end
		#check if it loads successfully with an http status 200
		it "respond successfully with an HTTP 200 status code" do
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
		#check if it loads the index template
		it "renders the index template" do
			expect(response).to render_template("index")
		end

	end
	
end