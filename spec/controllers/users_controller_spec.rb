require 'rails_helper'

describe UsersController do
  describe 'GET #new' do
    it 'responds with status code 200' do
      get :new
      expect(response).to have_http_status 200
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'responds with status code 302' do
      post(:create, params: {user: {name: "joe", email: "joe@joe.com", password: "joe", password_confirmation: "joe", phone_number: "19998887777"}})
      expect(response).to have_http_status 302
    end

    it 'creates a new user in the database' do
      expect{post(:create, params: {user: {name: "joe", email: "joe@joe.com", password: "joe", password_confirmation: "joe", phone_number: "19998887777"}})}.to change{User.all.length}.by(1)
    end

    it "assigns the newly created user to the session" do
      post(:create, params: {user: {name: "joe", email: "joe@joe.com", password: "joe", password_confirmation: "joe", phone_number: "19998887777"}})
      expect(session[:user_id]).to eq(User.last.id)
    end

    it "redirects to profile" do
      post(:create, params: {user: {name: "joe", email: "joe@joe.com", password: "joe", password_confirmation: "joe", phone_number: "19998887777"}})
      expect(response).to redirect_to user_path(session[:user_id])
    end
  end


end
