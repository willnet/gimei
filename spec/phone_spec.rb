# coding: utf-8
require_relative 'spec_helper'

describe 'Gimei::Phone' do

  # PHONE_TAB(for human)
  # ===================================================================
  # case, :type,   :hyphen | length,  regex
  # -------------------------------------------------------------------
  # A,    :fixed,  :false  |     10,  /0[0-9]{8}/
  # B,    :fixed,  :true   |     12,  /0[0-9]{1,4}-[0-9]{1,4}-[0-9]{4}/
  # C,    :mobile, :false  |     11,  /0[789]0[0-9]{8}/
  # D,    :mobile, :true   |     13,  /0[789]0-[0-9]{4}-[0-9]{4}/
  Expected_item_ = Struct.new(:length, :regex)
  PHONE_TAB_  = {
     fixed:  { false: Expected_item_.new( 10, /0[0-9]{8}/                       ),   # case A
               true:  Expected_item_.new( 12, /0[0-9]{1,4}-[0-9]{1,4}-[0-9]{4}/ ) }, # case B
     mobile: { false: Expected_item_.new( 11, /0[789]0[0-9]{8}/                 ),   # case C
               true:  Expected_item_.new( 13, /0[789]0-[0-9]{4}-[0-9]{4}/       ) }  # case D
  }

  # case A
  describe '.new(type: :fixed, hyphen: false)' do
    before do
      @phone    = Gimei::Phone.new(type: :fixed, hyphen: false)
      @expected = PHONE_TAB_[:fixed][:false]
    end

    it '種別が固定電話(:fixed)であること' do
      _(@phone.type       ).must_equal :fixed
    end

    it '固定電話番号（ハイフン無）が返ること' do
      _(@phone.to_s.length).must_equal @expected.length
      _(@phone.to_s       ).must_match @expected.regex
    end
  end

  # case B
  describe '.new(type: :fiexd, hyphen: true)' do
    before do
      @phone    = Gimei::Phone.new(type: :fixed, hyphen: true)
      @expected = PHONE_TAB_[:fixed][:true]
    end

    it '種別が固定電話(:fixed)であること' do
      _(@phone.type       ).must_equal :fixed
    end

    it '固定電話番号（ハイフン有）が返ること' do
      _(@phone.to_s.length).must_equal @expected.length
      _(@phone.to_s       ).must_match @expected.regex
    end
  end

  # case C
  describe '.new(type: :mobile, hyphen: false)' do
    before do
      @phone    = Gimei::Phone.new(type: :mobile, hyphen: false) 
      @expected = PHONE_TAB_[:mobile][:false]
    end

    it '種別が携帯電話(:mobile)であること' do
      _(@phone.type       ).must_equal :mobile
    end

    it '携帯電話番号（ハイフン無）が返ること' do
      _(@phone.to_s.length).must_equal @expected.length
      _(@phone.to_s       ).must_match @expected.regex
    end
  end

  # case D
  describe '.new(type: :mobile, hyphen: true)' do
    before do
      @phone    = Gimei::Phone.new(type: :mobile, hyphen: true)
      @expected = PHONE_TAB_[:mobile][:true]
    end

    it '種別が携帯電話(:mobile)であること' do
      _(@phone.type       ).must_equal :mobile
    end

    it '携帯電話番号（ハイフン有）が返ること' do
      _(@phone.to_s.length).must_equal @expected.length
      _(@phone.to_s       ).must_match @expected.regex
    end
  end

  # case U: unknown type
  describe '.new(type: :unknown)' do
    it '電話種別不明例外(Gimei::UnknownPhoneType)が発生すること' do
      assert_raises Gimei::UnknownPhoneType do
        Gimei::Phone.new(type: :unknown)
      end
    end
  end

  # case default
  describe '.new' do
    before do
      @phone    = Gimei::Phone.new
      @expected = PHONE_TAB_[@phone.type][:false]
      # Above code depends on @phone.type must be one of %i[fixed, mobile].
      # It's okay.  Because case A, C, (or B, D) and U test covers all variation of argument
      # :type(:fixed, :mobile and :unknown).
    end

    it '電話番号（ハイフン無）が返ること' do
      _(@phone.to_s.length).must_equal @expected.length
      _(@phone.to_s       ).must_match @expected.regex
    end
  end
end
