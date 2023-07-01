class Gimei
  class Config
    attr_accessor :rng

    def initialize(rng: Random)
      @rng = rng
    end
  end
end
