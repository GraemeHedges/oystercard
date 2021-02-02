require 'oystercard'

describe Oystercard do

  describe "#balance" do
    it "returns the cards current balance" do
      expect(subject.balance).to eq 0
    end  
  end

  describe "#top-up" do
    it "adds money to the card" do
      expect{subject.top_up 1}.to change{subject.balance}.by 1
    end

    it "raises an error if the new balance would exceed the limit" do
      subject.top_up(Oystercard::TOP_UP_LIMIT)
      expect{subject.top_up 1}.to raise_error "You have exceeded the £#{Oystercard::TOP_UP_LIMIT} limit"
    end
  end

  describe "#deduction" do
    it "deducts the fare amount from the total balance" do
      subject.top_up (50)
      expect{subject.deduct 20}.to change {subject.balance}.by -20       
    end
  end

end