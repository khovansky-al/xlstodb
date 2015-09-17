require 'active_record'

class Advert < ActiveRecord::Base
  enum field: [:declarant, :advtype, :permission, :road,
               :house, :letter, :housing, :clarification,
               :crossroad, :crossroadhouse, :lettercrossroadhouse,
               :housingcrossroadhouse, :clarcrossroadhouse]
end
