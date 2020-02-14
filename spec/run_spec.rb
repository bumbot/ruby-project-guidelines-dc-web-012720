#require_relative './lib/user.rb'
require_relative '../config/environment'
require_relative '../db/seeds.rb'

describe "Debtflix" do
    it "returns true when there are no User instances" do
        expect(User.all.length).to be(0)
    end
    let (:user) {User.new(fullname: "Ann", username: "annie", password:"hey", country:"USA", status: true)}
   
    it "returns true when a User instance has been instantiated" do
        
        expect(user.fullname).to eq("Ann")
    end

end