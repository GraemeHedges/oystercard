require 'oyster_card'

describe Oyster_card do

    describe "#balance" do
      it "returns the cards current balance" do
        expect(subject.balance).to eq 0
      end  
    end

end