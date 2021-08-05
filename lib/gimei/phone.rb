class Gimei
  class UnknownPhoneType < StandardError; end

  class Phone
    attr_reader :type

    def initialize(hyphen: false, type: nil)
      @type = type ? type : %i[mobile fixed].sample(random: Gimei.config.rng)
      @hyphen = hyphen

      case @type
      when :fixed
        @number = Phone.fixed_phone_number
      when :mobile
        @number = Phone.mobile_phone_number
      else
        raise UnknownPhoneType, "Unknown phone type for #{type}"
      end
    end

    def to_s
      @hyphen ? @number : @number.gsub('-', '')    
    end

    private

    def self.fixed_phone_number
      num = "0" + Gimei.config.rng.rand.to_s.slice(2, 9) # num => '0999999999'

      # insert 2 of '-'
      kind = (num.slice(1, 1).to_i) % 4 + 1              # kind => 1..4 
      num.insert(kind + 1, '-')                          # num => '09-99999999'  .. '09999-99999'
      num.insert(       7, '-')                          # num => '09-9999-9999' .. '09999-9-9999'
    end

    def self.mobile_phone_number
      num = Gimei.config.rng.rand.to_s.slice(2, 8)       # num => '99999999'

      head = %w[7 8 9].sample(random: Gimei.config.rng)  # head => 7..9
      num.insert(0, "0#{head}0-")                        # num => '090-99999999'
      num.insert(8, '-')                                 # num => '090-9999-9999'
    end
  end
end
