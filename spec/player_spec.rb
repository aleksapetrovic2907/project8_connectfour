require "./lib/player.rb"
require "rspec"

RSpec.describe Player do
    context "creating a new player" do
        subject { Player.new("John", "X") }
        describe "#initialize" do
            it "should init the name" do
                expect(subject.name).to eq("John")
            end
    
            it "should init piece" do
                expect(subject.piece).to eq("X") 
            end
        end
    end
end