require 'oystercard'

describe Oystercard do

  it 'has a balance' do
    expect(subject.balance).to eq(0)
  end

  it 'tops up a card with the amount as argument' do
    expect{subject.top_up(100)}.to change {subject.balance}.by(100)
  end

end
