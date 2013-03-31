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
    senders = GiftCard.senders

    assert_equal 2, senders.size, "The size of sender must be '2'"
  end

end
