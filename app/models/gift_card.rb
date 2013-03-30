class GiftCard
  include Mongoid::Document
  field :sender, type: String
  field :receiver, type: String
  field :description, type: String
  field :value, type: BigDecimal
end
