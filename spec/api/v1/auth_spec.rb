require 'rails_helper'
require 'pry'

# TODO check if config file can have default credential for both create use 
# and test login
describe "Test it actually works" do

    it "Create, Check and Delete Test User Credentials" do
      email = 'test_user@mail.com'
      password = '123456789'
      # Create User 
      post "/api/v1/auth/register",
      params: {email: email, password: password}
      expect(response).to be_success

      # Set Access Token
      post '/api/v1/auth/sign_in',
        params: {email: email, password: password}
      expect(response).to be_success

      # Delete User, This is not actually necessaty rspec takes care of cleaning
      # up for you
      delete '/api/v1/auth',
      params: {
        "access-token": response.header["access-token"] , 
        client: response.header["client"], 
        uid: response.header["uid"]
      }
      expect(response).to be_success
    end
end
