class GiftCard
  include Mongoid::Document
  field :sender, type: String
  field :receiver, type: String
  field :description, type: String
  field :value, type: Float

  def self.report

    report = {}

    GiftCard.all.distinct(:sender).each do |sender_name|
      report[sender_name] = {
        :qty_friends => GiftCard.where( sender: sender_name ).distinct( :receiver ).count,
        :gifts_given => GiftCard.where( sender: sender_name ).count,
        :spent       => GiftCard.where( sender: sender_name ).sum( :value )
      }
    end

    report
  end

  def self.amount sender_name, receiver_name
    GiftCard.where( sender: sender_name, receiver: receiver_name ).sum( :value )
  end

end
