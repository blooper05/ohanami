require_relative '../../../../apps/web/controllers/drinks/index'

RSpec.describe Web::Controllers::Drinks::Index do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  before { DrinkRepository.clear }

  let!(:drink) do
    DrinkRepository.create(Drink.new(name: 'sake', country: 'japan'))
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all drinks' do
    action.call(params)
    expect(action.exposures[:drinks]).to eq [drink]
  end
end
