require 'features_helper'

describe 'List drinks' do
  before do
    DrinkRepository.clear
    DrinkRepository.create(Drink.new(name: 'sake', country: 'japan'))
    DrinkRepository.create(Drink.new(name: 'beer', country: 'japan'))
  end

  it 'shows a drink element for each drink' do
    visit '/drinks'
    expect(page).to have_css('.drink', count: 2)
  end
end
