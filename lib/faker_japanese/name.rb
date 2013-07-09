# -*- coding:utf-8 -*
require 'yaml'

module FakerJapanese
  class Name
    NAMES = YAML.load_file(File.expand_path(File.join('..', '..', 'data', 'names.yml'), __FILE__))

    class First
      def initialize
        @name = NAMES['first_name'].sample
      end

      def kanji
        @name[0]
      end

      def hiragana
        @name[1]
      end

      def katakana
        @name[2]
      end
    end

    class Last
      def initialize
        @name = NAMES['last_name'].sample
      end

      def kanji
        @name[0]
      end

      def hiragana
        @name[1]
      end

      def katakana
        @name[2]
      end
    end

    def initialize
      @first = First.new
      @last = Last.new
    end

    def kanji
      "#{last.kanji} #{first.kanji}"
    end

    def hiragana
      "#{last.hiragana} #{first.hiragana}"
    end

    def katakana
      "#{last.katakana} #{first.katakana}"
    end

    def first
      @first
    end

    def last
      @last
    end

    class << self
      def kanji
        name = new
        "#{name.last.kanji} #{name.first.kanji}"
      end

      def hiragana
        name = new
        "#{name.last.hiragana} #{name.first.hiragana}"
      end

      def katakana
        name = new
        "#{name.last.katakana} #{name.first.katakana}"
      end

      def first
        new.first
      end

      def last
        new.last
      end
    end
  end
end
