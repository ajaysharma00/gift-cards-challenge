require 'test_helper'

class GiftCardTest < ActiveSupport::TestCase

  # called before every single test
  setup do
    GiftCard.delete_all
    GiftCard.new( { :sender => "Igor", :receiver => "Paulo", :descripion => "Gift for his birthday", :value => 3.01 } ).save
    GiftCard.new( { :sender => "Paulo", :receiver => "Jose", :descripion => "Gift for his birthday", :value => 2.99 } ).save
    GiftCard.new( { :sender => "Igor", :receiver => "Maria", :descripion => "Easter", :value => 4.01 } ).save
    GiftCard.new( { :sender => "Igor", :receiver => "Paulo", :descripion => "He is a good friend", :value => 1.00 } ).save
  end

  # called after every single test
  def teardown

  end

  test "GiftCard.report size" do
    assert_equal 2, GiftCard.report.size, "The size of GiftCard.report must be '2'"
  end

  test "GiftCard.report keys" do
    assert_equal ["Igor", "Paulo"], GiftCard.report.keys, "The keys of GiftCard.report must be 'Igor' and 'Paulo'"
  end

  test "How many people some person has given a gift" do
    assert_equal 2, GiftCard.report["Igor"][:qty_friends], "Igor given gifts only for two people"
  end

  test "How many gifts some person has given" do
    assert_equal 3, GiftCard.report["Igor"][:gifts_given], "Igor given two gifts"
  end

  test "How much money someone spent" do
    assert_equal 8.02, GiftCard.report["Igor"][:spent], "Igor spent $7.02"
  end

  test "The amount of money that person has sent to someone" do
    assert_equal 4.01, GiftCard.spent( "Igor", "Paulo" ), "Igor spent $4.01 sending gifts to Paulo"
  end

end
