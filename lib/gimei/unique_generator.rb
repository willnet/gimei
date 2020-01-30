class Gimei
  class RetryLimitExceeded < StandardError; end

  class UniqueGenerator
    def self.define_unique_method(method_name, previous_result_key = method_name)
      define_method method_name do |*args|
        max_retries.times do
          result = if args.length > 0
                     Gimei.public_send(method_name, *args)
                   else
                     Gimei.public_send(method_name)
                   end

          next if previous_results[previous_result_key].include?(result.to_s)

          previous_results[previous_result_key] << result.to_s
          return result
        end

        raise RetryLimitExceeded, "Retry limit exceeded for #{method_name}"
      end
    end

    def initialize(max_retries)
      @max_retries = max_retries
      @previous_results = Hash.new { |hash, key| hash[key] = Set.new }
    end

    def clear(key = nil)
      if key
        previous_results(key.to_sym).clear
      else
        previous_results.clear
      end
    end

    %i[name last first address prefecture city town].each do |method_name|
      define_unique_method(method_name)
    end

    %i[male female kanji hiragana katakana romaji].each do |method_name|
      define_unique_method(method_name, :name)
    end

    private

    attr_reader :max_retries, :previous_results
  end
end
