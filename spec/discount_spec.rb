require 'discount'

describe Discount do
  let(:bogof) {Discount.new('BOGOF', 0)}

  it 'has a name' do
    expect(bogof.name).to eq 'BOGOF'
  end

end