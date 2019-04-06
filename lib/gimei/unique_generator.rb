# this is edited source from stympy/faker
# Copyright (c) 2007-2019 Benjamin Curtis
# https://github.com/stympy/faker/blob/master/License.txt

class UniqueGenerator
  @marked_unique = Set.new

  class << self
    attr_reader :marked_unique
  end

  def initialize(generator, max_retries)
    @generator = generator
    @max_retries = max_retries
    @previous_results = Hash.new { |hash, key| hash[key] = Set.new }
  end

  def method_missing(name, *arguments)
    self.class.marked_unique.add(self)

    @max_retries.times do
      result = @generator.public_send(name, *arguments)

      next if @previous_results[[name, arguments]].include?(result.to_s)

      @previous_results[[name, arguments]] << result.to_s
      return result
    end

    raise RetryLimitExceeded, "Retry limit exceeded for #{name}"
  end

  RetryLimitExceeded = Class.new(StandardError)

  def clear
    @previous_results.clear
  end

  def self.clear
    marked_unique.each(&:clear)
    marked_unique.clear
  end

  def exclude(name, arguments, value)
    values ||= []
    values.each do |value|
      @previous_results[[name, arguments]] << value
    end
  end
end
