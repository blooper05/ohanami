require_relative '../../../../apps/web/views/drinks/index'

RSpec.describe Web::Views::Drinks::Index do
  let(:exposures) { Hash[drinks: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/drinks/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #drinks' do
    expect(view.drinks).to eq exposures.fetch(:drinks)
  end

  describe 'when there are no drinks' do
    it 'shows a placeholder message' do
      expect(rendered).to include('<p class="placeholder">There are no drinks yet.</p>')
    end
  end

  describe 'when there are drinks' do
    let(:drink1) { Drink.new(name: 'sake', country: 'japan') }
    let(:drink2) { Drink.new(name: 'beer', country: 'japan') }

    let(:exposures) { Hash[drinks: [drink1, drink2]] }

    it 'lists them all' do
      expect(rendered.scan(/class="drink"/).count).to eq 2
      expect(rendered).to include('sake')
      expect(rendered).to include('beer')
    end

    it 'hides the placeholder message' do
      expect(rendered).not_to include('<p class="placeholder">There are no drinks yet.</p>')
    end
  end
end
