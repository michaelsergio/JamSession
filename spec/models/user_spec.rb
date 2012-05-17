require 'spec_helper.rb'

describe User do

  #TODO Figure out how to test a scoped many to many relationship
  it "should get only styles given with the #by_styles scope" do
    me = FactoryGirl.build(:user)
    rock = FactoryGirl.build(:style, name: 'Rock')
    hip = Factory.build(:style, name: 'Hip-Hop')
    styles = User.by_styles('Hip-Hop')
    #styles.each { |style| style.name.should == 'Hip-Hop' }
  end

  it "should get only skills give" do

  end
end
