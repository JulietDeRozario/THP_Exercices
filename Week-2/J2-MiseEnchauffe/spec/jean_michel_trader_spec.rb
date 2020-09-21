require_relative '../lib/jean_michel_trader.rb'

describe "the day_trader method" do 
    it "return the best day to buy and to sell to make more benefits" do
        expect(day_trader([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
    end
end