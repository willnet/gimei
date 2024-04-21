class Gimei
  class RetryLimitExceeded < StandardError; end

  class UniqueGenerator
    class << self
      def previous_results
        @previous_results ||= Hash.new { |hash, key| hash[key] = Set.new }
      end
    end

    def initialize(klass, max_retries)
      @klass = klass
      @max_retries = max_retries
    end

    def previous_results
      self.class.previous_results
    end

    def clear(key = nil)
      case key
      when :family
        previous_results[:last].clear
      when :given
        previous_results[:first].clear
      when nil
        previous_results.clear
      else
        previous_results[key.to_sym].clear
      end
    end

    def define_unique_method(method_name, previous_result_key = method_name)
      define_singleton_method method_name do |*args|
        max_retries.times do
          result = klass.public_send(method_name, *args)

          next if previous_results[previous_result_key].include?(result.to_s)

          previous_results[previous_result_key] << result.to_s
          return result
        end

        raise RetryLimitExceeded, "Retry limit exceeded for #{method_name}"
      end
    end

    private

    attr_reader :klass, :max_retries
  end
end
