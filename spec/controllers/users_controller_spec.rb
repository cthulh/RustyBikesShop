require 'rails_helper'
#test Users controller

describe UsersController, type: :controller do
	
	#let(:user) {User.create!(first_name: "john", last_name: "john", email: "jojo@jojo.jo", password: "jojojo666")}
	user = FactoryGirl.create(:user)
	#let(:another_user) {User.create!(first_name: "anotherjohn", last_name: "anotherjohn", email: "anotherjojo@jojo.jo", password: "jojojo666")}
	another_user = FactoryGirl.create(:another_user)
	#let(:admin_user) {User.create!(first_name: "adminjohn", last_name: "adminjohn", email: "adminjojo@jojo.jo", password: "jojojo666", admin: "true")}
	admin_user = FactoryGirl.create(:admin_user)

	describe "GET #show" do

		context "User is logged in" do
			before do
				sign_in user
			end

			it "loads correct user details" do

				get :show, id: user.id
				expect(response).to be_success
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to be == user

			end

			it "loads details of another user (for a nonadmin)" do

				get :show, id: another_user.id
				expect(response).to redirect_to(root_path)
				expect(response).to have_http_status(302)

			end

		end

		context "Admin is logged in" do
			before do
				sign_in admin_user
			end

			it "loads details of another user (for an admin)" do

				get :show, id: user.id
				expect(response).to be_success
				expect(response).to have_http_status(200)

			end

		end

		context "No user is logged in" do

			it "redirects to login" do
				get :show, id: user.id
				expect(response).to redirect_to(new_user_session_path)
			end

		end

	end

end