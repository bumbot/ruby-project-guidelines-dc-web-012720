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


describe "Shows" do 
    it "makes sure there are no shows in the database" do 
        expect(Show.all.length).to be(0)
    end

    let(:show) {Show.find_or_create_by(title: "Breaking Bad", plot: "Man turns crazy", rating: 8.1, genre: "Drama", runtime: 45, network_id: 0)}
    it "creates a new Show instance with the title Breaking Bad" do
        expect(show.title).to eq("Breaking Bad")
    end

    it "updates the title of the show" do 
        show.update(title: "Breaking Good")
        expect(show.title).to eq("Breaking Good")
    end
end