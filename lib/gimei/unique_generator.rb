require 'set'

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
      if key
        previous_results[key.to_sym].clear
      else
        previous_results.clear
      end
    end

    def define_unique_method(method_name, previous_result_key = method_name)
      define_singleton_method method_name do |*args|
        max_retries.times do

          if args.empty? || ! args[0].instance_of?(Hash)                     
            result = klass.public_send(method_name, *args)     # normal args(include no args)
          else
            result = klass.public_send(method_name, **args[0]) # keyword args
          end

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
