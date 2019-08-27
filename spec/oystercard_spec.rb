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
end
