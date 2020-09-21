require_relative '../lib/caesar_cipher.rb'

describe "the caesar_cipher method" do
    it "should return the string with all letters remplaced by the choosen next letter" do
        expect(caesar_cipher("What a string!", 5)).to eq("Bmfy f xywnsl!")
        expect(caesar_cipher("AbwXy", 3)).to eq("DezAb")
    end
    
    it "sould return an error message if there are incorrect values" do
        expect(caesar_cipher(34, 3)).to eq("T'as pas compris le principe ou t'es juste relou ?")
        expect(caesar_cipher("de", "rfe")).to eq("T'as pas compris le principe ou t'es juste relou ?")
    end
end