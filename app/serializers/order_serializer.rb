class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :time_checkin,
             :time_checkout, :status, :code, :coin_using
end
