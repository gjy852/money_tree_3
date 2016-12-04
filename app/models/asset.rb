class Asset < ApplicationRecord
  # Direct associations

  belongs_to :asset_type

  belongs_to :net_worth

  # Indirect associations

  # Validations

end
