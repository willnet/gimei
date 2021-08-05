require 'forwardable'
require 'yaml'
require 'gimei/version'
require 'gimei/name'
require 'gimei/address'
require 'gimei/phone'
require 'gimei/unique_generator'
require 'gimei/config'

class Gimei
  extend Forwardable

  GENDERS = [:male, :female].freeze

  def_delegators :@name, :gender, :kanji, :hiragana, :katakana, :first, :last, :male?, :female?, :romaji
  def_delegators :@address, :prefecture, :city, :town
  alias_method :to_s, :kanji

  attr_reader :name, :address, :phone

  class << self
    extend Forwardable

    def_delegators Gimei::Name, :male, :female
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

    %i[kanji hiragana katakana romaji first last].each do |method_name|
      define_method(method_name) do |gender = nil|
        name(gender).public_send(method_name)
      end
    end

    def address
      Address.new
    end

    def phone(hyphen: false, type: nil)
      Phone.new(hyphen: hyphen, type: type)
    end

    def mobile_phone(hyphen: false)
      Phone.new(hyphen: hyphen, type: :mobile)
    end

    def unique(max_retries = 10_000)
      return @unique if defined? @unique

      @unique = UniqueGenerator.new(self, max_retries)

      %i[name last first hiragana katakana romaji address prefecture city town phone].each do |method_name|
        @unique.define_unique_method(method_name)
      end

      %i[male female kanji].each do |method_name|
        @unique.define_unique_method(method_name, :name)
      end

      @unique.define_unique_method(:mobile_phone, :phone)

      @unique
    end

    def config
      @config ||= Config.new
    end
  end


  def initialize(gender = nil, phone_hyphen: false, phone_type: nil)
    @name = Name.new(gender)
    @address = Address.new
    @phone = Phone.new(hyphen: phone_hyphen, type: phone_type)
  end
end
