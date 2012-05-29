require 'spec_helper.rb'

describe UsersController do 

  describe "unauthenticated" do 
    before(:each) do 
      @user = FactoryGirl.create(:user)
    end

    it "should be able to access show" do
      get 'show', id: @user.id
      response.should be_success
    end

    it "should be able to access list" do
      get 'index'
      response.should_not be_success
    end
  end

end

