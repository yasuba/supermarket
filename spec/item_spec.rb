require 'item'

describe Item do
  let(:item) {Item.new(['Apple', 5])}

  it 'should be for sale once initialized' do
    expect(item.for_sale?).to eq true
  end

  it 'should have a price' do
    expect(item.price).to eq(5)
  end

  it 'should have a name' do
    expect(item.name).to eq 'Apple'
  end

  it 'should not be available once sold' do
    item.buy!
    expect(item.for_sale?).to eq false
  end

  it 'can be returned' do
    item.buy!
    item.return!
    expect(item.for_sale?).to eq true
  end

end