require 'forwardable'
require 'yaml'
require 'gimei/version'
require 'gimei/name'
require 'gimei/address'
require 'gimei/unique_generator'
require 'gimei/config'

class Gimei
  extend Forwardable

  GENDERS = [:male, :female].freeze #: [:male, :female]

  def_delegators :@name,
                 :first, :last, :gender,
                 :kanji, :hiragana, :katakana, :romaji,
                 :male?, :female?,
                 :family, :given
  def_delegators :@address, :prefecture, :city, :town
  alias_method :to_s, :kanji

  attr_reader :name, :address

  class << self
    extend Forwardable

    def_delegators 'Gimei::Name', :male, :female
    def_delegators :address, :prefecture, :city, :town

    def name(gender = nil)
      Name.new(gender)
    end

    def names
      @names ||= YAML.load_file(File.expand_path(File.join('..', 'data', 'names.yml'), __FILE__))
    end

    def addresses
      @addresses ||= YAML.load_file(File.expand_path(File.join('..', 'data', 'addresses.yml'), __FILE__))
    end

    %i[kanji hiragana katakana romaji first last family given].each do |method_name|
      class_eval(<<~METHOD, __FILE__, __LINE__ + 1)
        def #{method_name}(gender = nil)
          name(gender).#{method_name}
        end
      METHOD
    end

    def address
      Address.new
    end

    def unique(max_retries = 10_000)
      return @unique if defined? @unique

      @unique = UniqueGenerator.new(self, max_retries)

      %i[name last first hiragana katakana romaji address prefecture city town].each do |method_name|
        @unique.define_unique_method(method_name)
      end

      @unique.define_unique_method(:family, :last)
      @unique.define_unique_method(:given, :first)

      %i[male female kanji].each do |method_name|
        @unique.define_unique_method(method_name, :name)
      end

      @unique
    end

    def config
      @config ||= Config.new
    end
  end


  def initialize(gender = nil)
    @name = Name.new(gender)
    @address = Address.new
  end
end
