class AssetType < ApplicationRecord
  # Direct associations

  has_one    :asset,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
