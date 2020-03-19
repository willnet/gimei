class Gimei
  class Config
    attr_accessor :rng

    def initialize(rng: Random.new)
      @rng = rng
    end
  end
end
