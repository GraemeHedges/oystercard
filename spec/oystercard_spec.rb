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
      expect{subject.top_up(1)}.to raise_error "You have exceeded the £#{Oystercard::TOP_UP_LIMIT} limit"
    end
  end

  describe "#deduction" do
    it "deducts the fare amount from the total balance" do
      subject.top_up (50)
      expect{subject.deduct 20}.to change {subject.balance}.by -20       
    end
  end

  describe "#touch_in" do
    it "touches the card in" do
      expect(subject.touch_in).to eq true
    end
  end

  describe "#touch_out" do
    it "touches the card out" do
      expect(subject.touch_out).to eq false
    end
  end

  describe "#in_journey?" do

    it "expect a new card not to be on a journey" do
      expect(subject).not_to be_in_journey
    end

    it "when the card is touched in, expect it to be on a journey" do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "when the card is touched out, at the end of a journey, expect it not be on a journey" do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

end