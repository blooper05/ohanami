module Web::Controllers::Drinks
  class Index
    include Web::Action

    expose :drinks

    def call(params)
      @drinks = DrinkRepository.all
    end
  end
end
