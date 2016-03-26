RSpec.describe Drink do
  it 'can be initialised with attributes' do
    drink = Drink.new(name: 'sake')
    expect(drink.name).to eq('sake')
  end
end
