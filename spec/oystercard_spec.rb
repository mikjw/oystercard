require 'oystercard'

describe Oystercard do

  it 'has a balance' do
    expect(subject.balance).to eq(0)
  end

  it 'tops up a card with the amount as argument' do
    expect{subject.top_up(89)}.to change {subject.balance}.by(89)
  end

  it 'raises error when top-up would exceed maximum balance' do
    max_bal = Oystercard::MAXIMUM_BALANCE
    message = "Top-up failed - maximum balance of #{max_bal} exceeded"
    expect { subject.top_up(max_bal + 1) }.to raise_error(message)
  end

  it 'touches in' do
    subject.top_up(5)
    subject.touch_in
    expect(subject.in_use).to be(true)
  end

  it 'throws an error if the card has insufficient balance' do
    expect {subject.touch_in}.to raise_error "Insufficient funds for journey"
  end

  it 'touches out' do
    subject.touch_out
    expect(subject.in_use).to be(false)
  end

  it 'deducts fare on touch out' do
    min_fare = Oystercard::MIN_BALANCE
    expect { subject.touch_out }.to change { subject.balance }.by(-min_fare)
  end

end


