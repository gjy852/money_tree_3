class Asset < ApplicationRecord
  # Direct associations

  belongs_to :asset_type

  belongs_to :net_worth

  belongs_to :user_id

  # Indirect associations

  # Validations
  #user_id: presence
  validates :user_id, :presence => true
  #asset_type
  validates :asset_type, :presence=> true
  #asset_value: only numbers
  validates :asset_value, :numericality => true
  #net_worth_id: presence
  validates :net_worth_id, :presence => true
end
