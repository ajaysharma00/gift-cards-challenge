class GiftCard
  include Mongoid::Document
  field :sender, type: String
  field :receiver, type: String
  field :description, type: String
  field :value, type: BigDecimal

  def self.report

    report = {}

    GiftCard.all.distinct(:sender).each do |sender_name|
      report[sender_name] = {
        :gifts_given => GiftCard.where( sender: sender_name ).distinct( :receiver ).count
      }
    end

    report
  end
end
