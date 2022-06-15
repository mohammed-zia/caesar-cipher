#spec/caesar_cipher_spec.rb

require './lib/caesar'

describe Cipher do
  describe "#caesar_cipher" do
    it "returns the sum of two numbers" do
      cipher = Cipher.new
      expect(cipher.caesar_cipher('What a string!', 5)).to eql("Bmfy f xywnsl!")
    end
  end
end
