require 'test_helper'

class GiftCardTest < ActiveSupport::TestCase

  # called before every single test
  setup do
    GiftCard.delete_all
    GiftCard.new( { :sender => "Igor", :receiver => "Paulo", :descripion => "Gift for his birthday", :value => 3.01 } ).save
    GiftCard.new( { :sender => "Paulo", :receiver => "Jose", :descripion => "Gift for his birthday", :value => 2.99 } ).save
    GiftCard.new( { :sender => "Igor", :receiver => "Maria", :descripion => "Easter", :value => 4.01 } ).save
  end

  # called after every single test
  def teardown

  end

  test "size of distinct values for a single sender" do
    report = GiftCard.report

    assert_equal 2, report.size, "The size of sender must be '2'"
  end

  test "GiftCard.report keys" do
    report = GiftCard.report

    assert_equal ["Igor", "Paulo"], report.keys, "The keys of GiftCard.report must be 'Igor' and 'Paulo'"
  end

end
