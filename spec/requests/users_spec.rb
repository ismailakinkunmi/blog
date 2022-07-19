require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET users' do
    it "The index action should render 'index.html.erb' view" do
      get '/users'
      expect(response).to render_template('index')
    end

    it "the index action should render 'list of all users' " do
      get '/users'
      expect(response.body).to include('list of all users')
      expect(response).to have_http_status(200)
    end
  end

  describe 'Get user by id' do
    it 'render show.html.erb view' do
      get '/users/1'
      expect(response).to render_template('show')
    end

    it 'should render a user by id' do
      get '/users/1'
      expect(response.body).to include('Get user by id')
    end
  end
end
