require 'spec_helper.rb'

describe "skill" do
  it "should have its name become titleized" do
    s = Skill.create(name: "rock")
    s.normalize_name
    s.name.should ==("Rock")
  end
end
