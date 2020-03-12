class Gimei
  class RetryLimitExceeded < StandardError; end

  class UniqueGenerator
    class << self
      def previous_results
        @previous_results ||= Hash.new { |hash, key| hash[key] = Set.new }
      end
    end

    def initialize(max_retries)
      @max_retries = max_retries

      %i[name last first address prefecture city town].each do |method_name|
        define_unique_method(method_name)
      end

      %i[male female kanji hiragana katakana romaji].each do |method_name|
        define_unique_method(method_name, :name)
      end
    end

    def previous_results
      self.class.previous_results
    end

    def clear(key = nil)
      if key
        previous_results(key.to_sym).clear
      else
        previous_results.clear
      end
    end

    def define_unique_method(method_name, previous_result_key = method_name)
      define_singleton_method method_name do |*args|
        max_retries.times do
          result = Gimei.public_send(method_name, *args)

          next if previous_results[previous_result_key].include?(result.to_s)

          previous_results[previous_result_key] << result.to_s
          return result
        end

        raise RetryLimitExceeded, "Retry limit exceeded for #{method_name}"
      end
    end

    private

    attr_reader :max_retries
  end
end
