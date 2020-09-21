require_relative '../lib/word_counter.rb'

describe "the word_counter method" do
    it "should return the number of occurencies of every words in a string" do
        expect(word_counter("Howdy partner, sit down! How's it going?")).to eq({"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1})
    end
    
end