class Asset < ApplicationRecord
  # Direct associations

  belongs_to :asset_type

  belongs_to :net_worth

  # Indirect associations

  # Validations
  #asset_type
  validates :asset_type, :presence=> true
  #asset_value: only numbers
  validates :asset_value, :numericality => true
end
