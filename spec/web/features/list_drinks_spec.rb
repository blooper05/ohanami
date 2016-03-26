require 'features_helper'

describe 'List drinks' do
  it 'displays each drink on the page' do
    visit '/drinks'

    within '#drinks' do
      expect(page).to have_css('.drink', count: 2)
    end
  end
end
